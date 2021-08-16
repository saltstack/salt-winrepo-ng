{% if grains['cpuarch'] == 'AMD64' %}
{% set msi_arch = 'x64' %}
{% else %}
{% set msi_arch = 'x86' %}
{% endif %}

tortoise-hg:
  '5.7.1':
    full_name: 'TortoiseHg 5.7.1 ({{ msi_arch }})'
    installer: 'https://www.mercurial-scm.org/release/tortoisehg/windows/tortoisehg-5.7.1-{{ msi_arch }}.msi'
    uninstaller: 'https://www.mercurial-scm.org/release/tortoisehg/windows/tortoisehg-5.7.1-{{ msi_arch }}.msi'
  '3.6.2':
    full_name: 'TortoiseHg 3.6.2 ({{ msi_arch }})'
    uninstaller: 'salt://win/repo-ng/tortoise-hg/tortoisehg-3.6.2-{{ msi_arch }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '3.3.0':
    full_name: 'TortoiseHg 3.3.0 ({{ msi_arch }})'
    uninstaller: 'salt://win/repo-ng/tortoise-hg/tortoisehg-3.3.0-{{ msi_arch }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
# Installers for versions 3.x.y had to be downloaded
# from http://tortoisehg.bitbucket.org (not existing anymore)
# so it appended proper aws key credentials
# and placed in master's win_repo-ng
