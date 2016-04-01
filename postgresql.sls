postgresql:
  '9.5':
    full_name: 'PostgreSQL 9.5'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://get.enterprisedb.com/postgresql/postgresql-9.5.0-1-windows-x64.exe'
    {% else %}
    installer: 'http://get.enterprisedb.com/postgresql/postgresql-9.5.0-1-windows.exe'
    {% endif %}
    install_flags: ' --unattendedmodeui minimal --mode unattended --superpassword postgres'
    uninstaller: '%ProgramFiles%\PostgreSQL\9.5\uninstall-postgresql.exe'
    uninstall_flags: ' --mode unattended'
    locale: {{grains['locale_info']['defaultlanguage']}}
    msiexec: False
    reboot: False
  '9.4':
    full_name: 'PostgreSQL 9.4'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://get.enterprisedb.com/postgresql/postgresql-9.4.5-3-windows-x64.exe'
    {% else %}
    installer: 'http://get.enterprisedb.com/postgresql/postgresql-9.4.5-3-windows.exe'
    {% endif %}
    install_flags: ' --unattendedmodeui minimal --mode unattended --superpassword postgres'
    uninstaller: '%ProgramFiles%\PostgreSQL\9.4\uninstall-postgresql.exe'
    uninstall_flags: ' --mode unattended'
    locale: {{grains['locale_info']['defaultlanguage']}}
    msiexec: False
    reboot: False
  '9.3':
    full_name: 'PostgreSQL 9.3'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://get.enterprisedb.com/postgresql/postgresql-9.3.10-3-windows-x64.exe'
    {% else %}
    installer: 'http://get.enterprisedb.com/postgresql/postgresql-9.3.10-3-windows.exe'
    {% endif %}
    install_flags: ' --unattendedmodeui minimal --mode unattended --superpassword postgres'
    uninstaller: '%ProgramFiles%\PostgreSQL\9.3\uninstall-postgresql.exe'
    uninstall_flags: ' --mode unattended'
    locale: {{grains['locale_info']['defaultlanguage']}}
    msiexec: False
    reboot: False
