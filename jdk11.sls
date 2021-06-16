jdk11:
  '11.0.8.0':
    full_name: 'Java(TM) SE Development Kit 11.0.8 (64-bit)'
    installer: salt://win/repo-ng/jdk-11.0.8_windows-x64_bin.exe
    install_flags: '/s ADDLOCAL="ToolsFeature,SourceFeature"'
    uninstall_flags: '/x {9CF66E0E-CABB-5A5B-81E6-52718B73CE35} /qn /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
