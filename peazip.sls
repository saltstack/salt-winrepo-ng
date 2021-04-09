peazip:
  {% for version in ['7.8.0', 
                     '7.7.1', 
                     '7.7.0', 
                     '7.6.0', 
                     '7.5.0', 
                     '7.4.2', 
                     '7.4.1', 
                     '7.4.0', 
                     '7.3.2', 
                     '7.3.1', 
                     '7.3.0', 
                     '7.2.2', 
                     '7.2.1', 
                     '7.2.0', 
                     '7.1.1', 
                     '7.1.0', 
                     '7.0.1', 
                     '7.0.0', 
                     '6.9.2', 
                     '6.9.1', 
                     '6.9.0', 
                     '6.8.1', 
                     '6.8.0', 
                     '6.7.2', 
                     '6.7.1', 
                     '6.7.0', 
                     '6.6.1', 
                     '6.6.0', 
                     '6.5.1', 
                     '6.5.0', 
                     '6.4.1', 
                     '6.4.0', 
                     '6.3.1', 
                     '6.3.0', 
                     '6.2.0', 
                     '6.1.1', 
                     '6.1.0', 
                     '6.0.3', 
                     '6.0.2', 
                     '6.0.1', 
                     '6.0.0' ] %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'PeaZip {{ version }} (WIN64)'
    installer: 'https://github.com/peazip/PeaZip/releases/download/{{ version }}/peazip-{{ version }}.WIN64.exe'
    {% else %}
    full_name: 'PeaZip {{ version }}'
    installer: 'https://github.com/peazip/PeaZip/releases/download/{{ version }}/peazip-{{ version }}.WINDOWS.exe'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '%ProgramFiles%\PeaZip\unins000.exe'
    uninstall_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
#
