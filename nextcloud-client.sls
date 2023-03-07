{% load_yaml as versions -%}
- 3.7.3
- 3.7.2
- 3.7.1
- 3.7.0
- 3.6.6
- 3.6.4
- 3.6.3
- 3.6.2
- 3.6.1
- 3.6.0
- 3.5.4
- 3.5.3
- 3.5.2
- 3.5.1
- 3.5.0
- 3.4.4
- 3.4.3
- 3.4.2
- 3.4.1
- 3.3.6
- 3.3.5
- 3.3.4
- 3.3.3
- 3.3.2
- 3.3.1
- 3.3.0
- 3.2.4
- 3.2.3
- 3.2.2
- 3.2.1
- 3.2.0
{% endload -%}

{# With v3.2.0 the legacy exe installer was discontinued in favor of the MSI installer.
   MSI installation can be customized using MSI properties, for example:
   NO_DESKTOP_SHORTCUT=1
   See https://docs.nextcloud.com/desktop/3.4/installing.html#features
   These can be provided to Salt using the `extra_install_flags` keyword argument to
   `pkg.install` or state function `pkg.installed` -#}

{% macro print_nextcloud_msi(version) %}
{% set arch = {"AMD64": "x64", "x86": "x86"}[salt["grains.get"]("cpuarch")] %}
  '{{ version }}':
    full_name: Nextcloud
    installer: https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-{{ version }}-{{ arch }}.msi
    install_flags: /qn /norestart
    uninstall_flags: /qn /norestart
    msiexec: true
{% endmacro -%}

{% macro print_nextcloud_exe(version) %}
  '{{ version }}':
    full_name: 'Nextcloud'
    installer: 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-{{ version }}-setup.exe'
    install_flags: '/S'
    uninstaller: 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-{{ version }}-setup.exe'
    uninstall_flags: '/S'
    locale: en_US
    reboot: False
{% endmacro -%}

nextcloud-client:
{% for version in versions -%}
{{ print_nextcloud_msi(version) }}
{% endfor -%}
{% for version in ['3.1.3', '3.1.2', '3.1.1', '3.1.0', '3.0.3', '3.0.2', '3.0.1', '3.0.0', '2.6.5', '2.6.4', '2.6.3', '2.6.2', '2.6.1', '2.6.0', '2.5.3', '2.5.2', '2.5.1', '2.5.0', '2.3.3.1', '2.3.2.1', '2.3.1.8', '2.2.4.2', '2.2.3.4'] -%}
{{ print_nextcloud_exe(version) }}
{% endfor -%}
