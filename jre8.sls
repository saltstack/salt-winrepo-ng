# due to winrepo installer limitations you need to manually download the exe from
# http://www.java.com/en/download/manual.jsp
# and put it on the winrepo on master to install it the 'salt://win/repo-ng/jre8_*/...
# Do NOT use the 'archive' versions download page, use the 'manual' one above. The 'archive' one will give 
# you more versions and also different builds. IF you do use these, make sure you adapt your sls file accordingly.  
# http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html

{% set versions = {'8.0':['201','211','221','231']} %}

jre8:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{major}}.{{minor}}0.9':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Java 8 Update {{minor}} (64-bit)'
    installer: 'salt://win/repo-ng/jre8/jre-8u{{minor}}-windows-x64.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F64180{{minor}}F0} /norestart'
    {% else %}
    full_name: 'Java 8 Update {{minor}}'
    installer: 'salt://win/repo-ng/jre8/jre8_x86/jre-8u{{minor}}-windows-i586.exe'
    uninstall_flags: '/qn /x {26A24AE4-039D-4CA4-87B4-2F32180{{minor}}F0} /norestart'
    {% endif %}
    install_flags: '/s REBOOT=Suppress SPONSORS=0 REMOVEOUTOFDATEJRES=1 AUTO_UPDATE=Disable'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}
