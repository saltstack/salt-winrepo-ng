vs_remotetools_2017:
  latest:
    full_name: 'Remote Tools for Visual Studio 2017'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer:   'https://aka.ms/vs/15/release/RemoteTools.amd64ret.enu.exe'
    uninstaller: 'https://aka.ms/vs/15/release/RemoteTools.amd64ret.enu.exe'
    arch: x64
    {% else %}
    installer:   'https://aka.ms/vs/15/release/RemoteTools.x86ret.enu.exe'
    uninstaller: 'https://aka.ms/vs/15/release/RemoteTools.x86ret.enu.exe'
    arch: x86
    {% endif %}
    install_flags: '/install /passive /quiet'
    uninstall_flags: '/uninstall /passive /quiet'
    msiexec: False
    locale: en_US
    reboot: False
