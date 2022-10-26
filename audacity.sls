{% set versions = [
    '3.2.1',
    '3.2.0',
    '3.1.3',
    '3.1.2',
    '3.1.1',
    '3.1.0',
    '3.0.5',
    '3.0.3',
] %}
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
    {% set ARCH = "64bit" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
    {% set ARCH = "32bit" %}
{% endif %}
{% set source_path = 'https://github.com/audacity/audacity/releases/download/' %}
audacity:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Audacity {{ version }}'
    installer: {{ source_path }}Audacity-{{ version }}/audacity-win-{{ version }}-{{ ARCH }}.exe
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '%ProgramFiles%\Audacity\unins000.exe'
    uninstall_flags: '/SP- /verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# These have a different filename format
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{% set versions = [
    '3.0.2',
    '3.0.0',
] %}
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Audacity {{ version }}'
    installer: {{ source_path }}Audacity-{{ version }}/audacity-win-{{ version }}.exe
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\Audacity\unins000.exe'
    uninstall_flags: '/SP- /verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Audacity that have had the installer assets moved to the legacy page.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{% set versions = [
    '2.4.2',
    '2.4.1',
    '2.3.3',
    '2.3.2',
    '2.3.1',
    '2.3.0',
    '2.2.2',
    '2.2.0-rc1',
    '2.2.1',
    '2.1.3',
    '2.1.1',
    '2.1.0',
    '2.0.6',
    '2.0',
] %}
  {% for version in versions %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'Audacity {{ version }}'
    uninstaller: '{{ PROGRAM_FILES }}\Audacity\unins000.exe'
    uninstall_flags: '/SP- /verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
#
