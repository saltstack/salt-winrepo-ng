# Software Definition File for rSync-Git

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd
# - remove.ps1

{%- load_yaml as versions %}
- 3.2.7-2
{%- endload %}

rsync-git:
{% for version in versions %}
  '{{ version }}':
    full_name: 'rSync for Git'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/_/rsync-git/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/_/rsync-git/remove.cmd'
    cache_dir: True
{% endfor %}
