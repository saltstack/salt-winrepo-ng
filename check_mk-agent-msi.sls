check_mk-agent-msi:
  {% for version in ['1.4.0.2940', '1.4.0.2857', '1.2.8.1521', '1.2.6.185'] %}
  '{{ version }}':
    full_name: 'Check_MK Agent'
    installer: 'salt://win/repo-ng/check_mk/check_mk_agent-{{ version }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'salt://win/repo-ng/check_mk/check_mk_agent-{{ version }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
