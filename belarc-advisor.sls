# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
belarc-advisor:
  '8.6':
    full_name: 'Belarc Advisor'
    installer: 'http://downloads.belarc.com/advisor/advisorinstaller.exe'
    install_flags: '/s'
    uninstaller: '{{ PROGRAM_FILES }}\Belarc\BelarcAdvisor\Uninstall.exe'
    uninstall_flags: '/s "{{ PROGRAM_FILES }}\Belarc\BelarcAdvisor\INSTALL.LOG"'
    msiexec: False
    locale: en_US
    reboot: False
