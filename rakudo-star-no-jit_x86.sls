# rakudo-star-no-jit_x86:
rakudo-star-no-jit-2016.01_x86:
  '1.0.0':
    full_name: 'Rakudo Star 2016.01'
    installer: 'https://rakudo.org/dl/star/rakudo-star-2016.01-01-win-x86-(no%20JIT).msi'
    install_flags: '/qn /norestart'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {1032E96A-E5D5-4630-AAB4-2DECE094C227} /qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False

