# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
maas360bootanalyzer:
  '1.0.0':
    full_name: 'MaaS360 Boot Analyzer v 1.0.0'
    installer: 'salt://win/repo-ng/maas360bootanalyzer/bootanalyzerinstaller.exe'
    install_flags: |
                   '/S' &
                   reg ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\MaaS360BootAnalyzer /f &
                   reg ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\MaaS360BootAnalyzer /f /v DisplayName /d "MaaS360 Boot Analyzer v 1.0.0" &
                   reg ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\MaaS360BootAnalyzer /f /v DisplayVersion /d 1.0.0 &
                   reg ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\MaaS360BootAnalyzer /f /v Publisher /d "installed by salt winrepo-ng" &
                   reg ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\MaaS360BootAnalyzer /f /v URLUpdateInfo /d "https://chocolatey.org" &
                   exit 0'
    uninstaller: '{{ PROGRAM_FILES }}\MaaS360\BootAnalyzer\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
