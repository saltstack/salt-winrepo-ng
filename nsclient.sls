{% load_yaml as versions -%}
# renovate: datasource=github-releases depName=nscp packageName=mickem/nscp
- '0.9.13'
- '0.9.12'
- '0.8.0'
- '0.7.0'
- '0.6.9'
- '0.6.8'
- '0.6.7'
- '0.6.6'
- '0.6.5'
- '0.6.4'
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
  {#- v0.5.x.x up to v0.6.4 Windows display versions have only three parts (e.g. 0.5.2039) #}
  {#- v0.6.5 up to v0.6.9 have a zero-filled build number like 0.6.5.000 #}
  {#- v0.7.0 and newer have a display version similar to 0.7.0.0 #}
  {%- if salt["pkg.compare_versions"](version, ">=", "0.5") %}
    {%- set parts = version.split(".") %}
    {%- set major, minor, patch = parts[:3] %}
    {%- set build = parts[3]|d("0") %}
    {%- if salt["pkg.compare_versions"](version, "<", "0.6.5") %}
      {%- set display_version = ".".join([major, minor, patch ~ build.zfill(3)]) %}
    {%- elif salt["pkg.compare_versions"](version, "<", "0.7.0") %}
      {%- set display_version = ".".join([major, minor, patch, build.zfill(3)]) %}
    {%- else %}
      {%- set display_version = ".".join([major, minor, patch, build]) %}
    {%- endif %}
  {%- endif %}

  '{{ display_version|d(version) }}':
    full_name:  NSClient++ ({{ arch_name|d("x64") }})
    installer: https://github.com/mickem/nscp/releases/download/{{ version }}/NSCP-{{ version }}-{{ arch_file|d("x64") }}.msi
    install_flags: /qn /norestart
    uninstall_flags: /qn /norestart
    msiexec: true
{%- endfor %}
