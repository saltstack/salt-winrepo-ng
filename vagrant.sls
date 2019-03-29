vagrant:
  {% set arch = {'AMD64': 'x86_64', 'x86': 'i686'}[grains['cpuarch']] %}
  {% for version in ['2.0.1','2.0.2','2.0.3','2.0.4','2.1.0','2.1.1','2.1.2','2.1.3','2.1.4','2.1.5','2.2.0','2.2.1','2.2.2','2.2.3','2.2.4'] %}
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
