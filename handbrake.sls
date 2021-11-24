# Source: https://handbrake.fr
handbrake:
{% for version in ['1.4.2',
                 '1.4.1',
                 '1.4.0',
                 '1.3.3',
                 '1.3.2',
                 '1.3.1',
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
    full_name: 'HandBrake {{ version }}'
    # as of ver. 1.0 they only produce 64-bit installers.
    # as of 1.3.2 downloads are on github.
    {% if version <= '1.3.1' %}
    installer: 'https://download.handbrake.fr/handbrake/releases/{{ version }}/HandBrake-{{ version }}-x86_64-Win_GUI.exe'
    {% else %}
    installer: 'https://github.com/HandBrake/HandBrake/releases/download/{{ version }}/HandBrake-{{ version }}-x86_64-Win_GUI.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\HandBrake\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of HandBrake that are pre ver 1.0 releases
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
{% for version in ['0.10.5'] %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'HandBrake {{ version }}'
    uninstaller: '%ProgramFiles%\HandBrake\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
