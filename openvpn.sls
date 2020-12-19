# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set arch = {'AMD64': '-x86_64', 'x86': '-i686'}[grains['cpuarch']] %}
{% set installer_ver = {'2.4.7': {'Windows-2016Server': '-I603'}} %}
{% set os_suffix = {'2.4.7': {'2016Server': '', '10': '-Win10'},
                    '2.4.8+': {'2016Server': '-Win10', '2019Server': '-Win10', '10': '-Win10'}} %}

{% macro print_openvpn(version, arch='') %}
  '{{ version }}':
    full_name: 'OpenVPN {{ version }} ' # Note: the OpenVPN installer adds a space at the end of its install string
    installer: 'https://swupdate.openvpn.org/community/releases/openvpn-install-{{ version }}{{ arch }}.exe'
    install_flags: '/S /SELECT_OPENSSL_UTILITIES=1 /SELECT_EASYRSA=1 /SELECTSHORTCUTS=1 /SELECTOPENVPN=1 /SELECTASSOCIATIONS=1 /SELECTOPENVPNGUI=1 /SELECTPATH=1'
    uninstaller: '%ProgramFiles%\OpenVPN\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endmacro %}

openvpn:
{% set version = '2.4.9-I601' ~ os_suffix['2.4.8+'][grains['osrelease']]|default('-Win7') %}
{{ print_openvpn(version) }}
{% set version = '2.4.8-I602' ~ os_suffix['2.4.8+'][grains['osrelease']]|default('-Win7') %}
{{ print_openvpn(version) }}
{% set version = '2.4.7' ~ installer_ver['2.4.7'][grains['osrelease']]|default('-I607') ~ os_suffix['2.4.7'][grains['osrelease']]|default('-Win7') %}
# Combined installer since v2.4+ so no arch needed
{{ print_openvpn(version) }}
{% for version in ['2.4.6-I602', '2.4.5-I601', '2.4.4-I601', '2.4.3-I602', '2.4.3-I601'] %}
{{ print_openvpn(version) }}
{% endfor %}
{% for version in ['2.3.17-I601', '2.3.12-I601', '2.3.11-I601', '2.3.10-I603', '2.3.8-I601', '2.3.6-I601'] %}
{{ print_openvpn(version, arch) }}
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
