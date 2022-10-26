{% set base_url = "https://github.com/oneclick/rubyinstaller/releases/download/" %}
{% set versions = (
    ('2.2.3-p173', '2.2.3', '22'),
    ('2.1.7-p400', '2.1.7', '21'),
    ('2.0.0-p647', '2.0.0-p647', '200'),
) %}
rubyinstaller_x64:
{% for version, dl_version, dsk_version in versions %}
  '{{ version }}':
    full_name: 'Ruby {{ version }}-x64'
    installer: {{ base_url }}ruby-{{ dl_version }}/rubyinstaller-{{ dl_version }}-x64.exe
    install_flags: '/verysilent'
    uninstaller: 'C:\Ruby{{ dsk_version }}-x64\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
