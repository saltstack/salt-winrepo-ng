{% set versions = [
  ('23.3', '23.3', '11.2'),
  ('23.2', '23.2', '11.1.4'),
  ('23.1', '23.1', '11.1'),
  ('23.0', '23', '11.0'),
  ('22.3', '22', '10.7'),
  ('22.2', '22', '10.6'),
  ('22.1', '22', '10.5'),
  ('22.0', '22', '10.4'),
  ('21.2', '21', '10.2'),
  ('21.0.1', '21', '10.0.1'),
  ('19.3', '19', '8.3'),
] %}
{% if grains['cpuarch'] == 'AMD64' %}
    {% set BITS = '64' %}
{% else %}
    {% set BITS = '32' %}
{% endif %}
erlang:
  {% for otp_version, display_version, erlang_version in versions %}
  {% set major_version = otp_version.split(".")[0] | int %}
  '{{ otp_version }}':
    full_name: 'Erlang OTP {{ display_version }} ({{ erlang_version }})'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/erlang/install.cmd'
    install_flags: '"http://erlang.org/download/otp_win{{ BITS }}_{{ otp_version }}.exe" "otp_win{{ BITS }}_{{ otp_version }}.exe" "{{ otp_version }}" "Erlang OTP {{ otp_version.split('.')[0] }} ({{ erlang_version }})" "/S"'
    {% if major_version >= 23 %}
    uninstaller: '%ProgramFiles%\erl-{{ otp_version }}\Uninstall.exe'
    {% else %}
    uninstaller: '%ProgramFiles%\erl{{ erlang_version }}\Uninstall.exe'
    {% endif %}
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
