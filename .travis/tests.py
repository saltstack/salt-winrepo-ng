#!/usr/bin/env python3
import getopt
import git
import glob
import magic
import pycurl as curl
import sys
import traceback
import yaml
from collections import Counter
from io import BytesIO
from jinja2 import Template
from pprint import pprint
from tabulate import tabulate
from urllib.parse import urlparse

TEST_STATUS = True

count_status = Counter()
count_c_types = Counter()
count_http_codes = Counter()

def printd(message=None, extra_debug_data=None):
    global debug
    try:
        if debug:
            sys.stderr.write(message)
            sys.stderr.write("\t--\t")
            pprint(extra_debug_data, stream=sys.stderr)
            return None
    except Exception:
        pass


def usage():
    print("""
    Use either of these flags!
        -h | --help_    Show this help_
        -t | --travis   Run in travis (ignores files that have not been changed in last commit)
        -c | --cron     Run in cron mode
        -d | --debug    Run in debug mode (Prints more info)
    """)


try:
    opts, args = getopt.getopt(
        sys.argv[1:], "tcdh", ["travis", "cron", "debug", "help_"]
    )
    opts = dict(opts)
except getopt.GetoptError:
    usage()
    sys.exit(2)
travis, cron, debug, help_ = (False, False, False, False)

for o in opts:
    if o in ("-t", "--travis"):
        travis = True
    if o in ("-c", "--cron"):
        cron = True
    if o in ("-d", "--debug"):
        debug = True
        printd("ploop", {"extra": "debug", "data": None})
    if o in ("-h", "--help_"):
        help_ = True

printd("opts, args", (opts, args))
printd("travis, cron, debug, help_ ", (travis, cron, debug, help_))

if help_ or len(opts) < 1 and len(args) < 1:
    usage()
    exit(0)

##################


def process_each(softwares):
    global TEST_STATUS
    # pprint(softwares)
    for s, software in softwares.items():
        try:
            if software.get("skip_urltest", False):
                continue
        except KeyError:
            pass
        for v, version in software.items():
            try:
                if version.get("skip_urltest", False):
                    count_status["skipped"] += 1
                    continue
            except KeyError:
                pass
            # Testing each non-salt URL for availability
            scheme = urlparse(version["installer"]).scheme
            if scheme in ["http", "https"]:
                headers = BytesIO()
                body = BytesIO()
                printd("version['installer']", version["installer"])
                c = curl.Curl()
                # c.setopt(curl.WRITEFUNCTION, headers.write)
                c.setopt(curl.URL, version["installer"])
                c.setopt(curl.FOLLOWLOCATION, True)
                c.setopt(curl.CONNECTTIMEOUT, 2)
                c.setopt(curl.TIMEOUT, 5)
                c.setopt(curl.WRITEHEADER, headers)
                c.setopt(curl.WRITEDATA, body)
                c.setopt(curl.RANGE, "0-2047")
                try:
                    c.perform()
                    # assert C.getinfo(curl.HTTP_CODE) != 404, "[ERROR]\tURL returned code 404. File Missing? "
                    http_code = c.getinfo(curl.HTTP_CODE)
                    count_http_codes[http_code] += 1
                    # print(headers.getvalue().decode("utf-8").split('\r\n')[1:])
                    try:
                        content_type = dict(
                            [
                                tuple(l.split(": ", 1))
                                for l in headers.getvalue().decode("utf-8").split("\r\n")[1:]
                                if ":" in l
                            ]
                        )["Content-Type"]
                    except Exception:
                        content_type = magic.from_buffer(body.getvalue(), mime=True)
                    count_c_types[content_type] += 1
                    printd("content_type:", content_type)
                    http_failure = False
                    if http_code >= 400:
                        # This build is failing !
                        print(
                            "PROBLEM HERE (%s) : %s -- %s -- %s "
                            % (http_code, s, v, version["installer"])
                        )
                        http_failure = True
                        TEST_STATUS = False
                    if (
                        "application/" not in content_type
                        and "binary/" not in content_type
                    ):
                        print(
                            "PROBLEM HERE (Bad content type) : %s -- %s -- %s -- %s "
                            % (s, v, version["installer"], content_type)
                        )
                        # print(headers.getvalue().decode("utf-8").split())
                        http_failure = True
                        TEST_STATUS = False
                    else:
                        count_status["passed"] += 1
                        print("VALID : %s" % version["installer"])
                    if http_failure:
                        count_status["failed"] += 1
                except curl.error as e:
                    errno, errstr = e
                    printd("errno, errstr", (errno, errstr))
                    if errno == 28:
                        print(
                            "[ERROR]\tConnection timeout or no server | "
                            "errno: " + str(errno) + " | " + errstr
                        )
                        count_status["errored"] += 1
                        pass
                c.close()


if travis:
    head = git.Repo(".").commit("HEAD")
    changed = [i for i in head.stats.files.keys() if ".sls" in i]
    our_files = changed
elif cron:
    our_files = glob.glob("*.sls")
else:
    our_files = args

if len(our_files) == 0:
    print("No files to check. No problem.")
    exit(0)

for file in our_files:
    try:
        print("---( " + file + " )---")
        with open(file, "r") as stream:
            template = stream.read()
        t = Template(template)
        if "cpuarch" in template:
            for cpuarch in ["AMD64", "x86"]:
                print("--------(arch: %s)--------" % cpuarch)
                yml = t.render(grains={"cpuarch": cpuarch})
                data = yaml.load(yml, Loader=yaml.FullLoader)
                process_each(data)
        else:
            yml = t.render()
            data = yaml.load(yml, Loader=yaml.FullLoader)
            process_each(data)
    except Exception:
        exc = sys.exc_info()[0]
        print("[EXCEPTION] " + str(exc))
        traceback.print_exc()
        count_status["exceptions"] += 1
        pass
print("-" * 80 + "\n")

print(tabulate(count_c_types.most_common(), ["Total", sum(count_c_types.values())]) + "\n")
print(tabulate(count_http_codes.most_common(), ["Total", sum(count_http_codes.values())]) + "\n")
print(tabulate(count_status.most_common(), ["Total", sum(count_status.values())]) + "\n")

assert TEST_STATUS, (
    "BUILD FAILING. You can grep for 'PROBLEM HERE' to find out how to fix this."
)
print("Everything went smoothly. No errors were found. Happy deployment!")
