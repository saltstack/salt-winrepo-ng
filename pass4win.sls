pass4win:
  '1.2.1.9':
    full_name: 'Pass4Win - Windows version of Pass (http://www.passwordstore.org/) in the sense that the store (password structure) is and should be exactly the same between the two programs.'
    # both 32-bit (x86) AND a 64-bit (AMD64) installer available
    {% if grains['cpuarch'] == 'AMD64' %}
      {% set PROGRAM_FILES = "%ProgramFiles%" %}
      installer: 'https://github.com/mbos/Pass4Win/releases/download/version-1.2.1/Pass4Win-Setup-v1.2.1.9-x64.exe'
    {% else %}
      {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
      installer: 'https://github.com/mbos/Pass4Win/releases/download/version-1.2.1/Pass4Win-Setup-v1.2.1.9-x86.exe'
    {% endif %}
    uninstaller: '"{ PROGRAM_FILES }\Pass4Win\uninstall.exe"'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
