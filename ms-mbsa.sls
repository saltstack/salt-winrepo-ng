# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% with %}
  {% set source = 'https://download.microsoft.com/download/8/E/1/8E16A4C7-DD28-4368-A83A-282C82FC212A/' %}
  #{# set source = 'http://salt/packages/' #}
  {% set package = source + 'MBSASetup-x64-EN.msi' %}
  {% if grains.cpuarch == 'x86' %}
    {% set package = source + 'MBSASetup-x86-EN.msi' %}
  {% endif %}

ms-mbsa:
  '2.3.2211':
    full_name: 'Microsoft Baseline Security Analyzer 2.3'
    installer: {{ package }}
    uninstaller: {{ package }}
    install_flags: '/q'
    uninstall_flags: '/q'
    msiexec: True
    locale: en_US
    reboot: False

{% endwith %}
