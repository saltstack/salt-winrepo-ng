{% set PROGRAM_FILES = "%ProgramFiles%" %} 
soapui:
{% for version in ['5.4.0'] %}
  '{{ version }}':
    full_name: 'SoapUI {{ version }} {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://s3.amazonaws.com/downloads.eviware/soapuios/{{ version }}/SoapUI-x64-{{ version }}.exe'
    {% else %}
    installer: 'https://s3.amazonaws.com/downloads.eviware/soapuios/{{ version }}/SoapUI-x32-{{ version }}.exe'
    {% endif %}
    install_flags: '-q'
    uninstaller: '{{ PROGRAM_FILES }}\SmartBear\SoapUI-{{ version }}\uninstall.exe'
    uninstall_flags: '-q'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
