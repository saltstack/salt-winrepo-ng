#!/usr/bin/env python
# -*- coding: utf-8 -*-

import yaml, glob, os
from pprint import pprint
from jinja2 import Template
from urlparse import urlparse
import pycurl as curl

def process_each(softwares):
    #print(softwares)
    for _,software in softwares.items():
        for _,version in software.items():
            # Testing each non-salt URL for availability
            scheme=urlparse(version['installer']).scheme
            if scheme != 'salt':
                print(version['installer'])
                C = curl.Curl()
                C.setopt(curl.URL, version['installer'])
                C.setopt(curl.NOBODY, True)
                C.perform()
                C.close()

for cpuarch in ['AMD64', 'x86']:
    for file in glob.glob('*.sls'):
        with open(file, 'r') as stream:
            template = stream.read()
            data=None
            try:
                t = Template(template)
                yml = t.render(grains={'cpuarch':cpuarch})
                data = yaml.load(yml)
            except:
                continue
                process_each(data)
