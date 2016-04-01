# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
gow:
  Not Found:
    full_name: 'Gow'
    installer: 'https://github.com/bmatzelle/gow/releases/download/v0.8.0/Gow-0.8.0.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Gow\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
    # Gow - GNU on Windows - The lightweight alternative to Cygwin
    # https://github.com/bmatzelle/gow/wiki
