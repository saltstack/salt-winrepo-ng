patchmypc:
  {% for version in [
                        'latest' 
                    ] %}
  '{{ version }}':
    full_name: 'Patch My PC Home Updater'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/patchmypc/install.cmd'
    install_flags: '"https://patchmypc.com/freeupdater/PatchMyPC.exe" "PatchMyPC.exe" "{{ version }}"'
    uninstaller: ''
    uninstall_flags: ''
    cache_dir: True
  {% endfor %}
