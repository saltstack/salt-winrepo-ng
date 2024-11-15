{%- load_yaml as versions %}
# renovate: datasource=github-releases depName=nscp packageName=mickem/nscp
- '0.5.3.4'
- '0.5.2.39'
- '0.5.2.29'
- '0.5.1.46'
- '0.5.1.45'
- '0.5.0.62'
- '0.4.4.23'
- '0.4.4.19'
- '0.4.3.143'
- '0.4.3.88'
{%- endload%}
# This is to handle the architecture
{%- if grains['cpuarch'] == 'AMD64' %}
  {%- set arch_file = "x64" %}
  {%- set arch_name = "x64" %}
{%- else %}
  {%- set arch_file = "Win32" %}
  {%- set arch_name = "x86" %}
{%- endif %}

nsclient:
{%- for version in versions %}
  # This is to handle the version reported in Windows
  {%- set major, minor, maint, build = version.split(".") %}
  {%- if minor|int >= 5 %} # version 5 and newer has 2 dots (0.5.2039)
    {%- set install_version = ".".join([major, minor, maint]) %}
    {%- set install_version = "0".join([install_version, build]) %}
  {%- else %} # version 4 and lower has 3 dots (0.4.4.23)
    {%- set install_version = version %}
  {%- endif %}

  '{{ install_version }}':
    full_name:  'NSClient++ ({{ arch_name }})'
    installer: 'https://github.com/mickem/nscp/releases/download/{{ version }}/NSCP-{{ version }}-{{ arch_file }}.msi'
    uninstaller: 'https://github.com/mickem/nscp/releases/download/{{ version }}/NSCP-{{ version }}-{{ arch_file }}.msi'
    install_flags: '/quiet'
    uninstall_flags: '/quiet'
    msiexec: True
    locale: en_US
    reboot: False
{%- endfor %}
