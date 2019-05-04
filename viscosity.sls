{% set PROGRAM_FILES = "%ProgramFiles%" %}
{% set URL = 'https://swupdate.sparklabs.com/download/win/release/viscosity' %}
{% set VERSIONS = [('1.7.14', '1595'),
                   ('1.7.12', '1581'),
                   ('1.6.8', '1477')] %}

viscosity:
  {% for VERSION, BUILD in VERSIONS %}
  '{{ VERSION }}.{{ BUILD }}':
    full_name: Viscosity {{ VERSION }} ({{ BUILD }})
    installer: {{ URL }}/Viscosity%20Installer%20{{ VERSION }}.exe
    install_flags: /SP- /VERYSILENT /NORESTART /ALLUSERS /SUPPRESSMSGBOXES
    uninstaller: net
    uninstall_flags: stop viscosityservice & taskkill /IM viscosity.exe /F /T & forfiles /p "{{ PROGRAM_FILES }}\Viscosity" /m unins*.exe /c "cmd /c @path /SP- /VERYSILENT /NORESTART /SUPPRESSMSGBOXES"
    msiexec: False
    reboot: False
  {% endfor %}
