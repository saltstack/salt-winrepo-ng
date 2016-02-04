applicationrequestrouting:
  '3.0.1952':
    full_name: 'Microsoft Application Request Routing 3.0'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://download.microsoft.com/download/E/9/8/E9849D6A-020E-47E4-9FD0-A023E99B54EB/requestRouter_amd64.msi'
    uninstaller: 'http://download.microsoft.com/download/E/9/8/E9849D6A-020E-47E4-9FD0-A023E99B54EB/requestRouter_amd64.msi'
    {% else %}
    installer: 'http://download.microsoft.com/download/5/3/2/532630BE-7DCA-4352-984B-8D4EADBE5BEF/requestRouter_x86.msi'
    uninstaller: 'http://download.microsoft.com/download/5/3/2/532630BE-7DCA-4352-984B-8D4EADBE5BEF/requestRouter_x86.msi'
    {% endif %}
    install_flags: '/quiet /norestart'
    uninstall_flags: '/quiet /norestart'
    msiexec: True
    locale: en_US
    reboot: False
