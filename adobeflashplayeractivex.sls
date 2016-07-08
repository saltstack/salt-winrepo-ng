{% if salt['pkg.compare_versions'](grains['osversion'], '<', '6.2') %}
adobeflashplayeractivex:
  latest:
    full_name: 'Adobe Flash Player 21 ActiveX'
    installer: 'http://fpdownload.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_21_active_x.msi'
    install_flags: '/quiet /norestart REMOVE_PREVIOUS=YES'
    uninstaller: 'http://fpdownload.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_21_active_x.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '20.0.0.306':
    full_name: 'Adobe Flash Player 20 ActiveX'
    installer: 'http://fpdownload.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_20_active_x.msi'
    install_flags: '/quiet /norestart REMOVE_PREVIOUS=YES'
    uninstaller: 'http://fpdownload.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_20_active_x.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '18.0.0.241':
    full_name: 'Adobe Flash Player 18 ActiveX'
    installer: 'http://fpdownload.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_18_active_x.msi'
    install_flags: '/quiet /norestart REMOVE_PREVIOUS=YES'
    uninstaller: 'http://fpdownload.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_18_active_x.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endif %}
