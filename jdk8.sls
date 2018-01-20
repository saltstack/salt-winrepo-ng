# due to winrepo installer limitations you need to manually download the exe from
# http://javadl.oracle.com/webapps/download/AutoDL?BundleId=225355_090f390dda5b47b9b721c7dfaa008135
# and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8/... way
# to find manual download links for any version use:
# http://www.java.com/en/download/manual.jsp
# Do NOT use the 'archive' versions download page, use the 'manual' one above. The 'archive' one will give 
# you more versions and also different builds. IF you do use these, make sure you adapt your sls file accordingly.  
# http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html

jdk8:
  '8.0.1440.1':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Java SE Development Kit 8 Update 144 (64-bit)'
    installer: salt://win/repo-ng/jre8/jdk-8u144-windows-x64.exe
    {% else %}
    full_name: 'Java SE Development Kit 8 Update 144'
    installer: salt://win/repo-ng/jre8_x86/jdk-8u144-windows-i586.exe
    {% endif %}
    install_flags: '/s ADDLOCAL="ToolsFeature,SourceFeature,PublicjreFeature"'
    uninstall_flags: '/x {32A3A4F4-B792-11D6-A78A-00B0D0180144} /qn /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
