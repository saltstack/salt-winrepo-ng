newrelic-infra:
  'latest':
    full_name: 'New Relic Infrastructure Agent'
    installer: 'https://download.newrelic.com/infrastructure_agent/windows/newrelic-infra.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'https://download.newrelic.com/infrastructure_agent/windows/newrelic-infra.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
