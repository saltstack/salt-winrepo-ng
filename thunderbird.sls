# Thunderbird installs are available in many languages other than en-US
# See https://releases.mozilla.org/pub/thunderbird/releases/latest/README.txt
# for a list of possible installer language codes.
# To install Thunderbird in a particular language on a minion, set the value of
# `thunderbird:pkg:lang` to a language code in the master config file,
# minion pillar, grains or config file. See
# https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.config.html#salt.modules.config.get

{%- set lang = salt['config.get']('thunderbird:pkg:lang', 'en-US') %}

{% load_yaml as versions -%}
# renovate: datasource=custom.thunderbird depName=thunderbird packageName=LATEST_THUNDERBIRD_VERSION
- '144.0.1'
- '144.0'
- '143.0.1'
- '143.0'
- '142.0'
- '141.0'
- '140.0.1'
- '140.0'
{% endload -%}

{% macro _get_program_files(exe_arch) -%}
{%   if grains["cpuarch"] == "AMD64" and exe_arch == 86 -%}
%ProgramFiles(x86)%
{%   else -%}
%ProgramFiles%
{%   endif -%}
{% endmacro -%}

{% set arch_specific_versions = {64: versions, 86: versions} -%}

{% for arch in 64, 86 -%}
thunderbird_x{{ arch }}:
  {%- for version in arch_specific_versions[arch] %}
  '{{ version }}':
    full_name: Mozilla Thunderbird (x{{ arch }} {{ lang }})
    installer: https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/{{ version }}/win{{ 32 if arch == 86 else 64 }}/{{ lang }}/Thunderbird%20Setup%20{{ version }}.exe
    install_flags: /S
    uninstaller: '{{ _get_program_files(arch)|trim }}\Mozilla Thunderbird\uninstall\helper.exe'
    uninstall_flags: /S
  {%- endfor %}
{% endfor -%}

# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
thunderbird:
  {% for version in ['78.4.2', '60.6.1', '60.6.0', '60.5.3', '60.5.2', '60.5.1', '60.5.0', '60.4.0', '60.3.3', '60.3.2', '60.3.1', '60.3.0', '60.2.1', '60.0', '52.9.1', '52.9.0', '52.8.0', '52.6.0', '52.5.2', '52.3.0', '45.6.0', '45.4.0', '38.6.0', '38.5.0', '38.4.0', '38.3.0', '38.2.0', '38.1.0'] %}
  '{{ version }}':
    full_name: 'Mozilla Thunderbird {{ version }} (x86 en-GB)'
    installer: 'https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/{{ version }}/win32/en-GB/Thunderbird%20Setup%20{{ version }}.exe'
    install_flags: '-ms'
    uninstaller: '{{ PROGRAM_FILES }}\Mozilla Thunderbird\uninstall\helper.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
