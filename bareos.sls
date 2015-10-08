# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
bareos:
  '15.2.1-15.1':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Bareos 15.2.1-15.1'
    installer: 'http://download.bareos.org/bareos/release/15.2/windows/winbareos-15.2.1-postvista-64-bit-r15.1.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Bareos 15.2.1-15.1'
    installer: 'http://download.bareos.org/bareos/release/15.2/windows/winbareos-15.2.1-postvista-32-bit-r15.1.exe'
    {% endif %}
    install_flags: '/S /CLIENTNAME={{ salt['pillar.get']('bareos:clientname') }} /CLIENTPASSWORD={{ salt['pillar.get']('bareos:clientpassword') }} /DIRECTORNAME={{ salt['pillar.get']('bareos:directorname') }} /CLIENTADDRESS={{ salt['pillar.get']('bareos:clientaddress') }} /CLIENTMONITORPASSWORD={{ salt['pillar.get']('bareos:clientmonitorpassword') }} /CLIENTCOMPATIBLE={{ salt['pillar.get']('bareos:compatible') }} /DIRECTORADDRESS={{ salt['pillar.get']('bareos:directoraddress') }}'
    uninstaller: '{{ PROGRAM_FILES }}\Bareos\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '14.2.2.postvista-16.1':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Bareos 14.2.2.postvista-16.1'
    installer: 'http://download.bareos.org/bareos/release/14.2/windows/winbareos-14.2.2.postvista-64-bit-r16.1.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Bareos 14.2.2.postvista-16.1'
    installer: 'http://download.bareos.org/bareos/release/14.2/windows/winbareos-14.2.2.postvista-32-bit-r16.1.exe'
    {% endif %}
    install_flags: '/S /CLIENTNAME={{ salt['pillar.get']('bareos:clientname') }} /CLIENTPASSWORD={{ salt['pillar.get']('bareos:clientpassword') }} /DIRECTORNAME={{ salt['pillar.get']('bareos:directorname') }} /CLIENTADDRESS={{ salt['pillar.get']('bareos:clientaddress') }} /CLIENTMONITORPASSWORD={{ salt['pillar.get']('bareos:clientmonitorpassword') }} /CLIENTCOMPATIBLE={{ salt['pillar.get']('bareos:compatible') }} /DIRECTORADDRESS={{ salt['pillar.get']('bareos:directoraddress') }}'
    uninstaller: '{{ PROGRAM_FILES }}\Bareos\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False

# Example pillar for silent install and configure
# bareos:
#   clientname: example-fd
#   clientpassword: P@ssw0rd
#   directorname: bareos-dir
#   clientaddress: example.domain.tld
#   clientmonitorpassword: P@ssw0rd
#   compatible: 0
#   directoraddress: backup.domain.tld

