duplicati:
  '1.3.4':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Duplicati (x64)'
    installer: 'http://updates.duplicati.com/1.3.x/Duplicati%201.3.4.x64.msi  '
    uninstaller: 'http://updates.duplicati.com/1.3.x/Duplicati%201.3.4.x64.msi'
    {% else %}
    full_name: 'Duplicati'
    installer: 'http://updates.duplicati.com/1.3.x/Duplicati%201.3.4.msi'
    uninstaller: 'http://updates.duplicati.com/1.3.x/Duplicati%201.3.4.msi'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
    refresh: False
    cache_dir: False
    use_scheduler: False
