# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
check-mk-agent:
  Not Found:
    full_name: 'Check_MK Agent 1.2.6p15'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo/check_mk/agents_windows_install_agent-64.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo/check_mk/agents_windows_install_agent.exe'
    {% endif %}
    uninstaller: '{{ PROGRAM_FILES }}\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
