winmtr:
  {% for version, sversion in [('0.92','092')] %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'WinMTR_x64 {{ version }}'
    installer: 'salt://win/repo-ng/winmtr/winmtr_x64-{{ sversion }}.exe'
    uninstaller: 'c:\utl\uninstall-winmtr_x64.exe'
    {% else %}
    full_name: 'WinMTR {{ version }}'
    installer: 'salt://win/repo-ng/winmtr/winmtr-{{ sversion }}.exe'
    uninstaller: 'c:\utl\uninstall-winmtr.exe'
    {% endif %}
    install_flags: '/D="c:\utl" /SILENT /NORESTART'
    uninstall_flags: 'c:\utl\SSEun.dat /SILENT /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
# download exe from winmtr.net
# create two installers using http://www.ssesetup.com/
