# -*- coding: utf-8 -*-
# vim: ft=sls
{% set versions = ['8.32'] %}
{% set PROGRAM_FILES = "%ProgramFiles%" %}

bitvise:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Bitvise SSH Server {{ version }} (remove only)'
    installer: 'https://s3.amazonaws.com/dl.bitvise.com/BvSshServer-Inst.exe'
    install_flags: '-acceptEULA -defaultInstance -startService'
    uninstaller: '{{ PROGRAM_FILES }}\Bitvise SSH Server\uninst.exe'
    uninstall_flags: '"Bitvise SSH Server" -unat'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}

