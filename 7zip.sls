# both 32-bit (x86) AND a 64-bit (AMD64) installer available

7zip:
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Newer release are now found on GitHub
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{% set source_path = 'https://github.com/ip7z/7zip/releases/download/' %}

{%- load_yaml as versions %}
# renovate: datasource=github-releases depName=7zip packageName=ip7z/7zip
- '24.07'
- '24.06'
- '24.05'
- '23.01'
- '22.01'
{%- endload %}
{%- for version in versions %}
  {%- set major, minor = version.split('.') %}
  '{{version}}.00.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: '7-Zip {{version}} (x64 edition)'
    installer: '{{ source_path }}{{major}}.{{minor}}/7z{{major}}{{minor}}-x64.msi'
    uninstaller: '{{ source_path }}{{major}}.{{minor}}/7z{{major}}{{minor}}-x64.msi'
    arch: x64
    {% else %}
    full_name: '7-Zip {{major}}.{{minor}}'
    installer: '{{ source_path }}{{major}}.{{minor}}/7z{{major}}{{minor}}.msi'
    uninstaller: '{{ source_path }}{{major}}.{{minor}}/7z{{major}}{{minor}}.msi'
    arch: x86
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{%- endfor %}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of 7-zip that can be downloaded from the 7-zip website
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{% set source_path = 'https://d.7-zip.org/a/' %}

{%- load_yaml as versions %}
- '24.04'
- '24.03'
- '24.02'
- '24.01'
- '19.00'
{%- endload %}
{%- for version in versions %}
  {%- set major, minor = version.split('.') %}
  '{{version}}.00.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: '7-Zip {{version}} (x64 edition)'
    installer: '{{ source_path }}7z{{major}}{{minor}}-x64.msi'
    uninstaller: '{{ source_path }}7z{{major}}{{minor}}-x64.msi'
    arch: x64
    {% else %}
    full_name: '7-Zip {{major}}.{{minor}}'
    installer: '{{ source_path }}7z{{major}}{{minor}}.msi'
    uninstaller: '{{ source_path }}7z{{major}}{{minor}}.msi'
    arch: x86
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{%- endfor %}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of 7-zip that have had the installer assets removed from
# the normal website. The binaries are still available on sourceforge.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{% set source_path = 'https://downloads.sourceforge.net/project/sevenzip/7-Zip/' %}

{% set versions = { '18':['06', '05', '03', '01'], '16':['04', '03', '02', '00']} %}
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{major}}.{{minor}}.00.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: '7-Zip {{major}}.{{minor}} (x64 edition)'
    installer: '{{ source_path }}{{ major }}.{{ minor }}/7z{{major}}{{minor}}-x64.msi'
    uninstaller: '{{ source_path }}7z{{major}}{{minor}}-x64.msi'
    arch: x64
    {% else %}
    full_name: '7-Zip {{major}}.{{minor}}'
    installer: '{{ source_path }}{{ major }}.{{ minor }}/7z{{major}}{{minor}}.msi'
    uninstaller: '{{ source_path }}7z{{major}}{{minor}}.msi'
    arch: x86
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}

