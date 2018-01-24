{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}

queueexplorerpro:
  '4.1.5':
    full_name: 'QueueExplorer Professional 4.1.5'
    installer: 'https://www.cogin.com/download/mq/download.php?file=QueueExplorerPro4.1.5.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    uninstaller: '{{ PROGRAM_FILES }}\QueueExplorer Professional\unins000.exe'
    uninstall_flags: '/SILENT'
    msiexec: False
    locale: en_US
    reboot: False
