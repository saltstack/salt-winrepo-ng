check-mk-agent:
  Not Found:
    full_name: 'Check_MK Agent 1.2.6p15'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.6p15.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.6p15.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
