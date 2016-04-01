# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
jre:
  '7.0.790':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Java 7 Update 79 (64-bit)'
    installer: 'salt://win/repo-ng/jre/jre-7u79-windows-x64.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F06417079FF} /norestart'    
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Java 7 Update 79'
    installer: 'salt://win/repo-ng/jre_x86/jre-7u79-windows-i586.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F03217079FF} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=106367
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre_x86/... way    
    {% endif %}
    uninstaller: 'msiexec.exe'
    install_flags: '/s REBOOT=Suppress SPONSORS=0'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=106369
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre/... way
