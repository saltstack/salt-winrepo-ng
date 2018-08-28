rasclient:
  {% for rel_version, version  in [('16.2.19160', '16')] %}
  '{{ version }}':

    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Parallels Client-64 bit'
    installer: 'http://download.parallels.com/ras/v{{ version }}/{{ rel_version }}/RASClient-x64-{{ rel_version }}.msi'
    uninstaller: 'http://download.parallels.com/ras/v{{ version }}/{{ rel_version }}/RASClient-x64-{{ rel_version }}.msi'
    {% else %}
    full_name: 'Parallels Client'
    installer: 'http://download.parallels.com/ras/v{{ version }}/{{ rel_version }}/RASClient-{{ rel_version }}.msi'
    uninstaller: 'http://download.parallels.com/ras/v{{ version }}/{{ rel_version }}/RASClient-{{ rel_version }}.msi'
    {% endif %}        
    install_flags: '/qn /norestart'    
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
