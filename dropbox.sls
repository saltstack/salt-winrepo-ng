# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
dropbox:
  '41.4.80':
    full_name: 'Dropbox'
    installer: 'https://clientupdates.dropboxstatic.com/dbx-releng/client/Dropbox%2041.4.80%20Offline%20Installer.exe'
    install_flags: '/s'
    uninstaller: '{{ PROGRAM_FILES }}\Dropbox\Client\DropboxUninstaller.exe'
    uninstall_flags: '/InstallType:MACHINE /s'
    msiexec: False
    locale: en_US
    reboot: False
