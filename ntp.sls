# Install Meinberg NTP daemon for Windows
# Note: To do a silent installation, this installer needs a setup file named
#       setup.ini, which should be stored at C:/ProgramData/NTP/setup.ini.
#       The file is documented at
#       https://www.meinberg.de/german/sw/readme-ntpinstaller.htm#unattended
#
# find latest downloads at https://www.meinberg.de/german/sw/ntp.htm#ntp_stable
#
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
ntp:
  {% for version in ['4.2.8p15-v2', '4.2.8p15', '4.2.8p14', '4.2.8p13', '4.2.8p12', '4.2.8p11'] %}
  '{{ version }}':
    full_name: 'Network Time Protocol'
    installer: 'https://www.meinberg.de/download/ntp/windows/ntp-{{ version }}-win32-setup.exe'
    install_flags: '/USE_FILE=C:\\ProgramData\\NTP\\setup.ini'
    uninstaller: '{{ PROGRAM_FILES }}\\NTP\\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
