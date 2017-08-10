# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set arch = {'AMD64': '-x86_64', 'x86': '-i686'}[grains['cpuarch']] %}
openvpn: 
{% for version in ['2.4.3-I602', '2.4.3-I601', '2.3.17-I601', '2.3.12-I601', '2.3.11-I601', '2.3.10-I603', '2.3.8-I601', '2.3.6-I601'] %}
  {% if version[2] > '3' %}
    {% set arch = "" %} # Combined installer since v2.4+
  {% endif %}
  '{{ version }}':
    full_name: 'OpenVPN {{ version }} ' # Note: the OpenVPN installer adds a space at the end of its install string
    installer: 'https://swupdate.openvpn.org/community/releases/openvpn-install-{{ version }}{{ arch }}.exe'
    install_flags: '/S /SELECT_OPENSSL_UTILITIES=1 /SELECT_EASYRSA=1 /SELECTSHORTCUTS=1 /SELECTOPENVPN=1 /SELECTASSOCIATIONS=1 /SELECTOPENVPNGUI=1 /SELECTPATH=1'
    uninstaller: '%ProgramFiles%\OpenVPN\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
#
# https://chocolatey.org/packages/openvpn
# Install with the following options:
# /SELECTSHORTCUTS=1 - create the start menu shortcuts
# /SELECTOPENVPN=1 - OpenVPN itself
# /SELECTSERVICE=1 - install the OpenVPN service
# /SELECTTAP=1 - install the TAP device driver
# /SELECTOPENVPNGUI=1 - install the default OpenVPN GUI
# /SELECTASSOCIATIONS=1 - associate with .ovpn files
# /SELECTOPENSSLUTILITIES=1 - install the utilities for generating public-private key pairs
# /SELECTEASYRSA=1 - install the RSA X509 certificate management scripts
# /SELECTPATH=1 - add openvpn.exe in PATH
# /SELECTOPENSSLDLLS=1 - dependencies - OpenSSL DLL's
# /SELECTLZODLLS=1 - dependencies - LZO compressor DLL's
# /SELECT_PKCS11DLLS=1 - dependencies - PCKS#11 DLL's
