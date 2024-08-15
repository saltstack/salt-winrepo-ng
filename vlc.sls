# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
{%- load_yaml as versions %}
# renovate: datasource=custom.vlc depName=vlc
- '3.0.21'
- '3.0.19'
{%- endload %}
{% set versions_old = [
    '3.0.18',
    '3.0.17.4',
    '3.0.17.3',
    '3.0.17',
    '3.0.16',
    '3.0.15',
    '3.0.14',
    '3.0.13',
    '3.0.12',
    '3.0.11',
    '3.0.10',
    '3.0.9.2',
    '3.0.8',
    '3.0.7.1',
    '3.0.7',
    '3.0.6',
    '3.0.4',
] %}

vlc:
{% for version in versions + versions_old %}
  '{{ version }}':
    full_name: 'VLC media player'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://get.videolan.org/vlc/{{ version }}/win64/vlc-{{ version }}-win64.exe'
    {% else %}
    installer: 'https://get.videolan.org/vlc/{{ version }}/win32/vlc-{{ version }}-win32.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\VideoLAN\VLC\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of VLC media player that have had the installer assets removed from the videolan website.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{% set versions = [
    '3.0.12.1',
    '3.0.11.1',
    '3.0.9.1',
    '3.0.9',
    '3.0.5',
    '3.0.3',
    '3.0.2',
    '3.0.1',
    '3.0.0',
    '2.2.8',
    '2.2.6',
] %}
{% for version in versions %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'VLC media player'
    uninstaller: '{{ PROGRAM_FILES }}\VideoLAN\VLC\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
