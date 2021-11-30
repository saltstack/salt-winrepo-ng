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

firefox_x64:
  {% for version in ['93.0', '92.0.1', '92.0', '91.0.2', '91.0.1', '91.0', '90.0.2', '90.0.1', '90.0', '89.0.2', '89.0.1', '89.0', '88.0.1', '88.0', '87.0', '86.0.1', '86.0', '85.0.2', '85.0.1', '85.0', '84.0.2', '84.0.1', '84.0', '83.0', '82.0.3', '82.0.2', '82.0.1', '82.0', '81.0.2', '81.0.1', '81.0', '80.0.1', '80.0', '79.0', '78.0.2', '78.0.1', '78.0', '77.0.1', '77.0', '76.0.1', '76.0', '75.0', '74.0.1', '74.0', '73.0.1', '73.0', '72.0.2', '72.0.1', '72.0', '71.0', '70.0.1', '70.0', '69.0.3', '69.0.2', '69.0.1', '69.0', '68.0.2', '68.0.1', '68.0', '67.0.4', '67.0.3', '67.0.2', '67.0.1', '67.0', '66.0.5', '66.0.4', '66.0.3', '66.0.2', '66.0.1', '66.0', '65.0.2', '65.0.1', '65.0', '64.0.2', '64.0', '63.0.3', '63.0.1', '63.0', '62.0.3', '62.0.2', '62.0', '61.0.2', '61.0.1', '61.0', '60.0.2', '60.0.1', '60.0', '59.0.3', '59.0.2', '59.0.1', '59.0', '58.0.2', '58.0.1', '58.0', '57.0.4', '57.0.3', '57.0.2', '57.0.1', '57.0', '56.0.2', '56.0.1', '56.0', '55.0.3', '55.0.2', '55.0.1', '55.0', '54.0.1', '54.0', '53.0.3', '53.0.2', '53.0', '52.0.2', '52.0.1', '52.0', '51.0.1', '51.0', '50.1.0', '50.0.2', '50.0.1', '50.0', '49.0.2', '49.0.1', '49.0', '48.0.2', '48.0.1', '48.0', '47.0.2', '47.0.1', '47.0', '46.0.1', '46.0', '45.0.2', '45.0.1', '45.0', '44.0.2', '44.0.1', '44.0', '43.0.4', '43.0.3', '43.0.2', '43.0.1', '43.0', '42.0'] %}
  '{{ version }}':
    {% if salt["pkg.compare_versions"](version, "<", "90.0") -%}
    {%   set display_version = " " ~ version -%}
    {% endif -%}
    full_name: 'Mozilla Firefox{{ display_version | default("") }} (x64 {{ lang }})'
    installer: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/win64/{{ lang }}/Firefox%20Setup%20{{ version }}.exe'
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\Mozilla Firefox\uninstall\helper.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
