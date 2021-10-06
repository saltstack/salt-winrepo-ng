{% set installer_ver = {'2.4.7': {'2016Server': '-I603'}} -%}
{% set os_suffix = {'2.4.7': {'2016Server': '', '10': '-Win10'},
                    '2.4.8+': {'2016Server': '-Win10', '2019Server': '-Win10', '10': '-Win10'}} -%}
{# Since v2.5 the version recorded in the registry differs from that displayed as part of the
   name and used in the download URL. Salt must understand the registry version so that the
   software can be uninstalled using Salt. -#}
{% set display_version = { "2.5.023": "2.5.4-I601",
                           "2.5.022": "2.5.3-I601",
                           "2.5.021": "2.5.2-I601",
                           "2.5.020": "2.5.1-I601",
                           "2.5.019": "2.5.0-I601" } -%}

{# MSI installation can be customized using the ADDLOCAL parameter, for example:
   ADDLOCAL=OpenVPN.Service,OpenVPN,Drivers,Drivers.Wintun
   installs only the OpenVPN service and the new Wintun driver.
   See https://community.openvpn.net/openvpn/wiki/OpenVPN2.5_Windows_MSI_Unattended_Install
   This can be provided to Salt using the `extra_install_flags` keyword argument to
   `pkg.install` or state function `pkg.installed` -#}

{% macro print_openvpn_msi(version) %}
{%   set arch = {"AMD64": "amd64", "x86": "x86"}[salt["grains.get"]("cpuarch")] %}
  '{{ version }}':
    full_name: 'OpenVPN {{ display_version[version] }} {{ arch }}'
    installer: https://swupdate.openvpn.org/community/releases/OpenVPN-{{ display_version[version] }}{{ "-" ~ arch }}.msi
    install_flags: /qn /norestart
    uninstall_flags: /qn /norestart
    msiexec: true
{% endmacro -%}

{% macro print_openvpn_exe(version, arch="") %}
  '{{ version }}':
    full_name: 'OpenVPN {{ version }} ' # Note: the OpenVPN installer adds a space at the end of its install string
    installer: 'https://swupdate.openvpn.org/community/releases/openvpn-install-{{ version }}{{ arch }}.exe'
    install_flags: '/S /SELECT_OPENSSL_UTILITIES=1 /SELECT_EASYRSA=1 /SELECTSHORTCUTS=1 /SELECTOPENVPN=1 /SELECTASSOCIATIONS=1 /SELECTOPENVPNGUI=1 /SELECTPATH=1'
    uninstaller: '%ProgramFiles%\OpenVPN\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endmacro -%}

openvpn:
{% for version in ["2.5.023", "2.5.022", "2.5.021", "2.5.020", "2.5.019"] -%}
{{ print_openvpn_msi(version) }}
{% endfor -%}
{# Combined installer since v2.4+ so no arch needed -#}
{% for version in ['2.4.11-I602', '2.4.10-I601', '2.4.9-I601', '2.4.8-I602'] -%}
{%   set version = version ~ os_suffix['2.4.8+'][salt["grains.get"]("osrelease")]|default('-Win7') -%}
{{ print_openvpn_exe(version) }}
{% endfor -%}
{% set version = '2.4.7' ~ installer_ver['2.4.7'][salt["grains.get"]("osrelease")]|default('-I607') ~ os_suffix['2.4.7'][salt["grains.get"]("osrelease")]|default('-Win7') %}
{{ print_openvpn_exe(version) }}
{% for version in ['2.4.6-I602', '2.4.5-I601', '2.4.4-I601', '2.4.3-I602', '2.4.3-I601'] -%}
{{ print_openvpn_exe(version) }}
{% endfor -%}
{% for version in ['2.3.17-I601', '2.3.12-I601', '2.3.11-I601', '2.3.10-I603', '2.3.8-I601', '2.3.6-I601'] -%}
{%   set arch = {'AMD64': '-x86_64', 'x86': '-i686'}[salt["grains.get"]("cpuarch")] -%}
{{ print_openvpn_exe(version, arch) }}
{% endfor -%}

{# https://chocolatey.org/packages/openvpn
   Install with the following options:
   /SELECTSHORTCUTS=1 - create the start menu shortcuts
   /SELECTOPENVPN=1 - OpenVPN itself
   /SELECTSERVICE=1 - install the OpenVPN service
   /SELECTTAP=1 - install the TAP device driver
   /SELECTOPENVPNGUI=1 - install the default OpenVPN GUI
   /SELECTASSOCIATIONS=1 - associate with .ovpn files
   /SELECTOPENSSLUTILITIES=1 - install the utilities for generating public-private key pairs
   /SELECTEASYRSA=1 - install the RSA X509 certificate management scripts
   /SELECTPATH=1 - add openvpn.exe in PATH
   /SELECTOPENSSLDLLS=1 - dependencies - OpenSSL DLL's
   /SELECTLZODLLS=1 - dependencies - LZO compressor DLL's
   /SELECT_PKCS11DLLS=1 - dependencies - PCKS#11 DLL's -#}
