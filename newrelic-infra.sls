# Please note that per
# https://docs.newrelic.com/docs/infrastructure/new-relic-infrastructure/installation/uninstall-infrastructure-agent#uninstall-windows
# the MSI uninstall does not remove files or settings,
# and the service must be stopped beforehand.
#
# So this uninstall is not going to work.

newrelic-infra:
  {% for version in ['1.0.279', '1.0.292', '1.0.296', '1.0.301', '1.0.311', '1.0.316', '1.0.323', '1.0.336', '1.0.338', '1.0.341', '1.0.673', '1.0.677', '1.0.682', '1.0.690', '1.0.703'] %}
 '{{ version }}':
   full_name: 'New Relic Infrastructure Agent'
   installer: 'https://download.newrelic.com/infrastructure_agent/windows/newrelic-infra.{{ version }}.msi'
   install_flags: '/qn /norestart'
   uninstaller: 'https://download.newrelic.com/infrastructure_agent/windows/newrelic-infra.{{ version }}.msi'
   uninstall_flags: '/qn /norestart'
   msiexec: True
   locale: en_US
   reboot: False
 {% endfor %}
