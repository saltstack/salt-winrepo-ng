# Read for MySQL Server 5.6.23.0 Community installation instructions:
# https://dev.mysql.com/doc/refman/5.6/en/mysql-installer-gui.html
# https://dev.mysql.com/doc/refman/5.6/en/MySQLInstallerConsole.html

# The latest version will be here... this will always contain a single version
{% set versions = [
    "8.0.31.0",
] %}
{% set base_url = "https://cdn.mysql.com//Downloads/MySQLInstaller/" %}
mysql-installer-community:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'MySQL Installer - Community'
    installer: {{ base_url }}mysql-installer-community-{{ version }}.msi
    install_flags: '/quiet /norestart'
    uninstaller: {{ base_url }}mysql-installer-community-{{ version }}.msi
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}

# When a new version is release, older versions will be archived
{% set versions = [
    "8.0.22.0",
    "5.6.23.0",
] %}
{% set base_url = "https://cdn.mysql.com/archives/mysql-installer/" %}
  {% for version in versions %}
  '{{ version }}':
    full_name: 'MySQL Installer - Community'
    installer: {{ base_url }}mysql-installer-community-{{ version }}.msi
    install_flags: '/quiet /norestart'
    uninstaller: {{ base_url }}mysql-installer-community-{{ version }}.msi
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
