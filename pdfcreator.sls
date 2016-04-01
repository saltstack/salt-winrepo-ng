# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
pdfcreator:
  '2.3.0':
    full_name: 'PDFCreator'
    installer: 'http://white.download.pdfforge.org/pdfcreator/2.3.0/PDFCreator-2_3_0-Setup.exe'
    install_flags: '/VERYSILENT /NORESTART /DontUseYahooSearch /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\PDFCreator\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}    
    reboot: False
  '1.7.2':
    full_name: 'PDFCreator'
    installer: 'http://violet.download.pdfforge.org/pdfcreator/1.7.2/PDFCreator-1_7_2_setup.exe'
    install_flags: '/VERYSILENT /NORESTART /DontUseYahooSearch /SP- /LOADINF="//linux/install/PDFCreator/setup.inf"'
    uninstaller: '{{ PROGRAM_FILES }}\PDFCreator\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}    
    reboot: False
