{% set versions = [('19.3', '8.3'), ('21.0.1', '10.0.1')] %}
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
    {% set BITS = '64' %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
    {% set BITS = '32' %}
{% endif %}
erlang:
  {% for otp_version, erlang_version in versions %}
  '{{ otp_version }}':
    full_name: 'Erlang OTP {{ otp_version.split('.')[0] }} ({{ erlang_version }})'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/erlang/install.cmd'
    install_flags: '"http://erlang.org/download/otp_win{{ BITS }}_{{ otp_version }}.exe" "otp_win{{ BITS }}_{{ otp_version }}.exe" "{{ otp_version }}" "Erlang OTP {{ otp_version.split('.')[0] }} ({{ erlang_version }})" "/S"'
    uninstaller: '{{ PROGRAM_FILES }}\erl{{ erlang_version }}\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
