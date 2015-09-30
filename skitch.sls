# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
skitch:
  '2.3.2.176':
    full_name: 'Skitch'
    installer: 'https://evernote.s3.amazonaws.com/Skitch/win32/skitchsetup_2.3.2.176.exe'
    install_flags: '--mode unattended'
    uninstaller: '{{ PROGRAM_FILES }}\Evernote\Skitch\uninstall.exe'
    uninstall_flags: '--mode unattended'
    msiexec: False
    locale: en_US
    reboot: False
