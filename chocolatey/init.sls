chocolatey:
  {% for version in ['0.10.15', '0.10.11'] %}
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

