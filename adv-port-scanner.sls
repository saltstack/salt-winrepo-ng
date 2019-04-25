{% set versions = {'2.5':['3680']} %}
{% set source_path = 'salt://win/repo-ng/adv-port-scanner' %}

adv-port-scanner:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{ major }}.{{ minor }}':
    full_name: 'Advanced Port Scanner {{ major }}'
    installer: '{{ source_path }}/Advanced_Port_Scanner_{{ major }}.{{ minor }}.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- & taskkill /F /T /IM advanced_port_scanner.exe & exit 0'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /noreboot /x {76773275-7196-4B20-B3C6-27EDA624C053}'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}

# it can be manually downloaded from:
# http://www.advanced-port-scanner.com
# a product of: www.radmin.com
