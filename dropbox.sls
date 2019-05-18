# just 32-bit x86 installer available

{% set SOURCE_PATH = 'https://clientupdates.dropboxstatic.com/dbx-releng/client/' %}
{% set VERSION = '69.4.102' %}

{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}

dropbox:
  '{{ VERSION }}':
    full_name: 'Dropbox'
    installer: '{{ SOURCE_PATH }}Dropbox%20{{ VERSION }}%20Offline%20Installer.exe'
    install_flags: '/NOLAUNCH'
    uninstaller: '{{ PROGRAM_FILES }}\Dropbox\Client\DropboxUninstaller.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
