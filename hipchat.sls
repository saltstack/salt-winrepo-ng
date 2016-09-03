hipchat:
  {% if grains['cpuarch'] == 'AMD64' %}
     {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
  {% else %}
     {% set PROGRAM_FILES = "%ProgramFiles%" %}
  {% endif %}
  '4.0.1650':
    installer: 'https://hipchat-ops.s3.amazonaws.com/hipchat4/windows/HipChat_4.0.1650.exe'
    full_name: 'HipChat'
    install_flags: '/sp /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\Atlassian\Hipchat4\unins000.exe'
    uninstall_flags: '/sp /verysilent'
    msiexec: False
    reboot: False
