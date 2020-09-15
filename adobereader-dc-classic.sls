# to understand what is meant by "classic" see
# http://www.adobe.com/devnet-docs/acrobatetk/tools/AdminGuide/whatsnewdc.html

adobereader-dc-classic:
  {% for version in ['20.012.20041', '20.009.20063', '20.006.20042', '20.006.20034', '19.021.20058', '19.021.20049', '19.021.20047', '19.012.20036', '19.012.20034', '19.010.20099', '19.010.20098', '19.010.20091', '19.010.20069', '19.010.20064', '19.008.20081', '19.008.20071', '18.011.20063', '18.011.20058', '18.011.20055', '18.011.20040'] %}
  {% set versionNoDots = version | replace(".","") %}
  '{{ version }}':
    full_name: 'Adobe Acrobat Reader DC'
    installer: 'https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/{{ versionNoDots }}/AcroRdrDC{{ versionNoDots }}_en_US.exe'
    install_flags: '/msi EULA_ACCEPT=YES ALLUSERS=1 REMOVE_PREVIOUS=YES /qn'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {AC76BA86-7AD7-1033-7B44-AC0F074E4100} /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
