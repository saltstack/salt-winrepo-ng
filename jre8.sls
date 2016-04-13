jre8:
  '8.0.770.3':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Java 8 Update 77 (64-bit)'
    installer: 'salt://win/repo-ng/jre8/jre-8u77-windows-x64.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F86418077F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.oracle.com/webapps/download/AutoDL?BundleId=207231
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Java 8 Update 77'
    installer: 'salt://win/repo-ng/jre8_x86/jre-8u77-windows-i586.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F86418077F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.oracle.com/webapps/download/AutoDL?BundleId=207229
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8_x86/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% endif %}
    install_flags: '/s REBOOT=Suppress SPONSORS=0'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
  '8.0.730.2':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Java 8 Update 73 (64-bit)'
    installer: 'salt://win/repo-ng/jre8/jre-8u73-windows-x64.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F86418073F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=116030
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Java 8 Update 73'
    installer: 'salt://win/repo-ng/jre8_x86/jre-8u73-windows-i586.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F83218073F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=116028
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8_x86/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% endif %}
    install_flags: '/s REBOOT=Suppress SPONSORS=0'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
  '8.0.710.15':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Java 8 Update 71 (64-bit)'
    installer: 'salt://win/repo-ng/jre8/jre-8u71-windows-x64.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F86418071F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=114689
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Java 8 Update 71'
    installer: 'salt://win/repo-ng/jre8_x86/jre-8u71-windows-i586.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F83218071F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=114687
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8_x86/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% endif %}
    install_flags: '/s REBOOT=Suppress SPONSORS=0'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
  '8.0.660.18':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Java 8 Update 66 (64-bit)'
    installer: 'salt://win/repo-ng/jre8/jre-8u66-windows-x64.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F86418066F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=113219
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Java 8 Update 66'
    installer: 'salt://win/repo-ng/jre8_x86/jre-8u66-windows-i586.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F83218066F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=113217
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8_x86/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% endif %}
    install_flags: '/s REBOOT=Suppress SPONSORS=0'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
  '8.0.600.27':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Java 8 Update 60 (64-bit)'
    installer: 'salt://win/repo-ng/jre8/jre-8u60-windows-x64.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F86418060F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=107944
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Java 8 Update 60'
    installer: 'salt://win/repo-ng/jre8_x86/jre-8u60-windows-i586.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F83218060F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=107943
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8_x86/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% endif %}
    install_flags: '/s REBOOT=Suppress SPONSORS=0'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
  '8.0.510':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Java 8 Update 51 (64-bit)'
    installer: 'salt://win/repo-ng/jre8/jre-8u51-windows-x64.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F86418051F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=107944
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Java 8 Update 51'
    installer: 'salt://win/repo-ng/jre8_x86/jre-8u51-windows-i586.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F83218051F0} /norestart'
    # due to winrepo installer limitations you need to manually download the exe from
    # http://javadl.sun.com/webapps/download/AutoDL?BundleId=107943
    # and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8_x86/... way
    # to find manual download links for any version use:
    # http://www.java.com/en/download/manual.jsp
    {% endif %}
    install_flags: '/s REBOOT=Suppress SPONSORS=0'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
