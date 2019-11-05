# due to winrepo installer limitations you need to manually download x86 + x64 System installer from
# https://code.visualstudio.com/Download
# and put it on the winrepo on master to install it the 'salt://win/repo-ng/vscode/...

{% set PROGRAM_FILES = "%ProgramFiles%" %}

vscode:
  {% for version, guid in (('1.36.1', '2213894ea0415ee8c85c5eea0d0ff81ecc191529'), ('1.37.1', 'f06011ac164ae4dc8e753a3fe7f9549844d15e35'), ('1.38.1', 'b37e54c98e1a74ba89e03073e5a3761284e3ffb0'), ('1.39.1', '88f15d17dca836346e787762685a40bb5cce75a8'), ('1.39.2', '6ab598523be7a800d7f3eb4d92d7ab9a66069390')) %}
  '{{version}}':
    full_name: 'Microsoft Visual Studio Code'
    {% if grains['cpuarch'] == 'AMD64' %}
#    installer: 'salt://win/repo-ng/vscode/VSCodeSetup-x64-{{ version }}.exe'
    installer: 'https://az764295.vo.msecnd.net/stable/{{ guid }}/VSCodeSetup-x64-{{version}}.exe'
{% else %}
#    installer: 'salt://win/repo-ng/vscode/VSCodeSetup-ia32-{{ version }}.exe' 
    installer: 'https://az764295.vo.msecnd.net/stable/{{ guid }}/VSCodeSetup-ia32-{{version}}.exe'
{% endif %}
    uninstaller: '{{ PROGRAM_FILES }}\Microsoft VS Code\unins000.exe'
    install_flags: '/SP- /VERYSILENT /NORESTART /MERGETASKS="!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH"'
    uninstall_flags: '/VERYSILENT /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
  
