chocolatey:
  latest:
    full_name: 'Chocolatey'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/chocolatey/install.cmd'
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/chocolatey/uninstall.cmd'
    cache_dir: True

# this software also has it's own salt execution module, which you might prefer to use, see
# http://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.chocolatey.html
# for usage examples see
# https://github.com/saltstack/salt/issues/15709#issuecomment-118330172

