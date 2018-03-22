sourcetree:
  {% for version in ['2.3.1.0','2.2.4.0','2.1.11.0','2.1.10.0','2.1.2.5','2.0.20.1','1.10.23.1'] %}
  '{{ version }}':
    full_name: 'SourceTree'
    installer: 'https://downloads.atlassian.com/software/sourcetree/windows/ga/SourceTreeSetup-{{ version }}.exe'
    install_flags: '/exenoui /qn /norestart'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {9FFB4428-D676-449F-B173-52C0E9FF1179} /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}

  {% for version in ['1.9.13.7','1.9.10.0','1.9.9.20','1.9.6.2','1.8.3','1.7.0.32509','1.6.25','1.5.2','1.4.1','1.3.3','1.2.4','1.1.1','1.0.8','0.9.4'] %}
  '{{ version }}':
    full_name: 'SourceTree'
    installer: 'https://downloads.atlassian.com/software/sourcetree/windows/SourceTreeSetup_{{ version }}.exe'
    install_flags: '/exenoui /qn /norestart'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {9FFB4428-D676-449F-B173-52C0E9FF1179} /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
