# Software Definition File for Bitwarden CLI

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd

{% set versions = ['1.22.1', '1.22.0', '1.21.1', '1.21.0', '1.20.0', '1.19.1', '1.19.0', '1.18.1', '1.18.0', '1.17.0', '1.16.0', '1.15.1', '1.15.0', '1.14.0'] %}

bitwarden-cli:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Bitwarden CLI {{ version }}'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/_/bitwarden-cli/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/_/bitwarden-cli/remove.cmd'
    cache_dir: True
{% endfor %}
