# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
stayawake:
  {% for version in ['1.0'] %}
  '{{ version }}':
    full_name: 'StayAwake'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/stayawake/install.cmd'
    install_flags: '"https://downloads.sourceforge.net/projects/stayawake/" "StayAwake-setup.exe" "1.0" "/S"' 
    uninstaller: '{{ PROGRAM_FILES }}\StayAwake\uninstall.exe'
    uninstall_flags: '/S'
  {% endfor %}
