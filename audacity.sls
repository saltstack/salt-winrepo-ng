{% set versions = ['3.0.0'] %}
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
audacity:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Audacity {{ version }}'
    # official page has counter measures for automaitc downloads
    #installer: 'https://www.fosshub.com/Audacity.html?dwl=audacity-win-{{ version }}.exe'
    installer: 'https://fossies.org/windows/misc/audacity-win-{{ version }}.exe'
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\Audacity\unins000.exe'
    uninstall_flags: '/SP- /verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Audacity that have had the installer assets moved to the legacy page.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {% for version in ['2.4.2', '2.4.1', '2.3.3', '2.3.2', '2.3.1', '2.3.0', '2.2.2', '2.2.0-rc1', '2.2.1','2.1.3', '2.1.1', '2.1.0', '2.0.6', '2.0'] %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'Audacity {{ version }}'
    # official page has counter measures for automaitc downloads - no alternative like fossies archive found as yet
    #installer: "https://www.fosshub.com/Audacity-old.html?dwl=audacity-win-{{ version }}.exe"
    uninstaller: '{{ PROGRAM_FILES }}\Audacity\unins000.exe'
    uninstall_flags: '/SP- /verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
#
