# Source: https://tortoisegit.org/
tortoise-git:
  {% for version in ['2.8.0.0', '2.7.0.0', '2.6.0.0', '2.5.0.0', '2.4.0.0', '2.3.0.0', '2.2.0.0', '2.1.0.0', '2.0.0.0', '1.8.16.0', '1.8.15.0', '1.8.14.0', '1.8.13.0'] %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'TortoiseGit {{ version }} (64 bit)'
    installer: 'https://download.tortoisegit.org/tgit/{{ version }}/TortoiseGit-{{ version }}-64bit.msi'
    uninstaller: 'https://download.tortoisegit.org/tgit/{{ version }}/TortoiseGit-{{ version }}-64bit.msi'
    {% else %}
    full_name: 'TortoiseGit {{ version }} (32 bit)'
    installer: 'https://download.tortoisegit.org/tgit/{{ version }}/TortoiseGit-{{ version }}-32bit.msi'
    uninstaller: 'https://download.tortoisegit.org/tgit/{{ version }}/TortoiseGit-{{ version }}-32bit.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
