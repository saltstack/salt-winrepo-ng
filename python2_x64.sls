python2_x64:
  {% for minor in range(1, 18) %}
  {% set version = '2.7.' ~ minor %}
  {% set full_version = version ~ '150' %}

  '{{ full_version }}':
    full_name: 'Python {{ version }} (64-bit)'
    installer: 'https://www.python.org/ftp/python/{{ version }}/python-{{ version }}.amd64.msi'
    install_flags: '/qn ALLUSERS=1 ADDLOCAL=Extensions /norestart'
    uninstaller: 'https://www.python.org/ftp/python/{{ version }}/python-{{ version }}.amd64.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
