check-mk-agent:
  Not Found:
    full_name: 'Check_MK Agent 1.2.8b4'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.8b4.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.8b4.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  Not Found:
    full_name: 'Check_MK Agent 1.2.8b3'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.8b3.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.8b3.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  Not Found:
    full_name: 'Check_MK Agent 1.2.8b2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.8b2.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.8b2.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  Not Found:
    full_name: 'Check_MK Agent 1.2.8b1'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.8b1.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.8b1.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  Not Found:
    full_name: 'Check_MK Agent 1.2.7i3p5'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.7i3p5.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.7i3p5.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  Not Found:
    full_name: 'Check_MK Agent 1.2.7i3p4'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.7i3p4.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.7i3p4.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  Not Found:
    full_name: 'Check_MK Agent 1.2.7i3p3'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.7i3p3.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.7i3p3.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  Not Found:
    full_name: 'Check_MK Agent 1.2.7i3p2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.7i3p2.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.7i3p2.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  Not Found:
    full_name: 'Check_MK Agent 1.2.7i3p1'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.7u3p1.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.7i3p1.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  Not Found:
    full_name: 'Check_MK Agent 1.2.6p16'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-64-1.2.6p16.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/check_mk/install_agent-1.2.6p16.exe'
    {% endif %}
    uninstaller: '%ProgramFiles%\check_mk\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
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
