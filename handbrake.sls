# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
# Source: https://handbrake.fr
handbrake:
{% for version in ['1.3.1',
                 '1.3.0',
                 '1.2.2',
                 '1.2.1',
                 '1.2.0',
                 '1.1.2',
                 '1.1.1',
                 '1.1.0',
                 '1.0.7',
                 '1.0.3',
                 '1.0.2',
                 '1.0.1',
                 '1.0.0'] %}
  '{{ version }}':
    full_name: 'Handbrake {{ version }}'
    # as of ver. 1.0 they only produce 64-bit installers
    installer: 'https://download.handbrake.fr/handbrake/releases/{{ version }}/HandBrake-{{ version }}-x86_64-Win_GUI.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Handbrake\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Handbrake that are pre ver 1.0 releases
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
{% for version in ['0.10.5'] %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'Handbrake {{ version }}'
    uninstaller: '{{ PROGRAM_FILES }}\Handbrake\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
