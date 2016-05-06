# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
texworks:
  '0.6.1':
    full_name: 'TeXworks 0.6.1'
    installer: 'https://github.com/TeXworks/texworks/releases/download/release-0.6.1/TeXworks-win-setup-0.6.1-201605010903-git_3614278.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\TeXworks\unins000.exe'
    uninstall_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
