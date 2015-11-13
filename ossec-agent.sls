# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
ossec-agent:
  '2.8':
    full_name: 'OSSEC HIDS 2.8'
    installer: 'salt://win/repo/ossec/ossec-agent-win32-2.8.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\ossec-agent\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
# The official download page for the OSSEC agent is http://www.ossec.net/?page_id=19
