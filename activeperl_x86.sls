#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of ActivePerl that have had the installer assets removed from the web.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
activeperl_x86:
  {% for version, build, guid_x64, guid_x86, release_x64, release_x86 in [('5.22.4', '2205', '{5F58794C-C0AA-4394-ADE1-F491204395B6}', '{7415BCA2-54C5-4A89-B7F8-9EB2960510D8}', '403863', '403863')] %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'ActivePerl {{ version }} Build {{ build }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    #installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build }}/ActivePerl-{{ version }}.{{ build }}-MSWin32-x86-64int-{{ release_x64 }}.exe'
    uninstall_flags: '/x {{ guid_x64 }} /qn /norestart'
    {% else %}
    #installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build }}/ActivePerl-{{ version }}.{{ build }}-MSWin32-x86-64int-{{ release_x86 }}.exe'
    uninstall_flags: '/x {{ guid_x86 }} /qn /norestart'
    {% endif %}
    uninstaller: 'msiexec.exe'
    #install_flags: '/exenoui /qn /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
