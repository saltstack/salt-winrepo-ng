{% set MSI_LOCATION = 'https://github.com/adoptium/temurin11-binaries/releases/download/' %}
{% set MSI_VERSIONS = [
      ('11.0.20.101','11.0.20.1+1'),
      ('11.0.20.8', '11.0.20+8'),
      ('11.0.19.7', '11.0.19+7'),
      ('11.0.18.10', '11.0.18+10'),
      ('11.0.17.8', '11.0.17+8'),
] %}
temurin11:
  {% for VER, MSI_VER in MSI_VERSIONS %}
  '{{ VER }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Eclipse Temurin JDK with Hotspot {{ MSI_VER }} (x64)'
    installer: '{{ MSI_LOCATION }}jdk-{{ MSI_VER }}/OpenJDK11U-jdk_x64_windows_hotspot_{{ MSI_VER|replace('+', '_') }}.msi'
    arch: x64
    {% else %}
    full_name: 'Eclipse Temurin JDK with Hotspot {{ MSI_VER }} (x86)'
    installer: '{{ MSI_LOCATION }}jdk-{{ MSI_VER }}/OpenJDK11U-jdk_x86-32_windows_hotspot_{{ MSI_VER|replace('+', '_') }}.msi'
    {% endif %}
    install_flags: '/quiet ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
