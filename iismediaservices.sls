iismediaservices:
  '4.1.0938.454':
    full_name: 'IIS Media Services 4.1'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/1/7/5/175931F3-DCF8-4E8F-A62D-884C5ACF6D46/IISMedia64.msi'
    uninstaller: 'https://download.microsoft.com/download/1/7/5/175931F3-DCF8-4E8F-A62D-884C5ACF6D46/IISMedia64.msi'
    {% else %}
    installer: 'https://download.microsoft.com/download/9/E/A/9EA89305-2B2E-4379-8C1B-69FFFFD4D4FD/IISMedia32.msi'
    uninstaller: 'https://download.microsoft.com/download/9/E/A/9EA89305-2B2E-4379-8C1B-69FFFFD4D4FD/IISMedia32.msi'
    {% endif %}
    install_flags: '/quiet /norestart'
    uninstall_flags: '/quiet /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '4.0.0938.54':
    full_name: 'IIS Media Services 4.0'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/5/D/2/5D2EE743-3F52-4838-BE8E-02611F0FCFEE/IISMedia64.msi'
    uninstaller: 'https://download.microsoft.com/download/5/D/2/5D2EE743-3F52-4838-BE8E-02611F0FCFEE/IISMedia64.msi'
    {% else %}
    installer: 'https://download.microsoft.com/download/D/C/4/DC417D7E-20C2-42F9-8F1B-28F734AC8AFD/IISMedia32.msi'
    uninstaller: 'https://download.microsoft.com/download/D/C/4/DC417D7E-20C2-42F9-8F1B-28F734AC8AFD/IISMedia32.msi'
    {% endif %}
    install_flags: '/quiet /norestart'
    uninstall_flags: '/quiet /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '2.0.1':
    full_name: 'IIS Media Services 2.0'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/7/C/1/7C1C6ADA-88B5-4559-83E0-178811ADC5B7/IISMedia64.msi'
    uninstaller: 'https://download.microsoft.com/download/7/C/1/7C1C6ADA-88B5-4559-83E0-178811ADC5B7/IISMedia64.msi'
    {% else %}
    installer: 'https://download.microsoft.com/download/2/E/A/2EA2D1B4-71F8-48F4-BAD8-9D27323E1776/IISMedia32.msi'
    uninstaller: 'https://download.microsoft.com/download/2/E/A/2EA2D1B4-71F8-48F4-BAD8-9D27323E1776/IISMedia32.msi'
    {% endif %}
    install_flags: '/quiet /norestart'
    uninstall_flags: '/quiet /norestart'
    msiexec: True
    locale: en_US
    reboot: False
