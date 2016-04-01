strawberryperl_x64:
  {% for version, dl_version in (('5.22.1', '5.22.0.1'), ('5.20.3002', '5.20.3.2')) %}
  '{{ version }}':
    full_name: 'Strawberry Perl (64-bit)'
    installer: 'http://strawberryperl.com/download/{{ dl_version }}/strawberry-perl-{{ dl_version }}-64bit.msi'
    uninstaller: 'http://strawberryperl.com/download/{{ dl_version }}/strawberry-perl-{{ dl_version }}-64bit.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  {% endfor %}
