# Allows install of Windows Updates on "Unsupported Hardware" on Win 7/8.1
# https://github.com/zeffy/wufuc

{% set versions = [ '1.0.1.201' ] %}
{% if grains['cpuarch'] == 'AMD64' %}
  {% set cpuarch = 'x64' %}
{% else %}
  {% set cpuarch = 'x86' %}
{% endif %}

wufuc:
{% for version in versions %}
  '{{ version }}':
    full_name: 'wufuc'
    installer: 'https://github.com/zeffy/wufuc/releases/download/v{{ version }}/wufuc_v{{ version }}-{{ cpuarch }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'https://github.com/zeffy/wufuc/releases/download/v{{ version }}/wufuc_v{{ version }}-{{ cpuarch }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
