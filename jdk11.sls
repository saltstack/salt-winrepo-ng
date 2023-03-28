# installer to be downloaded from archive:
# https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html#license-lightbox
# current direct link:
# https://download.oracle.com/otn/java/jdk/11.0.8%2B10/dc5cf74f97104e8eac863698146a7ac3/jdk-11.0.8_windows-x64_bin.exe
# despite Oracle's documentation saying they drop trailing zeros, the removal pulls from the Registry version
# this version is the full version, hence the discrepancy below between 11.0.8.0 and 11.0.8

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
    source_hash: 'sha256=c02b94ce3ac7491652f5fac7dfbf94bf2be4c0869abd9bbc312be06d8c2fb5c0'
