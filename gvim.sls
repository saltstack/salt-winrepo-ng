# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
gvim:
  '7.4':
    full_name:  'Vim 7.4 (self-installing)'
    installer: 'ftp://ftp.vim.org/pub/vim/pc/gvim74.exe'
    install_flags: '/TYPE=FULL /S /DD'
    uninstaller: '{{ PROGRAM_FILES }}\Vim\vim74\uninstall-gui.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '7.3':
    full_name:  'Vim 7.3 (self-installing)'
    installer: 'ftp://ftp.vim.org/pub/vim/pc/gvim73_46.exe'
    install_flags: '/TYPE=FULL /S /DD'
    uninstaller: '{{ PROGRAM_FILES }}\Vim\vim73\uninstall-gui.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
