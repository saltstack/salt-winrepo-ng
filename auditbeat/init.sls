# Software Definition File for Elasticsearch Auditbeat

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd

{% set versions = ['7.3.0', '7.2.1', '7.2.0', '7.1.1', '6.8.2', '6.8.1',
                   '6.8.0'] %}

auditbeat:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Auditbeat'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/_/auditbeat/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/_/auditbeat/remove.cmd'
    cache_dir: True
{% endfor %}
