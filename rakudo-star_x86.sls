rakudo-star_x86:
  '1.0.0':
    full_name: 'Rakudo Star 2016.01'
    installer: 'http://rakudo.org/downloads/star/rakudo-star-2016.01-x86 (no JIT).msi'
    install_flags: '/qn /norestart'
    uninstaller: 'http://rakudo.org/downloads/star/rakudo-star-2016.01-x86 (no JIT).msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
