vagrant:
  {% set arch = {'AMD64': 'x86_64', 'x86': 'i686'}[grains.cpuarch] %}
  {% for version in ['2.2.4', '2.2.3', '2.2.2', '2.2.1', '2.2.0', '2.1.5', '2.1.4', '2.1.3', '2.1.2', '2.1.1', '2.1.0', '2.0.4', '2.0.3', '2.0.2', '2.0.1', '2.0.0', '1.9.8', '1.9.7', '1.9.6'] %}
  '{{ version }}':
    full_name: 'Vagrant'
    installer: 'https://releases.hashicorp.com/vagrant/{{ version }}/vagrant_{{ version }}_{{ arch }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'https://releases.hashicorp.com/vagrant/{{ version }}/vagrant_{{ version }}_{{ arch }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
  {% for version in ['1.9.5', '1.9.4', '1.9.3', '1.9.2', '1.9.1', '1.9.0', '1.8.7', '1.8.6', '1.8.5', '1.8.4', '1.8.1', '1.8.0', '1.7.4', '1.7.3', '1.7.2', '1.7.1', '1.6.5', '1.6.4', '1.6.3', '1.6.2', '1.6.1', '1.6.0', '1.5.4', '1.5.3', '1.5.2', '1.5.1', '1.5.0', '1.4.3', '1.4.2', '1.4.1', '1.4.0'] %}
  '{{ version }}':
    full_name: 'Vagrant'
    installer: 'https://releases.hashicorp.com/vagrant/{{ version }}/vagrant_{{ version }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'https://releases.hashicorp.com/vagrant/{{ version }}/vagrant_{{ version }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
