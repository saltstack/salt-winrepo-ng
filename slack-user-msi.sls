#MSI for per-user deployment package
#The MSI for per-user deployment adds the Slack Installer machine-wide, rather than individually installing Slack for Windows. 
#The Slack Installer will only add Slack for Windows if it was never installed for the user currently logged into the machine.
#https://get.slack.help/hc/en-us/articles/212475728-Deploy-Slack-via-Microsoft-Installer

slack-user-msi:
  latest:
    full_name: 'Slack Machine-Wide Installer'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://slack-ssb-updates.global.ssl.fastly.net/releases_x64/SlackSetup.msi'
    uninstaller: 'https://slack-ssb-updates.global.ssl.fastly.net/releases_x64/SlackSetup.msi'
    {% else %}
    installer: 'https://slack-ssb-updates.global.ssl.fastly.net/releases/SlackSetup.msi'
    uninstaller: 'https://slack-ssb-updates.global.ssl.fastly.net/releases/SlackSetup.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
