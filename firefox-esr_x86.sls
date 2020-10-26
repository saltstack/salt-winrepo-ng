# Firefox installs are available in many languages other than en-US
# See https://releases.mozilla.org/pub/firefox/releases/latest/README.txt
# for a list of possible installer language codes.
# To install Firefox in a particular language on a minion, set the value of
# `firefox:pkg:lang` to a language code in the master config file,
# minion pillar, grains or config file. See
# https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.config.html#salt.modules.config.get

{# {%- set lang = salt['config.get']('firefox:pkg:lang', 'en-US') %} #}
{% set lang = 'en-US' %}

firefox-esr_x86:
  {% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
  {% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
  {% endif %}
  {% for version in ['78.4.0', '78.3.1', '78.3.0', '78.2.0', '78.1.0', '78.0.2', '78.0.1', '78.0', '68.12.0', '68.11.0', '68.10.0', '68.9.0', '68.8.0', '68.7.0', '68.6.1', '68.6.0', '68.5.0', '68.4.2', '68.4.1', '68.4.0', '68.3.0', '68.2.0', '68.1.0', '68.0', '60.9.0', '60.8.0', '60.7.2', '60.7.1', '60.7.0', '60.6.3', '60.6.2', '60.6.1', '60.6.0', '60.5.2', '60.5.1', '60.5.0', '60.4.0', '60.3.0', '60.2.2', '60.2.1', '60.2.0', '60.1.0', '60.0.2', '60.0.1', '60.0', '52.9.0', '52.8.1', '52.8.0', '52.7.4', '52.7.3', '52.7.2', '52.7.1', '52.7.0', '52.6.0', '52.5.3', '52.5.2', '52.5.0', '52.4.1', '52.4.0', '52.3.0', '52.2.1', '52.2.0', '52.1.2', '52.1.1', '52.1.0', '52.0.2', '52.0.1', '52.0', '45.9.0', '45.8.0', '45.7.0', '45.6.0', '45.5.1', '45.5.0', '45.4.0', '45.3.0', '45.2.0', '45.1.1', '45.1.0', '45.0.2', '45.0.1', '45.0', '38.8.0', '38.7.1', '38.7.0', '38.6.1', '38.6.0', '38.5.2', '38.5.1', '38.5.0', '38.4.0', '38.3.0', '38.2.1'] %}
  '{{ version }}':
    full_name: 'Mozilla Firefox {{ version }} ESR (x86 {{ lang }})'
    installer: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}esr/win32/{{ lang }}/Firefox%20Setup%20{{ version }}esr.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Mozilla Firefox\uninstall\helper.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
