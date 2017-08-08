chocolatey:
  {% for version in ['0.10.7', '0.10.6.1', '0.10.6', '0.10.5', '0.10.4', '0.10.3', '0.10.2', '0.10.1', '0.10.0', '0.9.10.3', '0.9.10.2', '0.9.10.1', '0.9.10'] %}
  '{{ version }}':
    full_name: 'Chocolatey {{ version }}'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/chocolatey/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/chocolatey/uninstall.cmd'
    cache_dir: True
  {% endfor %}

# this software also has it's own salt execution module, which you might prefer to use, see
# http://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.chocolatey.html
# for usage examples see
# https://github.com/saltstack/salt/issues/15709#issuecomment-118330172

