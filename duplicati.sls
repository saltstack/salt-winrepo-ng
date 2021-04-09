# https://www.duplicati.com
# https://www.duplicati.com/download
duplicati:
  {% for version, type, date, guid32, guid64 in [('2.0.5.1', 'beta', '2020-01-18', '{5BDF9713-1281-4651-AC19-C4D80FE040E7}', '{FC1F2B24-1783-4352-98E9-669896601613}')] %}
  '{{ version }}':    
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Duplicati 2'
    installer: 'https://updates.duplicati.com/beta/duplicati%20{{ version }}_{{ type }}_{{ date }}.x64.msi'
    uninstall_flags: '/x {{ guid64 }} /qn /norestart'
    {% else %}
    full_name: 'Duplicati 2'
    installer: 'https://updates.duplicati.com/beta/duplicati%20{{ version }}_{{ type }}_{{ date }}.msi'
    uninstall_flags: '/x {{ guid32 }} /qn /norestart'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec'
    msiexec: True
    locale: en_US
    reboot: False
    refresh: False
    cache_dir: False
    use_scheduler: False
  {% endfor %}
#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Notepad Plus Plus that have had the installer assets removed.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
  '1.3.4':
    skip_urltest: True
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Duplicati (x64)'
    #installer: 'https://duplicati.googlecode.com/files/Duplicati%201.3.4.x64.msi'
    uninstall_flags: '/x {77BA8977-0BA6-4A83-A741-1DFAD23A6B23} /qn /norestart'
    {% else %}
    full_name: 'Duplicati'
    #installer: 'https://duplicati.googlecode.com/files/Duplicati%201.3.4.msi'
    uninstall_flags: '/x {73DB7BB3-FA85-4E45-BEC4-FAE8BB1A670A} /qn /norestart'
    {% endif %}
    #install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec'
    msiexec: True
    locale: en_US
    reboot: False
    refresh: False
    cache_dir: False
    use_scheduler: False
#
