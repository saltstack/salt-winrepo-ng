mysql-essential:
  '5.1.73':
    full_name: 'MySQL Server 5.1'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://cdn.mysql.com/Downloads/MySQL-5.1/mysql-essential-5.1.73-winx64.msi'
    uninstaller: 'https://cdn.mysql.com/Downloads/MySQL-5.1/mysql-essential-5.1.73-winx64.msi'
    {% else %}
    installer: 'https://cdn.mysql.com/Downloads/MySQL-5.1/mysql-essential-5.1.73-win32.msi'
    uninstaller: 'https://cdn.mysql.com/Downloads/MySQL-5.1/mysql-essential-5.1.73-win32.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
