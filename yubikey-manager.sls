{% set source_path = 'https://developers.yubico.com/yubikey-manager-qt/Releases' %}

yubikey-manager:
  {% for version in ['1.1.0', '1.0.1', '1.0.0', '0.5.2', '0.5.1', '0.5.0'] %}
  '{{ version }}':
    full_name: 'YubiKey Manager'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: '{{ source_path }}/yubikey-manager-qt-{{ version }}-win64.exe'
    {% else %}
    installer: '{{ source_path }}/yubikey-manager-qt-{{ version }}-win32.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\Yubico\YubiKey Manager\ykman-uninstall.exe'
    uninstall_flags: '/S'
    reboot: False
  {% endfor %}
