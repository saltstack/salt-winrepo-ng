nomacs:
{% for version in ['3.8.0'] %}
  '{{ version }}':
    full_name: 'nomacs - Image Lounge'
    installer: 'salt://win/repo-ng/nomacs/nomacs-setup-x64.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'salt://win/repo-ng/nomacs/nomacs-setup-x64.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
