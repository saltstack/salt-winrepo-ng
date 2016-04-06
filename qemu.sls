# -*- coding: utf-8 -*-
# vim: ft=sls
{% if grains['cpuarch'] == 'AMD64' %}
  {% set BITS = '64' %}
{% else %}
  {% set BITS = '32' %}
{% endif %}
qemu:
  '2.5.50':
    full_name: 'QEMU'
    installer: 'http://qemu.weilnetz.de/w{{ BITS }}/qemu-w{{ BITS }}-setup-20160303.exe'
    uninstaller: '%PROGRAMFILES%\qemu\qemu-uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
