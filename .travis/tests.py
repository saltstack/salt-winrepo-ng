#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-

import getopt
import git
import pycurl as curl
import sys
import traceback
import yaml, glob, os
from jinja2 import Template
from pprint import pprint
from StringIO import StringIO
from urlparse import urlparse

reload(sys)
sys.setdefaultencoding('utf8')

test_status = True

head = git.Repo(".").commit("HEAD")
changed = [i for i in head.stats.files.keys() if '.sls' in i]


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
        -h | --help_     Show this help_
        -t | --travis   Run in travis (ignores files that have not been changed in last commit)
        -c | --cron     Run in cron mode  (Checks 
        -d | --debug    Run in debug mode (Prints more info)
    """)


try:
    opts, args = getopt.getopt(
        sys.argv[1:], "tcdh", ["travis", "cron", "debug", "help_"])
    opts = dict(opts)
except getopt.GetoptError:
    usage()
    sys.exit(2)
travis, cron, debug, help_ = (False, False, False, False)

try:
    if opts.has_key('-t') or opts.has_key('--travis'):
        travis = True
    if opts.has_key('-c') or opts.has_key('--cron'):
        cron = True
    if opts.has_key('-d') or opts.has_key('--debug'):
        debug = True
        from pprint import pprint
        printd("ploop", {'extra':'debug', 'data': None})
    if opts.has_key('-h') or opts.has_key('--help_'):
        help_ = True
except KeyError:
    pass
printd("opts, args", (opts, args))
printd("travis, cron, debug, help_ ", (travis, cron, debug, help_))

if help_ or len(opts) < 1 and len(args) < 1:
    usage()
    exit(0)

##################


def process_each(softwares):
    global test_status
    # pprint(softwares)
    for s, software in softwares.items():
        try:
            if software.get('skip_urltest', False):
                continue
        except KeyError:
            pass
        for v, version in software.items():
            try:
                if version.get('skip_urltest', False):
                    continue
            except KeyError:
                pass
            # Testing each non-salt URL for availability
            scheme = urlparse(version['installer']).scheme
            if scheme in ['http', 'https']:
                headers = StringIO()
                printd("version['installer']", version['installer'])
                C = curl.Curl()
                C.setopt(curl.URL, version['installer'])
                C.setopt(curl.NOBODY, True)
                C.setopt(curl.FOLLOWLOCATION, True)
                C.setopt(curl.CONNECTTIMEOUT, 2)
                C.setopt(curl.TIMEOUT, 5)
                C.setopt(C.HEADERFUNCTION, headers.write)
                try:
                    C.perform()
                    # assert C.getinfo(curl.HTTP_CODE) != 404, "[ERROR]\tURL returned code 404. File Missing? "
                    http_code = C.getinfo(curl.HTTP_CODE)
                    # print(headers.getvalue().split('\r\n')[1:])
                    try:
                        content_type = dict([tuple(l.split(': ', 1)) for l in headers.getvalue().split('\r\n')[1:] if ':' in l])['Content-Type']
                    except:
                        content_type = 'None/None'
                    printd("content_type:", content_type)
                    if http_code == 404:
                        # This build is failing !
                        print("PROBLEM HERE (404) : %s -- %s -- %s " % (s, v, version['installer']))
                        test_status = False
                    if 'application/' not in content_type and 'binary/' not in content_type:
                        print("PROBLEM HERE (Bad content type) : %s -- %s -- %s -- %s " % (s, v, version['installer'], content_type))
                        # print(headers.getvalue().split())
                    else:
                        print("VALID : %s" % version['installer'])
                except curl.error as e:
                    errno, errstr = e
                    printd("errno, errstr", (errno, errstr))
                    if errno == 28:
                        print('[ERROR]\tConnection timeout or no server | '
                              'errno: ' + str(errno) + ' | ' + errstr)
                        pass
                C.close()


if travis:
    our_files = changed
else:
    our_files = glob.glob('*.sls')


for cpuarch in ['AMD64', 'x86']:
    try:    
        print("--------(arch: %s)--------" % cpuarch)
        if len(our_files) == 0:
            print("No files to check. No problem.")
            continue
        for file in our_files:
            try:
                print("---( " + file + " )---")
                with open(file, 'r') as stream:
                    template = stream.read()
                t = Template(template)
                yml = t.render(grains={'cpuarch': cpuarch})
                data = yaml.load(yml, Loader=yaml.FullLoader)
                process_each(data)
            except Exception:
                exc = sys.exc_info()[0]
                print("[EXCEPTION] " + str(exc))
                traceback.print_exc()
                pass
        print("-" * 80)
    except Exception:
        exc = sys.exc_info()[0]
        print("[EXCEPTION] " + str(exc))
        traceback.print_exc()
        pass
 
assert test_status, "BUILD FAILING. You can grep for 'PROBLEM HERE' to find " \
                    "out how to fix this."
print("Everything went smoothly. No errors were found. Happy deployment!")
