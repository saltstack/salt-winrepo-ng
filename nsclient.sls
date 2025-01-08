{% load_yaml as versions -%}
# renovate: datasource=github-releases depName=nscp packageName=mickem/nscp
- '0.6.3'
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
{% endload -%}

{%- if grains["cpuarch"] == "x86" %}
  {%- set arch_file = "Win32" %}
  {%- set arch_name = "x86" %}
{%- endif %}

nsclient:
{%- for version in versions %}
  {#- v0.5.x.x Windows display versions have only three parts (e.g. 0.5.2039) #}
  {%- if (salt["pkg.compare_versions"](version, "<", "0.6") and
          salt["pkg.compare_versions"](version, ">=", "0.5")) %}
    {%- set major, minor, patch, build = version.split(".") %}
    {%- set display_version = ".".join([major, minor, patch]) + build.zfill(3) %}
  {%- endif %}

  '{{ display_version|d(version) }}':
    full_name:  NSClient++ ({{ arch_name|d("x64") }})
    installer: https://github.com/mickem/nscp/releases/download/{{ version }}/NSCP-{{ version }}-{{ arch_file|d("x64") }}.msi
    install_flags: /quiet
    uninstall_flags: /quiet
    msiexec: true
{%- endfor %}
