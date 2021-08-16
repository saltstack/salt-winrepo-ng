# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
# Source: http://www.safer-networking.org/
spybot:
  '2.7.64.0':
    full_name: 'Spybot - Search & Destroy'
    installer: 'https://updates2.safer-networking.org/spybot1/spybotsd-2.7.64.0.exe'
    install_flags: '/VERYSILENT /SuppressMsgGBoxes /NoRestart /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\Spybot - Search & Destroy 2\unins000.exe'
    uninstall_flags: '/VERYSILENT /SuppressMsgGBoxes /NoRestart /SP-'
    msiexec: False
    locale: en_US
    reboot: False
#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Spybot - Search & Destroy that have had the installer assets removed 
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  '2.4':
    skip_urltest: True    
    full_name: 'Spybot - Search & Destroy'
    #installer: 'http://spybotupdates.com/files/spybot-2.4.exe'
    #install_flags: '/VERYSILENT /SuppressMsgGBoxes /NoRestart /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\Spybot - Search & Destroy 2\unins000.exe'
    uninstall_flags: '/VERYSILENT /SuppressMsgGBoxes /NoRestart /SP-'
    msiexec: False
    locale: en_US
    reboot: False
#    
# alternative download URLs
# http://www.spybotupdates.biz/files/spybot-2.4.exe
# http://spybot-mirror.com/files/spybot-2.4.exe    
