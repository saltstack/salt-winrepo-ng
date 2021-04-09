{% set PROGRAM_FILES = "%ProgramFiles%" %}
{% set versions = ['21.0.2', 
                   '21.0.0', 
                   '7.3.5', 
                   '7.3.4', 
                   '7.3.3', 
                   '7.3.2', 
                   '7.3.1', 
                   '7.3.0', 
                   '7.2.5', 
                   '7.2.4', 
                   '7.2.3', 
                   '7.2.2', 
                   '7.2.1', 
                   '7.2.0', 
                   '7.1.5', 
                   '7.1.4', 
                   '7.1.3', 
                   '7.1.2', 
                   '7.1.1', 
                   '7.1.0'] %}
#
dbeaver:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'DBeaver {{ version }}'
    installer: 'https://github.com/dbeaver/dbeaver/releases/download/{{ version }}/dbeaver-ce-{{ version }}-x86_64-setup.exe'
    install_flags: '/S /allusers'
    uninstaller: '{{ PROGRAM_FILES }}\DBeaver\Uninstall.exe'
    uninstall_flags: '/S /allusers'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
#
