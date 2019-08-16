# due to winrepo installer limitations you need to manually download x86 + x64 System installer from
# https://code.visualstudio.com/Download
# and put it on the winrepo on master to install it the 'salt://win/repo-ng/vscode/...

{% set version = '1.35.1' %}
{% set PROGRAM_FILES = "%ProgramFiles%" %}

vscode:
  '{{version}}':
    full_name: 'Microsoft Visual Studio Code'
    {% if grains['cpuarch'] == 'AMD64' %}
#    installer: 'salt://win/repo-ng/vscode/VSCodeSetup-x64-{{ version }}.exe'
    installer: 'https://az764295.vo.msecnd.net/stable/c7d83e57cd18f18026a8162d042843bda1bcf21f/VSCodeSetup-x64-{{version}}.exe'
{% else %}
#    installer: 'salt://win/repo-ng/vscode/VSCodeSetup-ia32-{{ version }}.exe' 
    installer: 'https://az764295.vo.msecnd.net/stable/c7d83e57cd18f18026a8162d042843bda1bcf21f/VSCodeSetup-ia32-{{version}}.exe'
{% endif %}
    uninstaller: '{{ PROGRAM_FILES }}\Microsoft VS Code\unins000.exe'
    install_flags: '/SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE'
    uninstall_flags: '/VERYSILENT /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
