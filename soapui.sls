{% if grains['cpuarch'] == 'AMD64' %}
soapui:
  '5.6.0':
    full_name: 'SoapUI 5.6.0 5.6.0'
    installer: 'https://s3.amazonaws.com/downloads.eviware/soapuios/5.6.0/SoapUI-x64-5.6.0.exe'
    install_flags: '-q'
    uninstaller: '%ProgramFiles%\SmartBear\SoapUI-5.6.0\uninstall.exe'
    uninstall_flags: '-q'
    msiexec: False
    locale: en_US
    reboot: False
{% endif %}
