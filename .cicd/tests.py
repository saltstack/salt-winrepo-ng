#!/usr/bin/env python3
import getopt
import glob
import magic
import requests
import salt.client
import sys
import time
import traceback
from collections import Counter
from pprint import pprint
from tabulate import tabulate
from urllib.parse import urlparse


TEST_STATUS = True
TEST_FAILURES = []

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
        -c | --cron     Run in cron mode
        -d | --debug    Run in debug mode (Prints more info)

    python test.py software.sls
    """)


try:
    opts, args = getopt.getopt(
        sys.argv[1:], "cdh", ["cron", "debug", "help_"]
    )
    opts = dict(opts)
except getopt.GetoptError:
    usage()
    sys.exit(2)
cron, debug, help_ = (False, False, False)

for o in opts:
    if o in ("-c", "--cron"):
        cron = True
    if o in ("-d", "--debug"):
        debug = True
        printd("ploop", {"extra": "debug", "data": None})
    if o in ("-h", "--help_"):
        help_ = True

printd("opts, args", (opts, args))
printd("cron, debug, help_ ", (cron, debug, help_))

if help_ or len(opts) < 1 and len(args) < 1:
    usage()
    exit(0)

##################


def process_each(softwares):
    global TEST_STATUS
    # pprint(softwares)
    for s, software in softwares.items():
        # Some software definitions may compile to None, meaning there are no
        # definitions
        if not software:
            continue
        for v, version in software.items():
            # "skip_urltest" allows us to not run this test for known
            # unreachable urls... they may be pointing to salt:// for example
            if version.get("skip_urltest", False):
                count_status["skipped"] += 1
                msg = "SKIPPED : %s -- %s" % (s, v)
                print(msg)
                continue
            if not version.get("installer", ""):
                count_status["skipped"] += 1
                msg = "SKIPPED (No URL) : %s -- %s" % (s, v)
                print(msg)
                continue
            # Testing each non-salt URL for availability
            scheme = urlparse(version.get("installer", "")).scheme
            if scheme in ["http", "https"]:
                printd("version['installer']", version["installer"])
                headers = {
                    "User-Agent": "curl/7.76.0",
                    "Range": "bytes=0-10",
                }
                try:
                    with requests.get(
                        version.get("installer"),
                        allow_redirects=True,
                        timeout=10,
                        stream=True,
                    ) as get:
                        http_code = get.status_code
                        count_http_codes[http_code] += 1
                        try:
                            content_type = get.headers["Content-Type"]
                        except KeyError:
                            content_type = magic.from_buffer(get.content, mime=True)
                        count_c_types[content_type] += 1
                        printd("content_type:", content_type)
                        if http_code >= 400:
                            # This build is failing !
                            failure = (
                                "PROBLEM HERE (%s) : %s -- %s\n -- %s "
                                % (http_code, s, v, version["installer"])
                            )
                            print(failure)
                            TEST_STATUS = False
                            TEST_FAILURES.append(failure)
                            count_status["failed"] += 1
                        elif (
                            "application/" not in content_type
                            and "binary/" not in content_type
                        ):
                            # This build is failing !
                            failure = (
                                "PROBLEM HERE (Bad content type) : %s -- %s -- %s\n -- %s "
                                % (s, v, content_type, version["installer"])
                            )
                            print(failure)
                            TEST_STATUS = False
                            TEST_FAILURES.append(failure)
                            count_status["failed"] += 1
                        else:
                            count_status["passed"] += 1
                            print("VALID : %s" % version["installer"])
                except requests.exceptions.SSLError as e:
                    # mercurial.sls will fail here
                    failure = (
                        "PROBLEM HERE (Bad Certificate) : %s -- %s\n -- %s"
                        % (s, v, version["installer"])
                    )
                    print(failure)
                    TEST_STATUS = False
                    TEST_FAILURES.append(failure)
                    count_status["failed"] += 1
                except requests.exceptions.ConnectTimeout:
                    # filezilla.sls
                    failure = "PROBLEM HERE (Connection Timeout) : %s -- %s\n -- %s" % (s, v, version["installer"])
                    print(failure)
                    TEST_STATUS = False
                    TEST_FAILURES.append(failure)
                    count_status["failed"] += 1
                except requests.exceptions.ConnectionError:
                    # pdfcreater.sls
                    failure = "PROBLEM HERE (Connection Error) : %s -- %s\n -- %s" % (s, v, version["installer"])
                    print(failure)
                    TEST_STATUS = False
                    TEST_FAILURES.append(failure)
                    count_status["failed"] += 1
                except requests.exceptions.ReadTimeout:
                    # npp.sls... maybe a network issue as well
                    failure = "PROBLEM HERE (Read Timeout) : %s -- %s\n -- %s" % (s, v, version["installer"])
                    print(failure)
                    TEST_STATUS = False
                    TEST_FAILURES.append(failure)
                    count_status["failed"] += 1
                except Exception as e:
                    print("dir e: ", dir(e))
                    print("e: ", e)
                    print("traceback: ", traceback.print_exc())

                    failure = "PROBLEM HERE (%s) : %s -- %s\n -- %s" % (e, s, v, version["installer"])
                    print(failure)
                    trace_back = "-" * 30 + "\n" + traceback.print_exc() + "\n" + "-" * 30
                    print(trace_back)
                    TEST_STATUS = False
                    TEST_FAILURES.append(failure)
                    TEST_FAILURES.append(trace_back)

                    count_status["failed"] += 1

if cron:
    our_files = glob.glob("*.sls")
else:
    our_files = args

if len(our_files) == 0:
    print("No files to check. No problem.")
    exit(0)

# This is a stupid thing we have to do because the grains don't flip right
label_rev = {"AMD64": "x86", "x86": "AMD64"}

for file in our_files:
    try:
        label = " ( {} ) ".format(file)
        count = 80 - len(label)
        count = count - count % 2
        count = round( count / 2)
        label = ">" * count + label + "<" * count
        print(label + "<" * (80 - len(label)))
        with open(file, "r") as stream:
            template = stream.read()
        if "cpuarch" in template:
            for cpuarch in ["AMD64", "x86"]:
                label = " ( arch: {} ) ".format(label_rev[cpuarch])
                count = 80 - len(label)
                count = count - count % 2
                count = round( count / 2)
                label = "-" * count + label + "-" * count
                print(label + "-" * (80 - len(label)))
                caller = salt.client.Caller(".cicd/minion")
                caller.cmd("grains.set", "cpuarch", cpuarch)
                data = caller.cmd("winrepo.show_sls", file)
                process_each(data)
        else:
            caller = salt.client.Caller(".cicd/minion")
            data = caller.cmd("winrepo.show_sls", file)
            process_each(data)
    except Exception:
        exc = sys.exc_info()[0]
        print("[EXCEPTION] " + str(exc))
        traceback.print_exc()
        count_status["exceptions"] += 1
        pass

print("-" * 80 + "\n")

# For GitHub Actions to display multiline output we must change \n to %0A
# See e.g. https://github.com/orgs/community/discussions/26288
if not TEST_STATUS:
    failure_output = "%0A".join(TEST_FAILURES)
    failure_output = failure_output.replace("\n", "%0A")
    print(f"::error title=URLs with Failures::URLs with Failures:%0A{failure_output}")
    print("")

test_summary = tabulate(count_status.most_common(), ["Total", sum(count_status.values())])
content_type_summary = tabulate(count_c_types.most_common(), ["Total", sum(count_c_types.values())])
http_code_summary = tabulate(count_http_codes.most_common(), ["Total", sum(count_http_codes.values())])

test_summaries = [
    "Test Summary:",
    "=============",
    test_summary,
    "",
    "Content Type:",
    "=============",
    content_type_summary,
    "",
    "HTTP Codes:",
    "===========",
    http_code_summary
]
test_summaries_output = "%0A".join(test_summaries)
test_summaries_output = test_summaries_output.replace("\n", "%0A")
print(f"::notice title=Test Summary::{test_summaries_output}")
print("")

if not TEST_STATUS:
    print("*" * 80)
    print("BUILD FAILING. You can grep for 'PROBLEM HERE' to find out how to fix this.")
    print("*" * 80)
    exit(1)

print("*" * 80)
print("Everything went smoothly. No errors were found. Happy deployment!")
print("*" * 80)
