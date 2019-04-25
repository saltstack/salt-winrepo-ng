# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
gpg4win-light:
  {% for version in ['2.3.4', '2.3.3', '2.3.2', '2.3.1', '2.3.0', '2.2.4'] %}
  '{{ version }}':
    full_name: 'Gpg4Win ({{ version }})'
    installer: 'https://files.gpg4win.org/gpg4win-light-{{ version }}.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\GNU\GnuPG\gpg4win-uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}

#
# Note: this 2.2.3 light installer has a bug and it needs to be fixed upstream
# Here are work around instructions under Issue #113 in the meantime
# https://github.com/saltstack/salt-winrepo/issues/113#issuecomment-72837987
#
