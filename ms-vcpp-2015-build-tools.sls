# The original vcpp 2015 build tools no longer works. Microsoft seems to be no
# longer hosting the backend files required by the web installer. The second
# installer in this list installs Visual Studio Build tools 2017 with support
# for 2015 Build Tools
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}

ms-vcpp-2015-build-tools:
  '14.0.25420.1':
    full_name: 'Microsoft Visual C++ Build Tools'
    installer: 'https://download.microsoft.com/download/5/F/7/5F7ACAEB-8363-451F-9425-68A90F98B238/visualcppbuildtools_full.exe'
    install_flags: '/Q /Silent /NoRestart'
    uninstaller: 'https://download.microsoft.com/download/5/F/7/5F7ACAEB-8363-451F-9425-68A90F98B238/visualcppbuildtools_full.exe'
    uninstall_flags: '/Q /U /Silent /NoRestart'
    reboot: False
  '15.9.28307.1500':
    full_name: 'Visual Studio Build Tools 2017'
    installer: https://aka.ms/vs/15/release/vs_buildtools.exe
    install_flags: '--wait --quiet --add Microsoft.VisualStudio.Workload.MSBuildTools --add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Component.Windows81SDK --add Microsoft.VisualStudio.Component.VC.140 --add Microsoft.Component.VC.Runtime.UCRTSDK'
    uninstaller: https://aka.ms/vs/15/release/vs_buildtools.exe
    uninstall_flags: 'uninstall --wait --quiet --installPath "{{ PROGRAM_FILES }}\Microsoft Visual Studio\2017\BuildTools"'
    reboot: False
