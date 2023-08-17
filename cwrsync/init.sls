# Software Definition File for cwrsync from itefix.net/cwrsync-client

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd
# - remove.ps1

{%- load_yaml as versions %}
- 6.2.9
- 6.2.8
- 6.2.7
- 6.2.5
- 5.5.0
{%- endload %}

cwrsync:
{% for version in versions %}
  '{{ version }}':
    full_name: 'cwRsync'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/rsync-git/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/rsync-git/remove.cmd'
    cache_dir: True
{% endfor %}
