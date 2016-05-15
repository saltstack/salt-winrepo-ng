# only 32-bit (x86) installer available
{% if grains['cpuarch'] == 'AMD64' %}
   {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% elif grains['cpuarch'] == 'x86' %}
   {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
zipinstaller:
 '1.21':
   full_name: 'zipinstaller'
   installer: 'salt://win/repo-ng/zipinstaller/zipinst.exe'
   {% if grains['cpuarch'] == 'AMD64' %}
   install_flags: '/i zipinst_x64.zip'
   {% elif grains['cpuarch'] == 'x86' %}
   install_flags: '/i zipinst_x86.zip'
   {% endif %}
   uninstaller: 'zipinst.exe'
   uninstall_flags: '/uninst "{{ PROGRAM_FILES }}\zipinstaller\uninst1~.nsu"'
   msiexec: False
   locale: en_US
   reboot: False
   cache_dir: True
# Description: 
# This is a 32-bit zip archive program installer that installes directly from zip archives and creates shortcuts and un-install entries
# automatically, exactly as defined in a simple '~zipinst~.zic' if it finds it inside the zip archive.
#
# All it takes is calling up 'zipinst.exe /i <archive>.zip' that contains a file called '~zipinst~.zic', which itself is in *.ini file 
# format and contains, directives about where it should install etc.
#
# Source: 
# http://www.nirsoft.net/utils/zipinst.html
# http://www.nirsoft.net/utils/zipinst.exe
# http://www.nirsoft.net/utils/zipinst.zip (need to add '~zipinst~.zic' to it)
# you have to insert the '~zipinst~.zic' file into the 'zipinst.zip' file 
# and place the resulting zipinst.zip into the 'salt://win/repo-ng/zipinstaller/' on your master
# as well as the 'zipinst.exe' and 'cache_dir: True' will copy all files from master to minion cache
#
