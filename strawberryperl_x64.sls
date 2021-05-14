strawberryperl_x64:
  {% for version, dl_version in (('5.32.1001', '5.32.1.1'),
                                 ('5.30.3001', '5.30.3.1'),
                                 ('5.28.2001', '5.28.2.1'),
                                 ('5.26.3001', '5.26.3.1'),
                                 ('5.24.4001', '5.24.4.1'),
                                 ('5.22.3001', '5.22.3.1'),
                                 ('5.20.3003', '5.20.3.3'),
                                 ('5.18.4001', '5.18.4.1'),
                                 ('5.16.3001', '5.16.3.1'),
                                 ('5.14.4001', '5.14.4.1')) %}
#
  '{{ version }}':
    full_name: 'Strawberry Perl (64-bit)'
    installer: 'http://strawberryperl.com/download/{{ dl_version }}/strawberry-perl-{{ dl_version }}-64bit.msi'
    uninstaller: 'http://strawberryperl.com/download/{{ dl_version }}/strawberry-perl-{{ dl_version }}-64bit.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
# 
