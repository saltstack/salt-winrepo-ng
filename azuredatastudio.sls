# due to winrepo installer limitations you need to manually download the exe from
# https://go.microsoft.com/fwlink/?linkid=2049975
# and put it on the winrepo on master to install it the 'salt://win/repo-ng/azuredatastudio/...

{% set version = '1.3.9' %}
azuredatastudio:
  '{{version}}':
    full_name: 'Azure Data Studio'
#    installer: 'salt://win/repo-ng/azuredatastudio/azuredatastudio-windows-setup-{{version}}.exe'
    installer: 'https://azuredatastudiobuilds.blob.core.windows.net/releases/{{version}}/azuredatastudio-windows-setup-{{version}}.exe'
    uninstaller: 'C:\Program Files\Azure Data Studio\unins000.exe'
    install_flags: '/SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE'
    uninstall_flags: '/VERYSILENT /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
