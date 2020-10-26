# just 32-bit x86 installer used for now. x64 was introduced at ver. 7.0, but most plugins are still only 32-bit.
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
npp:
  {% for version in ['7.9', 
  					 '7.8.9', 
  					 '7.8.8', 
  					 '7.8.7', 
  					 '7.8.6', 
  					 '7.8.5', 
  					 '7.8.4', 
  					 '7.8.3', 
  					 '7.8.2', 
  					 '7.8.1', 
  					 '7.8', 
  					 '7.7.1', 
  					 '7.7',] %}
  '{{ version }}':
    full_name: 'Notepad++ (32-bit x86)'
    installer: 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v{{ version }}/npp.{{ version }}.Installer.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Notepad++\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Notepad Plus Plus that have had the installer assets removed from gihub.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {% for version in ['7.6.6',
					 '7.6.5', 
					 '7.6.4', 
					 '7.6.3', 
					 '7.6.2', 
					 '7.6.1', 
					 '7.6', 
					 '7.5.9', 
					 '7.5.8', 
					 '7.5.7', 
					 '7.5.6', 
					 '7.5.5', 
					 '7.5.4', 
					 '7.5.3', 
					 '7.5.2', 
					 '7.5.1', 
					 '7.5', 
					 '7.4.2', 
					 '7.4.1', 
					 '7.4', 
					 '7.3.3', 
					 '7.3.2', 
					 '7.3.1', 
					 '7.3', 
					 '7.2.2', 
					 '7.2.1', 
					 '7.2', 
					 '7.1', 
					 '7'] %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'Notepad++ (32-bit x86)'
    uninstaller: '{{ PROGRAM_FILES }}\Notepad++\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False    
  {% endfor %}
#
# the 64-bit installer is available from:
# https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v<version>/npp.<version>.Installer.x64.exe
