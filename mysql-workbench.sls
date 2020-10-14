#http://www.mirrorservice.org/sites/ftp.mysql.com/Downloads/MySQLGUITools/

mysql-workbench-community:
  {% for version in ['8.0.21', '8.0.20', '8.0.19'] %}
    '{{ version }}':
      full_name: 'MySQL Workbench 8.0 CE'
      installer: 'https://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community-{{ version }}-winx64.msi'
      install_flags: '/quiet /norestart'
      uninstaller: 'https://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community-{{ version }}-winx64.msi'
      uninstall_flags: '/qn /norestart'
      msiexec: True
      locale: en_US
      reboot: False
  # Read for MySQL Workbench Prerequisites: https://dev.mysql.com/resources/workbench_prerequisites.html
  {% endfor %}
