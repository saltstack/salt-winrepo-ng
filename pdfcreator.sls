pdfcreator:
  '4.1.3':
    full_name: 'PDFCreator'
    installer: 'https://cyan.download.pdfforge.org/pdfcreator/4.1.3/PDFCreator-4_1_3-Setup.exe'
    install_flags: '/VERYSILENT /NORESTART /DontUseYahooSearch /SP-'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%ProgramFiles%\PDFCreator\unins000.exe'
    {% else %}
    uninstaller: '%ProgramFiles(x86)%\PDFCreator\unins000.exe'
    {% endif %}
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: en_US
    reboot: False
