{% set bitness = '64' if grains['cpuarch'] == 'AMD64' else '32' %}
strawberryperl:
  {% for version, dl_version in (('5.22.1', '5.22.0.1'), ('5.20.3.2', '5.20.3002')) %}
  '{{ version }}':
    full_name: 'Strawberry Perl ({{ bitness }}-bit)'
    installer: 'http://strawberryperl.com/download/{{ dl_version }}/strawberry-perl-{{ dl_version }}-{{ bitness }}bit.msi'
    uninstaller: 'http://strawberryperl.com/download/{{ dl_version }}/strawberry-perl-{{ dl_version }}-{{ bitness }}bit.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
