{% set SOURCE_PATH = 'https://downloads.bitnami.com/files/stacks/wampstack/' %}

wamp-stack:
  {% for VERSION in ['7.1.27-1', '5.6.40-1'] %}
  '{{ VERSION }}':
    full_name: 'Bitnami WAMP Stack {{ VERSION }}'
    installer: '{{ SOURCE_PATH }}{{ VERSION }}/bitnami-wampstack-{{ VERSION }}-windows-x64-installer.exe'
    install_flags: '--mode unattended --base_password ChangeMe --apache_server_port 8080'
    uninstaller: 'C:\Bitnami\wampstack-{{ VERSION }}\uninstall.exe'
    uninstall_flags: '--mode unattended'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
