python2_x64:
  {% for minor in range(1, 16) %}
  {% set version = '2.7.' ~ minor %}
  {% set full_version = version ~ '150' %}

  '{{ full_version }}':
    full_name: 'Python {{ version }} (64-bit)'
    installer: 'http://www.python.org/ftp/python/{{ version }}/python-{{ version }}.amd64.msi'
    install_flags: '/qn ALLUSERS=1 ADDLOCAL=Extensions /norestart'
    uninstaller: 'http://www.python.org/ftp/python/{{ version }}/python-{{ version }}.amd64.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
