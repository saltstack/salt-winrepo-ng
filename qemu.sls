# -*- coding: utf-8 -*-
# vim: ft=sls
{% if grains['cpuarch'] == 'AMD64' %}
  {% set BITS = '64' %}
{% else %}
  {% set BITS = '32' %}
{% endif %}
qemu:
  '2018.05.19':
    full_name: 'QEMU'
    installer: 'https://qemu.weilnetz.de/w{{ BITS }}/2018/qemu-w{{ BITS }}-setup-20180519.exe'
    uninstaller: '%PROGRAMFILES%\qemu\qemu-uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
