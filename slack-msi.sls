slack-msi:
  '2.1.0':
    full_name: 'Slack Machine-Wide Installer'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://slack-ssb-updates.global.ssl.fastly.net/releases_x64/SlackSetup.msi'
    uninstaller: 'https://slack-ssb-updates.global.ssl.fastly.net/releases_x64/SlackSetup.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'https://slack-ssb-updates.global.ssl.fastly.net/releases/SlackSetup.msi'
    uninstaller: 'https://slack-ssb-updates.global.ssl.fastly.net/releases/SlackSetup.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
