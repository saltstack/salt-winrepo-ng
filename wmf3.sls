# 6.1 = win7, windows server 2008 r2 | 6.0 = vista, windows server 2008
# http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.0-KB2506146-x64.msu
# http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.0-KB2506146-x86.msu
# http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x64.msu
# http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x86.msu
# http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/WMF%203%20Release%20Notes.docx
wmf3:
  3:
    full_name: 'Windows Management Framework 3'
    {% if grains['cpuarch'] == 'AMD64' %}
      {% if salt['pkg.compare_versions'](grains['osversion'], '=', '6.1') %}
      installer: 'http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x64.msu'
      {% elif salt['pkg.compare_versions'](grains['osversion'], '=', '6.0') %}
      installer: 'http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.0-KB2506146-x64.msu'
      {% endif %}
    {% elif grains['cpuarch'] == 'x86' %}
      {% if salt['pkg.compare_versions'](grains['osversion'], '=', '6.1') %}
      installer: 'http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x86.msu'
      {% elif salt['pkg.compare_versions'](grains['osversion'], '=', '6.0') %}
      installer: 'http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.0-KB2506146-x86.msu'
      {% endif %}
    {% endif %}
    install_flags: '/quiet /norestart'
    uninstaller: ''
    uninstall_flags: ''
    msiexec: False
    locale: en_US
    reboot: False
