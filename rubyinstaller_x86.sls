rubyinstaller_x86:
  {% for version, dl_version, dsk_version in (('2.2.3-p173', '2.2.3', '22'), ('2.1.7-p400', '2.1.7', '21'), ('2.0.0-p647', '2.0.0-p647', '200'), ('1.9.3-p551', '1.9.3-p551', '193')) %}
  '{{ version }}':
    full_name: 'Ruby {{ version }}'
    installer: 'http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-{{ dl_version }}.exe'
    install_flags: '/verysilent'
    uninstaller: 'C:\Ruby{{ dsk_version }}\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
