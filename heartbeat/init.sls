# Software Definition File for Elasticsearch Heartbeat

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd

{% set versions = ['7.3.0', '7.2.1', '7.2.0', '7.1.1', '6.8.2', '6.8.1',
                   '6.8.0'] %}

heartbeat:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Heartbeat'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/_/heartbeat/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/_/heartbeat/remove.cmd'
    cache_dir: True
{% endfor %}
