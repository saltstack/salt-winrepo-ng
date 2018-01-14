# both 32-bit (x86) AND a 64-bit (AMD64) installer available
vlc:
{% for version in ['2.2.8',
                   '2.2.6'] %}
  '{{ version }}':
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
    full_name: 'VLC media player'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://get.videolan.org/vlc/{{ version }}/win64/vlc-{{ version }}-win64.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://get.videolan.org/vlc/{{ version }}/win32/vlc-{{ version }}-win32.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\VideoLAN\VLC\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
