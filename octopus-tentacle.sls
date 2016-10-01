# -*- coding: utf-8 -*-
# vim: ft=sls
{% if grains['cpuarch'] == 'AMD64' %}
  {% set PLATFORM = '-x64' %}
{% else %}
  {% set PLATFORM = '' %}
{% endif %}
{% set PLATFORM_LATEST = PLATFORM | replace('-x', '') -%}
octopus-tentacle:
  'latest':
    full_name: 'Octopus Deploy Tentacle'
    installer: 'https://octopus.com/downloads/latest/OctopusTentacle{{ PLATFORM_LATEST }}'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'https://octopus.com/downloads/latest/OctopusTentacle{{ PLATFORM_LATEST }}'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% for version in ('3.3.17', '3.3.16') %}
  '{{ version }}':
    full_name: 'Octopus Deploy Tentacle'
    installer: 'https://download.octopusdeploy.com/octopus/Octopus.Tentacle.{{ version }}{{ PLATFORM }}.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'https://download.octopusdeploy.com/octopus/Octopus.Tentacle.{{ version }}{{ PLATFORM }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
