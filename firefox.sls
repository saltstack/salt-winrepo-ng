# Firefox installs are available in many languages other than en-US
# See https://releases.mozilla.org/pub/firefox/releases/latest/README.txt
# for a list of possible installer language codes.
# To install Firefox in a particular language on a minion, set the value of
# `firefox:pkg:lang` to a language code in the master config file,
# minion pillar, grains or config file. See
# https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.config.html#salt.modules.config.get
#
# Since version 90.0 no version number is added to the full_name field
# See https://bugzilla.mozilla.org/show_bug.cgi?id=1713393

{%- set lang = salt['config.get']('firefox:pkg:lang', 'en-US') %}

{% load_yaml as versions -%}
# renovate: datasource=custom.firefox depName=firefox packageName=LATEST_FIREFOX_VERSION
- '130.0'
- '129.0.2'
- '129.0.1'
- '129.0'
- '128.0.3'
- '128.0.2'
- '128.0'
- '127.0.2'
- 127.0.1
- '127.0'
- 126.0.1
- '126.0'
- 125.0.3
- 125.0.2
- 125.0.1
- 124.0.2
- 124.0.1
- '124.0'
- 123.0.1
- '123.0'
- 122.0.1
- '122.0'
- 121.0.1
- '121.0'
- 120.0.1
- '120.0'
- 119.0.1
- '119.0'
- 118.0.2
- 118.0.1
- '118.0'
- 117.0.1
- '117.0'
- 116.0.3
- 116.0.2
- 116.0.1
- '116.0'
- 115.0.3
- 115.0.2
- 115.0.1
- '115.0'
- 114.0.2
- 114.0.1
- '114.0'
- 113.0.2
- 113.0.1
- '113.0'
- 112.0.2
- 112.0.1
- '112.0'
- 111.0.1
- '111.0'
- 110.0.1
- '110.0'
- 109.0.1
- '109.0'
- 108.0.2
- 108.0.1
- '108.0'
- 107.0.1
- '107.0'
- 106.0.5
- 106.0.4
- 106.0.3
- 106.0.2
- 106.0.1
- '106.0'
- 105.0.3
- 105.0.2
- 105.0.1
- '105.0'
- 104.0.2
- 104.0.1
- '104.0'
- 103.0.2
- 103.0.1
- '103.0'
- 102.0.1
- '102.0'
- 101.0.1
- '101.0'
- 100.0.2
- 100.0.1
- '100.0'
- 99.0.1
- '99.0'
- 98.0.2
- 98.0.1
- '98.0'
- 97.0.2
- 97.0.1
- '97.0'
- 96.0.3
- 96.0.2
- 96.0.1
- '96.0'
- 95.0.2
- 95.0.1
- '95.0'
- 94.0.2
- 94.0.1
- '94.0'
- '93.0'
- 92.0.1
- '92.0'
- 91.0.2
- 91.0.1
- '91.0'
- 90.0.2
- 90.0.1
- '90.0'
- 89.0.2
- 89.0.1
- '89.0'
- 88.0.1
- '88.0'
- '87.0'
- 86.0.1
- '86.0'
- 85.0.2
- 85.0.1
- '85.0'
- 84.0.2
- 84.0.1
- '84.0'
- '83.0'
- 82.0.3
- 82.0.2
- 82.0.1
- '82.0'
- 81.0.2
- 81.0.1
- '81.0'
- 80.0.1
- '80.0'
- '79.0'
- 78.0.2
- 78.0.1
- '78.0'
- 77.0.1
- '77.0'
- 76.0.1
- '76.0'
- '75.0'
- 74.0.1
- '74.0'
- 73.0.1
- '73.0'
- 72.0.2
- 72.0.1
- '72.0'
- '71.0'
- 70.0.1
- '70.0'
- 69.0.3
- 69.0.2
- 69.0.1
- '69.0'
- 68.0.2
- 68.0.1
- '68.0'
- 67.0.4
- 67.0.3
- 67.0.2
- 67.0.1
- '67.0'
- 66.0.5
- 66.0.4
- 66.0.3
- 66.0.2
- 66.0.1
- '66.0'
- 65.0.2
- 65.0.1
- '65.0'
- 64.0.2
- '64.0'
- 63.0.3
- 63.0.1
- '63.0'
- 62.0.3
- 62.0.2
- '62.0'
- 61.0.2
- 61.0.1
- '61.0'
- 60.0.2
- 60.0.1
- '60.0'
- 59.0.3
- 59.0.2
- 59.0.1
- '59.0'
- 58.0.2
- 58.0.1
- '58.0'
- 57.0.4
- 57.0.3
- 57.0.2
- 57.0.1
- '57.0'
- 56.0.2
- 56.0.1
- '56.0'
- 55.0.3
- 55.0.2
- 55.0.1
- '55.0'
- 54.0.1
- '54.0'
- 53.0.3
- 53.0.2
- '53.0'
- 52.0.2
- 52.0.1
- '52.0'
- 51.0.1
- '51.0'
- 50.1.0
- 50.0.2
- 50.0.1
- '50.0'
- 49.0.2
- 49.0.1
- '49.0'
- 48.0.2
- 48.0.1
- '48.0'
- 47.0.2
- 47.0.1
- '47.0'
- 46.0.1
- '46.0'
- 45.0.2
- 45.0.1
- '45.0'
- 44.0.2
- 44.0.1
- '44.0'
- 43.0.4
- 43.0.3
- 43.0.2
- 43.0.1
- '43.0'
- '42.0'
{% endload -%}

