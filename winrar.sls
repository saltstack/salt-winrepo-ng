# Both 32-bit (x86) AND a 64-bit (AMD64) installer available for WinRAR until v7.01
{% set cpu_arch = salt["grains.get"]("cpuarch", "AMD64") -%}
{% set arch = {"AMD64": "64", "x86": "32"}[cpu_arch] -%}

{% load_yaml as versions -%}
# renovate: datasource=custom.winrar depName=winrar
- '7.12'
- '7.11'
- '7.10'
{% endload -%}

{% load_yaml as x64_and_x86_versions -%}
- '7.01'
- '7.00'
- '6.22'
- '6.21'
- '6.20'
- '6.10'
- '6.02'
- '6.01'
- '6.00'
- '5.91'
- '5.70'
- '5.61'
{% endload -%}

{% macro _get_exe_prefix(version) -%}
{%   if cpu_arch == "x86" and salt["pkg.compare_versions"](version, "<", "6.10") -%}
wrar
{%   else -%}
winrar-x{{ arch }}-
{%   endif -%}
{% endmacro -%}

{% set arch_specific_versions = {"AMD64": versions + x64_and_x86_versions, "x86": x64_and_x86_versions} -%}

winrar:
{%- for version in arch_specific_versions[cpu_arch] %}
  {% set major, minor = version.split('.') -%}
  '{{major}}.{{minor}}.0':
    full_name: WinRAR {{major}}.{{minor}} ({{ arch }}-bit)
    installer: https://www.rarlab.com/rar/{{ _get_exe_prefix(version)|trim }}{{major}}{{minor}}.exe
    uninstaller: '%ProgramFiles%\WinRAR\uninstall.exe'
    install_flags: /S
    uninstall_flags: /S
{%- endfor %}
