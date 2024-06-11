# Firefox installs are available in many languages other than en-US
# See https://releases.mozilla.org/pub/firefox/releases/latest/README.txt
# for a list of possible installer language codes.
# To install Firefox in a particular language on a minion, set the value of
# `firefox:pkg:lang` to a language code in the master config file,
# minion pillar, grains or config file. See
# https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.config.html#salt.modules.config.get
#
# Since version 78.12.0 no version number is added to the full_name field
# See https://bugzilla.mozilla.org/show_bug.cgi?id=1713393

{%- set lang = salt['config.get']('firefox:pkg:lang', 'en-US') %}

{% load_yaml as versions -%}
- 115.12.0
- 115.11.0
- 115.10.0
- 115.9.1
- 115.9.0
- 115.8.0
- 115.7.0
- 115.6.0
- 115.5.0
- 115.4.0
- 115.3.1
- 115.3.0
- 115.2.1
- 115.2.0
- 115.1.0
- 115.0.3
- 115.0.2
- 115.0.1
- '115.0'
- 102.15.1
- 102.15.0
- 102.14.0
- 102.13.0
- 102.12.0
- 102.11.0
- 102.10.0
- 102.9.0
- 102.8.0
- 102.7.0
- 102.6.0
- 102.5.0
- 102.4.0
- 102.3.0
- 102.2.0
- 102.1.0
- 102.0.1
- '102.0'
- 91.13.0
- 91.12.0
- 91.11.0
- 91.10.0
- 91.9.1
- 91.9.0
- 91.8.0
- 91.7.1
- 91.7.0
- 91.6.1
- 91.6.0
- 91.5.1
- 91.5.0
- 91.4.1
- 91.4.0
- 91.3.0
- 91.2.0
- 91.1.0
- 91.0.1
- '91.0'
- 78.15.0
- 78.14.0
- 78.13.0
- 78.12.0
- 78.11.0
- 78.10.1
- 78.10.0
- 78.9.0
- 78.8.0
- 78.7.1
- 78.7.0
- 78.6.1
- 78.6.0
- 78.5.0
- 78.4.1
- 78.4.0
- 78.3.1
- 78.3.0
- 78.2.0
- 78.1.0
- 78.0.2
- 78.0.1
- '78.0'
- 68.12.0
- 68.11.0
- 68.10.0
- 68.9.0
- 68.8.0
- 68.7.0
- 68.6.1
- 68.6.0
- 68.5.0
- 68.4.2
- 68.4.1
- 68.4.0
- 68.3.0
- 68.2.0
- 68.1.0
- 68.0.2
- 68.0.1
- '68.0'
- 60.9.0
- 60.8.0
- 60.7.2
- 60.7.1
- 60.7.0
- 60.6.3
- 60.6.2
- 60.6.1
- 60.6.0
- 60.5.2
- 60.5.1
- 60.5.0
- 60.4.0
- 60.3.0
- 60.2.2
- 60.2.1
- 60.2.0
- 60.1.0
- 60.0.2
- 60.0.1
- '60.0'
- 52.9.0
- 52.8.1
- 52.8.0
- 52.7.4
- 52.7.3
- 52.7.2
- 52.7.1
- 52.7.0
- 52.6.0
- 52.5.3
- 52.5.2
- 52.5.0
- 52.4.1
- 52.4.0
- 52.3.0
- 52.2.1
- 52.2.0
- 52.1.2
- 52.1.1
- 52.1.0
- 52.0.2
- 52.0.1
- '52.0'
- 45.9.0
- 45.8.0
- 45.7.0
- 45.6.0
- 45.5.1
- 45.5.0
- 45.4.0
- 45.3.0
- 45.2.0
- 45.1.1
- 45.1.0
- 45.0.2
- 45.0.1
- '45.0'
{% endload -%}

{% load_yaml as x86_only -%}
- 38.8.0
- 38.7.1
- 38.7.0
- 38.6.1
- 38.6.0
- 38.5.2
- 38.5.1
- 38.5.0
- 38.4.0
- 38.3.0
- 38.2.1
- 38.2.0
- 38.1.1
- 38.1.0
- 38.0.1
- '38.0'
- 31.8.0
- 31.7.0
- 31.6.0
- 31.5.3
- 31.5.2
- 31.5.1
- 31.5.0
- 31.4.0
- 31.3.0
- 31.2.0
- 31.1.1
- 31.1.0
- '31.0'
- 24.8.1
- 24.8.0
- 24.7.0
- 24.6.0
- 24.5.0
- 24.4.0
- 24.3.0
- 24.2.0
- 24.1.1
- 24.1.0
- '24.0'
- 17.0.11
- 17.0.10
- 17.0.9
- 17.0.8
- 17.0.7
- 17.0.6
- 17.0.5
- 17.0.4
- 17.0.3
- 17.0.2
- 17.0.1
- '17.0'
- 10.0.12
- 10.0.11
- 10.0.10
- 10.0.9
- 10.0.8
- 10.0.7
- 10.0.6
- 10.0.5
- 10.0.4
- 10.0.3
- 10.0.2
- 10.0.1
- '10.0'
{% endload -%}

{% macro _get_program_files(exe_arch) -%}
{%   if grains["cpuarch"] == "AMD64" and exe_arch == 86 -%}
%ProgramFiles(x86)%
{%   else -%}
%ProgramFiles%
{%   endif -%}
{% endmacro -%}

{% set arch_specific_versions = {64: versions, 86: versions + x86_only} -%}

{% for arch in 64, 86 -%}
firefox-esr_x{{ arch }}:
  {%- for version in arch_specific_versions[arch] %}
  '{{ version }}':
    {% if salt["pkg.compare_versions"](version, "<", "78.12.0") -%}
    {%   set display_version = " " ~ version -%}
    {% endif -%}
    full_name: Mozilla Firefox{{ display_version|d }} ESR (x{{ arch }} {{ lang }})
    installer: https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}esr/win{{ 32 if arch == 86 else 64 }}/{{ lang }}/Firefox%20Setup%20{{ version }}esr.exe
    install_flags: /S
    uninstaller: '{{ _get_program_files(arch)|trim }}\Mozilla Firefox\uninstall\helper.exe'
    uninstall_flags: /S
  {%- endfor %}
{% endfor -%}
