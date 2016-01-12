messageanalyzer:
  '4.0.7551.0':
    full_name: 'Microsoft Message Analyzer'
    # both 32-bit (x86) AND a 64-bit (AMD64) installer available
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/2/8/3/283DE38A-5164-49DB-9883-9D1CC432174D/MessageAnalyzer64.msi'
    {% else %}
    installer: 'https://download.microsoft.com/download/2/8/3/283DE38A-5164-49DB-9883-9D1CC432174D/MessageAnalyzer.msi'    
    {% endif %}
    install_flags: '/quiet /norestart'
    uninstaller: '{1CC02C23-8FCD-487E-860C-311EC0A0C933}'
    uninstall_flags: '/quiet /norestart'
    msiexec: True
    locale: en_US
    reboot: False
