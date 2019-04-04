#MSI machine-wide deployment package
#The MSI for single installation deployment installs Slack for Windows machine-wide, either to Program Files or a location of your choice.
#It is multi-client-capable, meaning that it can be used by multiple users on one machine,
#keeping their profiles separately in %ROAMINGAPPDATA%. Using this method, Slack will not receive automatic updates.
#https://get.slack.help/hc/en-us/articles/212475728-Deploy-Slack-via-Microsoft-Installer

slack-machine-msi:
  {% for version in ['3.3.7.0','3.3.6.0','3.3.3.0'] %}
  '{{version}}':
    full_name: 'Slack'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://slack-ssb-updates.global.ssl.fastly.net/releases_x64/slack-standalone-{{version}}.msi'
    uninstaller: 'https://slack-ssb-updates.global.ssl.fastly.net/releases_x64/slack-standalone-{{version}}.msi'
    {% else %}
    installer: 'https://slack-ssb-updates.global.ssl.fastly.net/releases/slack-standalone-{{version}}.msi'
    uninstaller: 'https://slack-ssb-updates.global.ssl.fastly.net/releases/slack-standalone-{{version}}.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
