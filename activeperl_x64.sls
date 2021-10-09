#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of ActivePerl that have had the installer assets removed from the web.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
activeperl_x64:
  {% for version, build, guid, number in (('5.22.4', '2205', '{5F58794C-C0AA-4394-ADE1-F491204395B6}', '403863'), ('5.24.3', '2404', '{640132A6-C702-4B2F-96B6-562260574CAE}', '404865'), ('5.26.1', '2601', '{F25E2736-A81F-435C-8CD5-ED71AD63A2FD}', '404865')) %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'ActivePerl {{ version }} Build {{ build }} (64-bit)'
    #installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build}}/ActivePerl-{{ version }}.{{ build}}-MSWin32-x64-{{ number }}.exe'
    uninstaller: 'msiexec.exe'
    #install_flags: '/exenoui /qn /norestart'
    uninstall_flags: '/x {{ guid }} /qn /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
