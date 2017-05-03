{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
erlang:
  '19.3':
    full_name: 'Erlang OTP (8.3)'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://erlang.org/download/otp_win64_19.3.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://erlang.org/download/otp_win32_19.3.exe'
    {% endif %}
    uninstaller: '{{ PROGRAM_FILES }}\erl8.3\Uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
