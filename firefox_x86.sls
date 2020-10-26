# Firefox installs are available in many languages other than en-US
# See https://releases.mozilla.org/pub/firefox/releases/latest/README.txt
# for a list of possible installer language codes.
# To install Firefox in a particular language on a minion, set the value of
# `firefox:pkg:lang` to a language code in the master config file,
# minion pillar, grains or config file. See
# https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.config.html#salt.modules.config.get

{# {%- set lang = salt['config.get']('firefox:pkg:lang', 'en-US') %} #}
{% set lang = 'en-US' %}

firefox_x86:
  {% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
  {% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
  {% endif %}
  {% for version in ['82.0', '81.0.2', '81.0.1', '81.0', '80.0.1', '80.0', '79.0', '78.0.2', '78.0.1', '78.0', '77.0.1', '77.0', '76.0.1', '76.0', '75.0', '74.0.1', '74.0', '73.0.1', '73.0', '72.0.2', '72.0.1', '72.0', '71.0', '70.0.1', '70.0', '69.0.3', '69.0.2', '69.0.1', '69.0', '68.0.2', '68.0.1', '68.0', '67.0.4', '67.0.3', '67.0.2', '67.0.1', '67.0', '66.0.5', '66.0.4', '66.0.3', '66.0.2', '66.0.1', '66.0', '65.0.2', '65.0.1', '65.0', '64.0.2', '64.0', '63.0.3', '63.0.1', '63.0', '62.0.3', '62.0.2', '62.0', '61.0.2', '61.0.1', '61.0', '60.0.2', '60.0.1', '60.0', '59.0.3', '59.0.2', '59.0.1', '59.0', '58.0.2', '58.0.1', '58.0', '57.0.4', '57.0.3', '57.0.2', '57.0.1', '57.0', '56.0.2', '56.0.1', '56.0', '55.0.3', '55.0.2', '55.0.1', '55.0', '54.0.1', '54.0', '53.0.3', '53.0.2', '53.0', '52.0.2', '52.0.1', '52.0', '51.0.1', '51.0', '50.1.0', '50.0.2', '50.0.1', '50.0', '49.0.2', '49.0.1', '49.0', '48.0.2', '48.0.1', '48.0', '47.0.2', '47.0.1', '47.0', '46.0.1', '46.0', '45.0.2', '45.0.1', '45.0', '44.0.2', '44.0.1', '44.0', '43.0.4', '43.0.3', '43.0.2', '43.0.1', '43.0', '42.0', '41.0.2', '41.0.1', '41.0', '40.0.3', '40.0.2', '40.0', '39.0.3', '39.0', '38.0.6', '38.0.5', '38.0.1', '38.0', '37.0.2', '37.0.1', '37.0', '36.0.4', '36.0.3', '36.0.1', '36.0', '35.0.1', '35.0', '34.0.5', '34.0', '33.1.1', '33.1', '33.0.3', '33.0.2', '33.0.1', '33.0', '32.0.3', '32.0.2', '32.0.1', '32.0', '31.0', '30.0', '29.0.1'] %}
  '{{ version }}':
    full_name: 'Mozilla Firefox {{ version }} (x86 {{ lang }})'
    installer: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/win32/{{ lang }}/Firefox%20Setup%20{{ version }}.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Mozilla Firefox\uninstall\helper.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
