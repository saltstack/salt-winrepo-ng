# Source: http://tortoisehg.bitbucket.org/

{% if grains['cpuarch'] == 'AMD64' %}
{% set msi_arch = 'x64' %}
{% else %}
{% set msi_arch = 'x86' %}
{% endif %}

tortoise-hg:
  '3.6.2':
    full_name: 'TortoiseHg 3.6.2 ({{ msi_arch }})'
    installer: 'salt://win/repo-ng/tortoise-hg/tortoisehg-3.6.2-{{ msi_arch }}.msi'
    uninstaller: 'salt://win/repo-ng/tortoise-hg/tortoisehg-3.6.2-{{ msi_arch }}.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '3.3.0':
    full_name: 'TortoiseHg 3.3.0 ({{ msi_arch }})'
    installer: 'salt://win/repo-ng/tortoise-hg/tortoisehg-3.3.0-{{ msi_arch }}.msi'
    uninstaller: 'salt://win/repo-ng/tortoise-hg/tortoisehg-3.3.0-{{ msi_arch }}.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
# Need to download from source site above, so it will append proper aws key credentials
# place downloaded msi in master's win_repo-ng
