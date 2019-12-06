{% set EXE_VERSIONS = [('3.8.0','3.8.150.0'),
                       ('3.7.4', '3.7.4150.0'),
                       ('3.7.3', '3.7.3150.0'),	
                       ('3.7.0', '3.7.150.0'),
                       ('3.6.8', '3.6.8150.0'),
                       ('3.6.6', '3.6.6150.0'),
                       ('3.5.4', '3.5.4150.0'),
                       ('3.5.2', '3.5.2150.0'),
                       ('3.5.1', '3.5.1150.0')] %}
{% set MSI_VERSIONS = [('3.4.3', '3.4.3150'),
                       ('3.4.2', '3.4.2150'),
                       ('3.4.1', '3.4.1150'),
                       ('3.3.3', '3.3.3150')] %}
python3_x64:
  {% for VER, RAW_VER in EXE_VERSIONS %}
  '{{ RAW_VER }}':
    full_name: 'Python {{ VER }} Core Interpreter (64-bit)'
    installer: 'https://www.python.org/ftp/python/{{ VER }}/python-{{ VER }}-amd64.exe'
    install_flags: '/quiet InstallAllUsers=1'
    uninstaller: 'https://www.python.org/ftp/python/{{ VER }}/python-{{ VER }}-amd64.exe'
    uninstall_flags: '/quiet /uninstall'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
  {% for VER, RAW_VER in MSI_VERSIONS %}
  '{{ RAW_VER }}':
    full_name: 'Python {{ VER }} Core Interpreter (64-bit)'
    installer: 'https://www.python.org/ftp/python/{{ VER }}/python-{{ VER }}.amd64.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'https://www.python.org/ftp/python/{{ VER }}/python-{{ VER }}.amd64.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
