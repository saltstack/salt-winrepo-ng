# -*- coding: utf-8 -*-
# vim: ft=sls
{% if grains['cpuarch'] == 'AMD64' %}
  {% set PLATFORM = 'x86-64' %}
{% else %}
  {% set PLATFORM = 'x86' %}
{% endif %}
sscserv-free:
  {% for version in '3.6.1', '3.5.0' %}
  '{{ version }}':
    full_name: 'SSC Serv {{ version }} Free Edition'
    installer: 'http://ssc-serv.com/files/SSC%20Serv%20Setup%20{{ version }}%20{{ PLATFORM }}%20Free%20Edition.exe'
    install_flags: '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    uninstaller: '%PROGRAMFILES%\SSC Serv\unins000.exe'
    uninstall_flags: '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
