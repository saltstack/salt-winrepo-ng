wmf5pp:
  Not Found:
    {% if salt['pkg.compare_versions'](grains['osversion'], '>=', '6.2') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.3') %}
    full_name: 'Windows Management Framework 5.0 Production Preview (KB3066438)'
    {% elif salt['pkg.compare_versions'](grains['osversion'], '>=', '6.1') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.2') %}
    full_name: 'Windows Management Framework 5.0 Production Preview (KB3066439)'
    {% elif salt['pkg.compare_versions'](grains['osversion'], '>=', '6.3') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.4') %}
    full_name: 'Windows Management Framework 5.0 Production Preview (KB3066437)'
    {% else %}
    full_name: 'my-fallback-full_name-that-never-should-happen'
    {% endif %}
    {% if grains['cpuarch'] == 'AMD64' %}
    {% if salt['pkg.compare_versions'](grains['osversion'], '>=', '6.2') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.3') %}
    installer: 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/W2K12-KB3066438-x64.msu'
    {% elif salt['pkg.compare_versions'](grains['osversion'], '>=', '6.1') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.2') %}
    installer: 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win7AndW2K8R2-KB3066439-x64.msu'
    {% elif salt['pkg.compare_versions'](grains['osversion'], '>=', '6.3') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.4') %}
    installer: 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win8.1AndW2K12R2-KB3066437-x64.msu'
    {% endif %}
    {% elif grains['cpuarch'] == 'x86' %}
    {% if salt['pkg.compare_versions'](grains['osversion'], '>=', '6.1') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.2') %}
    installer: 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win7AndW2K8R2-KB3066439-x86.msu'
    {% elif salt['pkg.compare_versions'](grains['osversion'], '>=', '6.3') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.4') %}
    installer: 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win8.1AndW2K12R2-KB3066437-x86.msu'
    {% else %}
    installer: 'my-fallback-installer-that-never-should-happen.exe'
    {% endif %}
    {% endif %}
    install_flags: '/quiet /warnrestart'
    {% if grains['cpuarch'] == 'AMD64' %}
    {% if salt['pkg.compare_versions'](grains['osversion'], '>=', '6.2') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.3') %}
    uninstaller: 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/W2K12-KB3066438-x64.msu'
    {% elif salt['pkg.compare_versions'](grains['osversion'], '>=', '6.1') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.2') %}
    uninstaller: 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win7AndW2K8R2-KB3066439-x64.msu'
    {% elif salt['pkg.compare_versions'](grains['osversion'], '>=', '6.3') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.4') %}
    uninstaller: 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win8.1AndW2K12R2-KB3066437-x64.msu'
    {% endif %}
    {% elif grains['cpuarch'] == 'x86' %}
    {% if salt['pkg.compare_versions'](grains['osversion'], '>=', '6.1') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.2') %}
    uninstaller: 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win7AndW2K8R2-KB3066439-x86.msu'
    {% elif salt['pkg.compare_versions'](grains['osversion'], '>=', '6.3') and salt['pkg.compare_versions'](grains['osversion'], '<', '6.4') %}
    uninstaller: 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win8.1AndW2K12R2-KB3066437-x86.msu'
    {% else %}
    uninstaller: 'my-fallback-uninstaller-that-never-should-happen.exe'
    {% endif %}
    {% endif %}
    uninstall_flags: '/quiet /warnrestart'
    msiexec: False
    wusa: True
    locale: en_US
    reboot: False
# source: https://www.microsoft.com/en-us/download/details.aspx?id=48729
#
