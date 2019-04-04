# Note: because version with one dot (e.g. 9.5) possibly be interpreted as a float number, use quotes like this:
# salt mid pkg.install postgresql version='"9.6"'
{% if grains['cpuarch'] == 'AMD64' %}
  {% set ARCH = "-x64" %}
{% else %}
  {% set ARCH = "" %}
{% endif %}
postgresql:
  '9.6':
    full_name: 'PostgreSQL 9.6 '
    installer: 'https://get.enterprisedb.com/postgresql/postgresql-9.6.0-1-windows{{ ARCH }}.exe'
    install_flags: ' --unattendedmodeui minimal --mode unattended --superpassword postgres'
    uninstaller: '%ProgramFiles%\PostgreSQL\9.6\uninstall-postgresql.exe'
    uninstall_flags: ' --mode unattended'
    locale: en_US
    msiexec: False
    reboot: False
  '9.5':
    full_name: 'PostgreSQL 9.5 '
    installer: 'https://get.enterprisedb.com/postgresql/postgresql-9.5.0-1-windows{{ ARCH }}.exe'
    install_flags: ' --unattendedmodeui minimal --mode unattended --superpassword postgres'
    uninstaller: '%ProgramFiles%\PostgreSQL\9.5\uninstall-postgresql.exe'
    uninstall_flags: ' --mode unattended'
    locale: en_US
    msiexec: False
    reboot: False
  '9.4':
    full_name: 'PostgreSQL 9.4 '
    installer: 'https://get.enterprisedb.com/postgresql/postgresql-9.4.5-3-windows{{ ARCH }}.exe'
    install_flags: ' --unattendedmodeui minimal --mode unattended --superpassword postgres'
    uninstaller: '%ProgramFiles%\PostgreSQL\9.4\uninstall-postgresql.exe'
    uninstall_flags: ' --mode unattended'
    locale: en_US
    msiexec: False
    reboot: False
  '9.3':
    full_name: 'PostgreSQL 9.3 '
    installer: 'https://get.enterprisedb.com/postgresql/postgresql-9.3.10-3-windows{{ ARCH }}.exe'
    install_flags: ' --unattendedmodeui minimal --mode unattended --superpassword postgres'
    uninstaller: '%ProgramFiles%\PostgreSQL\9.3\uninstall-postgresql.exe'
    uninstall_flags: ' --mode unattended'
    locale: en_US
    msiexec: False
    reboot: False

