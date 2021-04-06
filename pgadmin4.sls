{% if grains['cpuarch'] == 'AMD64' %}
  {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
  {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
{% set versions = ['5.1', 
                   '5.0', 
                   '4.30', 
                   '4.29',                    
                   '4.28',
                   '4.27', 
                   '4.26', 
                   '4.25' 
                   '3.6', 
                   '2.1', 
                   '1.6'] %}
#
pgadmin4:
{% for version in versions %}
  '{{ version }}':
    full_name: 'pgAdmin 4 version {{ version }}'
    installer: 'https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v{{ version }}/windows/pgadmin4-{{ version }}-x86.exe'
    install_flags: '/SP- /verysilent /norestart'
  {% if version == "1.6" %}
    uninstaller: '{{ PROGRAM_FILES }}\pgAdmin 4\v1\unins000.exe'
  {% elif version == "2.0" or version == "2.1" %}
    uninstaller: '{{ PROGRAM_FILES }}\pgAdmin 4\v2\unins000.exe'
  {% endif %}
    uninstall_flags: '/verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
#
#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of pgAdmin 4 that have had the installer assets removed.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {% for version in {% set versions = ['4.24',
                                       '4.23', 
                                       '4.22',
                                       '4.21',                     
                                       '4.20', 
                                       '4.19',                    
                                       '4.18',
                                       '4.17', 
                                       '4.16', 
                                       '4.15',                    
                                       '4.14',
                                       '4.13', 
                                       '4.12', 
                                       '4.11',                    
                                       '4.10', 
                                       '4.9',                    
                                       '4.8',
                                       '4.7', 
                                       '4.6', 
                                       '4.5',                    
                                       '4.4',
                                       '4.3', 
                                       '4.2', 
                                       '4.1',                    
                                       '4.0', 
                                       '3.5',                    
                                       '3.4',
                                       '3.3', 
                                       '3.2', 
                                       '3.1',                    
                                       '3.0', 
                                       '2.0'] %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'pgAdmin 4 version {{ version }}'
    installer: 'https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v{{ version }}/windows/pgadmin4-{{ version }}-x86.exe'
    install_flags: '/SP- /verysilent /norestart'
  {% if version == "1.6" %}
    uninstaller: '{{ PROGRAM_FILES }}\pgAdmin 4\v1\unins000.exe'
  {% elif version == "2.0" or version == "2.1" %}
    uninstaller: '{{ PROGRAM_FILES }}\pgAdmin 4\v2\unins000.exe'
  {% endif %}
    uninstall_flags: '/verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
#
  