{% load_yaml as x86_only -%}
- 41.0.2
- 41.0.1
- '41.0'
- 40.0.3
- 40.0.2
- '40.0'
- 39.0.3
- '39.0'
- 38.0.6
- 38.0.5
- 38.0.1
- '38.0'
- 37.0.2
- 37.0.1
- '37.0'
- 36.0.4
- 36.0.3
- 36.0.1
- '36.0'
- 35.0.1
- '35.0'
- 34.0.5
- '34.0'
- 33.1.1
- '33.1'
- 33.0.3
- 33.0.2
- 33.0.1
- '33.0'
- 32.0.3
- 32.0.2
- 32.0.1
- '32.0'
- '31.0'
- '30.0'
- 29.0.1
- '29.0'
- '28.0'
- 27.0.1
- '27.0'
- '26.0'
- 25.0.1
- '25.0'
- '24.0'
- 23.0.1
- '23.0'
- '22.0'
- '21.0'
- 20.0.1
- '20.0'
- 19.0.2
- 19.0.1
- '19.0'
- 18.0.2
- 18.0.1
- '18.0'
- 17.0.1
- '17.0'
- 16.0.2
- 16.0.1
- '16.0'
- 15.0.1
- '15.0'
- 14.0.1
- 13.0.1
- '13.0'
- '12.0'
- '11.0'
- 10.0.2
- 10.0.1
- '10.0'
- 9.0.1
- '9.0'
- 8.0.1
- '8.0'
- 7.0.1
- '7.0'
- 6.0.2
- 6.0.1
- '6.0'
- 5.0.1
- '5.0'
- 4.0.1
- '4.0'
- 3.6.28
- 3.6.27
- 3.6.26
- 3.6.25
- 3.6.24
- 3.6.23
- 3.6.22
- 3.6.21
- 3.6.20
- 3.6.19
- 3.6.18
- 3.6.17
- 3.6.16
- 3.6.15
- 3.6.14
- 3.6.13
- 3.6.12
- 3.6.11
- 3.6.10
- 3.6.9
- 3.6.8
- 3.6.7
- 3.6.6
- 3.6.4
- 3.6.3
- 3.6.2
- '3.6'
- 3.5.19
- 3.5.18
- 3.5.17
- 3.5.16
- 3.5.15
- 3.5.14
- 3.5.13
- 3.5.12
- 3.5.11
- 3.5.10
- 3.5.9
- 3.5.8
- 3.5.7
- 3.5.6
- 3.5.5
- 3.5.4
- 3.5.3
- 3.5.2
- 3.5.1
- '3.5'
- 3.0.18
- 3.0.17
- 3.0.15
- 3.0.14
- 3.0.13
- 3.0.12
- 3.0.11
- 3.0.10
- 3.0.9
- 3.0.8
- 3.0.7
- 3.0.6
- 3.0.5
- 3.0.4
- 3.0.3
- 3.0.2
- 3.0.1
- '3.0'
- '2.0'
- '1.5'
- 1.0.8
- 1.0.7
- 1.0.6
- 1.0.5
- 1.0.4
- 1.0.3
- 1.0.2
- 1.0.1
- '1.0'
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
firefox_x{{ arch }}:
  {%- for version in arch_specific_versions[arch] %}
  '{{ version }}':
    {% if salt["pkg.compare_versions"](version, "<", "90.0") -%}
    {%   set display_version = " " ~ version -%}
    {% endif -%}
    full_name: Mozilla Firefox{{ display_version|d }} (x{{ arch }} {{ lang }})
    installer: https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/win{{ 32 if arch == 86 else 64 }}/{{ lang }}/Firefox%20Setup%20{{ version }}.exe
    install_flags: /S
    uninstaller: '{{ _get_program_files(arch)|trim }}\Mozilla Firefox\uninstall\helper.exe'
    uninstall_flags: /S
  {%- endfor %}
{% endfor -%}
