{% if grains['cpuarch'] == 'AMD64' %}
soapui:
{% for version in ['5.6.0', '5.4.0'] %}
  '{{ version }}':
    full_name: 'SoapUI {{ version }} {{ version }}'
    installer: 'https://s3.amazonaws.com/downloads.eviware/soapuios/{{ version }}/SoapUI-x64-{{ version }}.exe'
    install_flags: '-q'
    uninstaller: '%ProgramFiles%\SmartBear\SoapUI-{{ version }}\uninstall.exe'
    uninstall_flags: '-q'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
{% endif %}
