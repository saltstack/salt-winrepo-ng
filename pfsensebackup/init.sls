# Software Definition File for pfSenseBackup

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd


# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set ARCH = "x64" %}
{% else %}
    {% set ARCH = "x32" %}
{% endif %}
#
pfsensebackup:
  {% for version in ['2.6.0',
                     '2.5.2', 
                     '2.5.1', 
                     '2.5'] %}
  '{{ version }}':
    full_name: 'pfSenseBackup {{ version }}'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/pfsensebackup/install.cmd'
    install_flags: '"{{ version }}"'
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/pfsensebackup/remove.cmd'
    uninstall_flags: '"{{ version }}"'
    cache_dir: True
  {% endfor %}
#

