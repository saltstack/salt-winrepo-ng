# Thunderbird installs are available in many languages other than en-US
# See https://releases.mozilla.org/pub/thunderbird/releases/latest/README.txt
# for a list of possible installer language codes.
# To install Thunderbird in a particular language on a minion, set the value of
# `thunderbird:pkg:lang` to a language code in the master config file,
# minion pillar, grains or config file. See
# https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.config.html#salt.modules.config.get

{%- set lang = salt['config.get']('thunderbird:pkg:lang', 'en-US') %}

{% load_yaml as versions -%}
# renovate: datasource=custom.thunderbird depName=thunderbird-esr packageName=THUNDERBIRD_ESR
- '140.5.0'
- '140.4.0'
- '140.3.1'
- '140.3.0'
- '140.2.1'
- '140.2.0'
- '140.1.1'
- '140.1.0'
- '140.0.1'
- '140.0'
- '128.14.0'
- '128.13.0'
- '128.12.0'
- '128.11.0'
- '128.10.1'
- '128.10.0'
- '128.9.0'
- '128.8.1'
- '128.8.0'
- '128.7.0'
- '128.6.0'
- '128.5.2'
- '128.5.1'
- '128.5.0'
- '128.4.0'
- '128.3.1'
- '128.3.0'
- '128.2.3'
- '128.2.2'
- '128.2.1'
- '128.2.0'
- '128.1.1'
- '128.1.0'
- '128.0'
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
thunderbird-esr_x{{ arch }}:
  {%- for version in arch_specific_versions[arch] %}
  '{{ version }}':
    {% if salt["pkg.compare_versions"](version, ">=", "140.3.1") -%}
    {%   set display_esr = " ESR" -%}
    {% endif -%}
    full_name: Mozilla Thunderbird{{ display_esr|d }} (x{{ arch }} {{ lang }})
    installer: https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/{{ version }}esr/win{{ 32 if arch == 86 else 64 }}/{{ lang }}/Thunderbird%20Setup%20{{ version }}esr.exe
    install_flags: /S
    uninstaller: '{{ _get_program_files(arch)|trim }}\Mozilla Thunderbird\uninstall\helper.exe'
    uninstall_flags: /S
  {%- endfor %}
{% endfor -%}
