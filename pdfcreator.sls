# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
pdfcreator:
  '4.1.3':
    full_name: 'PDFCreator'
    installer: 'https://cyan.download.pdfforge.org/pdfcreator/4.1.3/PDFCreator-4_1_3-Setup.exe'
    install_flags: '/VERYSILENT /NORESTART /DontUseYahooSearch /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\PDFCreator\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: en_US
    reboot: False
  '2.5.0':
    full_name: 'PDFCreator'
    installer: 'http://white.download.pdfforge.org/pdfcreator/2.5.0/PDFCreator-2_5_0-Setup.exe'
    install_flags: '/VERYSILENT /NORESTART /DontUseYahooSearch /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\PDFCreator\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: en_US
    reboot: False
