{% set install_dir = salt["reg.read_value"]("HKLM", "SOFTWARE\\Salt Project\\Salt", "install_dir").vdata %}
{% set install_dir = install_dir or "C:\\salt" %}
salt-minion-py3:
  {%
      for version in [
          '3004-3',
          '3004-2',
          '3004',
          '3003.3',
          '3002.7',
          '3001.8',
      ]
  %}
  '{{ version }}':
    full_name: 'Salt Minion {{ version }} (Python 3)'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://repo.saltproject.io/windows/Salt-Minion-{{ version }}-Py3-AMD64-Setup.exe'
    {% else %}
    installer: 'https://repo.saltproject.io/windows/Salt-Minion-{{ version }}-Py3-x86-Setup.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ install_dir }}\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    use_scheduler: True
    reboot: False
  {% endfor %}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Versions of Salt that contain CVE's have been moved to an archive at:
# archive.repo.saltproject.io/windows. The ability to install those versions
# using winrepo has been removed.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {%
      for version in [
          '3003.2',
          '3003.1',
          '3003',
          '3002.6',
          '3002.5',
          '3002.4',
          '3002.3',
          '3002.2',
          '3002.1',
          '3002',
          '3001.7',
          '3001.6',
          '3001.5',
          '3000.9',
          '3000.8',
          '3000.7',
          '3001.4',
          '3001.2',
          '3001.1',
          '3001',
          '3000.6',
          '3000.4',
          '3000.3',
          '3000.2',
          '3000.1',
          '3000',
          '2019.2.8',
          '2019.2.6',
          '2019.2.5',
          '2019.2.4',
          '2019.2.3',
          '2019.2.2',
          '2019.2.1',
          '2019.2.0',
          '2018.3.5',
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
          '2017.7.0',
      ]
  %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'Salt Minion {{ version }} (Python 3)'
    uninstaller: '{{ install_dir }}\uninst.exe'
    uninstall_flags: '/S'
    use_scheduler: True
  {% endfor %}
