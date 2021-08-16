# https://sandboxie-website-archive.github.io/www.sandboxie.com/AllVersions.html
sandboxie:
{% for version, maj_version, min_version in (('5.33.3', '533', '-3'), 
                                             ('5.33.2', '533', '-2'), 
                                             ('5.31.6', '531', '-6'), 
                                             ('5.31.4', '531', '-4'), 
                                             ('5.31.1', '531', '-1'), 
                                             ('5.22',   '522', '' )) %}
  '{{ version }}':  
{% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Sandboxie {{ version }} (64-bit)'
    installer: 'https://sandboxie-website-archive.github.io/www.sandboxie.com/sbdl/SandboxieInstall64-{{ maj_version }}{{ min_version }}.exe'
    uninstaller: 'C:\Windows\Installer\SandboxieInstall64.exe'
{% else %}
    full_name: 'Sandboxie {{ version }} (32-bit)'
    installer: 'https://sandboxie-website-archive.github.io/www.sandboxie.com/sbdl/SandboxieInstall32-{{ maj_version }}{{ min_version }}.exe'
    uninstaller: 'C:\Windows\Installer\SandboxieInstall32.exe'
{% endif %}    
    install_flags: '/S'
    uninstall_flags: '/S /remove'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Sandboxie that have had the installer assets removed.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  '4.20':
    skip_urltest: True  
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Sandboxie 4.20 (64-bit)'
    uninstaller: 'C:\Windows\Installer\SandboxieInstall64.exe'
    {% else %}
    full_name: 'Sandboxie 4.20 (32-bit)'
    uninstaller: 'C:\Windows\Installer\SandboxieInstall32.exe'
    {% endif %}
    uninstall_flags: '/remove'
    msiexec: False
    locale: en_US
    reboot: False
#
