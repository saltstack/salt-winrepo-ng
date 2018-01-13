pgadmin4:
{% for package_version in ['2.1',
                           '2.0',
                           '1.6'] %}
  '{{ package_version }}':
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
    full_name: 'pgAdmin 4 version {{ package_version }}'
    installer: 'https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v{{ package_version }}/windows/pgadmin4-{{ package_version }}-x86.exe'
    install_flags: '/SP- /verysilent /norestart'
  {% if package_version == "1.6" %}
    uninstaller: '{{ PROGRAM_FILES }}\pgAdmin 4\v1\unins000.exe'
  {% elif package_version == "2.0" or package_version == "2.1" %}
    uninstaller: '{{ PROGRAM_FILES }}\pgAdmin 4\v2\unins000.exe'
  {% endif %}
    uninstall_flags: ' /verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
