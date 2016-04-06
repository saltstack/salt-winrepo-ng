saltstack.minion:
  {% for version in '2015.8.8-2', '2015.8.7', '2015.8.5', '2015.8.4', '2015.8.3', '2015.8.1', '2015.8.0-3', '2015.5.9', '2015.5.8', '2015.5.6', '2015.5.5', '2015.5.3-2' %}
  '{{ version }}':
    full_name: 'Salt Minion {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://repo.saltstack.com/windows/Salt-Minion-{{ version }}-AMD64-Setup.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'https://repo.saltstack.com/windows/Salt-Minion-{{ version }}-x86-Setup.exe'
    {% endif %}
    {% raw %}
    #install_flags: '/S /master={{ salt['pillar.get']('salt:master', 'salt.domain.tld') }} /minion-id={{ salt['pillar.get']('salt:minion:ids:' ~ grains['host'] }}'
    {% endraw %}
    install_flags: '/S'
    uninstaller: 'C:\salt\uninst.exe'
    uninstall_flags: '/S'
    refresh: true
    msiexec: False
    use_scheduler: True
    locale: en_US
    reboot: False
  {% endfor %}
