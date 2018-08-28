# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This software definition will only work in versions of Salt newer than
# 2015.8.2. In verion 2015.8.2 we added the `use_scheduler` option which
# allowed us to launch the installer using the Windows task manager.
# This option is not available in earlier versions of Salt. So, while this
# software definition will allow you to install versions of Salt older than
# 2015.8.2 you will not be able to use pkg.install to upgrade Salt again. You
# will have to upgrade Salt through another means.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Salt added support for Py3 with 2017.7.0. As a result, the package names have
# changed to denote the Python version included with the install. So add new
# versions of the 2017.7 branch here. Versions from older branches will be
# added below.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
salt-minion:
  {% for version in ['2018.3.2',
                     '2018.3.1',
                     '2018.3.0',
                     '2017.7.7',
                     '2017.7.6',
                     '2017.7.5',
                     '2017.7.4',
                     '2017.7.3',
                     '2017.7.2',
                     '2017.7.1',
                     '2017.7.0'] %}
  '{{ version }}':
    full_name: 'Salt Minion {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://repo.saltstack.com/windows/Salt-Minion-{{ version }}-Py2-AMD64-Setup.exe'
    {% else %}
    installer: 'https://repo.saltstack.com/windows/Salt-Minion-{{ version }}-Py2-x86-Setup.exe'
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
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Add versions from older branches here:
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {% for version in ['2016.11.9',
                     '2016.11.8',
                     '2016.11.7',
                     '2016.11.6',
                     '2016.11.5',
                     '2016.11.4',
                     '2016.11.3',
                     '2016.11.2',
                     '2016.11.1',
                     '2016.11.0'] %}
  '{{ version }}':
    full_name: 'Salt Minion {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://repo.saltstack.com/windows/Salt-Minion-{{ version }}-AMD64-Setup.exe'
    {% else %}
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
    reboot: False
  {% endfor %}

