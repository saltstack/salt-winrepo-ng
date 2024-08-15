# just 32-bit x86 installer used for now. x64 was introduced at ver. 7.0, but most plugins are still only 32-bit.
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
{%- load_yaml as versions %}
# renovate: datasource=github-releases depName=npp packageName=notepad-plus-plus/notepad-plus-plus
- '8.6.9'
- '8.6.8'
- '8.6.7'
- '8.6.6'
- '8.6.5'
- '8.6.4'
- '8.6.2'
- '8.6.1'
- '8.6'
- '8.5.8'
- '8.5.7'
- '8.5.6'
- '8.5.4'
- '8.5.3'
- '8.5.2'
- '8.5.1'
- '8.5'
- '8.4.9'
- '8.4.8'
- '8.4.7'
- '8.4.6'
- '8.4.5'
- '8.4.4'
- '8.4.3'
- '8.4.2'
- '8.4.1'
- '8.4'
- '8.3.3'
- '8.3.1'
- '8.2.1'
- '8.2'
- '8.1.9.3'
- '8.1.9.2'
- '8.1.5'
- '8.1.4'
- '8.1.3'
- '8.1.2'
- '8.1.1'
- '8.1'
- '7.9.5'
- '7.9.4'
- '7.9.3'
- '7.9.2'
- '7.9.1'
- '7.9'
- '7.8.9'
- '7.8.8'
- '7.8.7'
- '7.8.6'
- '7.8.5'
- '7.8.4'
- '7.8.3'
- '7.8.2'
- '7.8.1'
- '7.8'
- '7.7.1'
- '7.7'
{%- endload %}
npp:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Notepad++ (32-bit x86)'
    installer: 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v{{ version }}/npp.{{ version }}.Installer.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Notepad++\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Notepad Plus Plus that have had the installer assets removed from github.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{%- load_yaml as versions %}
- '7.6.6'
- '7.6.5'
- '7.6.4'
- '7.6.3'
- '7.6.2'
- '7.6.1'
- '7.6'
- '7.5.9'
- '7.5.8'
- '7.5.7'
- '7.5.6'
- '7.5.5'
- '7.5.4'
- '7.5.3'
- '7.5.2'
- '7.5.1'
- '7.5'
- '7.4.2'
- '7.4.1'
- '7.4'
- '7.3.3'
- '7.3.2'
- '7.3.1'
- '7.3'
- '7.2.2'
- '7.2.1'
- '7.2'
- '7.1'
- '7'
{%- endload %}
  {% for version in versions %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'Notepad++ (32-bit x86)'
    uninstaller: '{{ PROGRAM_FILES }}\Notepad++\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
