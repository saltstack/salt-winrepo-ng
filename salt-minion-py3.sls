# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This software definition will only work in versions of Salt newer than
# 2015.8.2. In verion 2015.8.2 we added the `use_scheduler` option which
# allowed us to launch the installer using the Windows task manager.
# This option is not available in earlier versions of Salt. So, while this
# software definition will allow you to install versions of Salt older than
# 2015.8.2 you will not be able to use pkg.install to upgrade Salt again. You
# will have to upgrade Salt through another means.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
salt-minion-py3:
  {% for version in ['2019.2.2',
                     '2019.2.1',
                     '2019.2.0',
                     '2018.3.4',
                     '2018.3.3',
                     '2018.3.2',
                     '2018.3.1',
                     '2018.3.0',
                     '2017.7.8',
                     '2017.7.7',
                     '2017.7.6',
                     '2017.7.5',
                     '2017.7.4',
                     '2017.7.3',
                     '2017.7.2',
                     '2017.7.1',
                     '2017.7.0'] %}
  '{{ version }}':
    full_name: 'Salt Minion {{ version }} (Python 3)'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://repo.saltstack.com/windows/Salt-Minion-{{ version }}-Py3-AMD64-Setup.exe'
    {% else %}
    installer: 'https://repo.saltstack.com/windows/Salt-Minion-{{ version }}-Py3-x86-Setup.exe'
    {% endif %}
    {% raw %}
    # install_flags: "/S /master={{ salt['pillar.get']('salt:master', 'salt.domain.tld') }} /minion-id={{ salt['pillar.get']('salt:minion:ids:' ~ grains['host'] }}"
    {% endraw %}
    install_flags: '/S'
    uninstaller: 'C:\salt\uninst.exe'
    uninstall_flags: '/S'
    refresh: true
    msiexec: False
    use_scheduler: True
    reboot: False
  {% endfor %}

