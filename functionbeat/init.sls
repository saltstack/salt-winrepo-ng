# Software Definition File for Elasticsearch Functionbeat

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd

{% set versions = ['7.3.0', '7.2.1', '7.2.0', '7.1.1', '6.8.2', '6.8.1',
                   '6.8.0'] %}

functionbeat:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Functionbeat'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/functionbeat/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/functionbeat/remove.cmd'
    cache_dir: True
{% endfor %}
