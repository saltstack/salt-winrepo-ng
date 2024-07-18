{% load_yaml as versions -%}
# renovate: datasource=custom.putty depName=putty
- '0.81'
- '0.80'
- '0.79'
- '0.78'
- '0.77'
- '0.76'
- '0.75'
- '0.74'
- '0.73'
- '0.72'
- '0.71'
- '0.70'
- '0.69'
- '0.68'
{% endload -%}

{% load_yaml as old_versions -%}
- '0.67'
- '0.66'
- '0.65'
- '0.64'
{% endload -%}

{% set is_x64 = grains["cpuarch"] == "AMD64" -%}
{% set PROGRAM_FILES = "%ProgramFiles(x86)%" if is_x64 else "%ProgramFiles%" -%}

putty:
{%- for version in versions %}
  '{{ version }}.0.0':
    full_name: PuTTY release {{ version }}{{ " (64-bit)" if is_x64 }}
    installer: https://the.earth.li/~sgtatham/putty/{{ version }}/w{{ 64 if is_x64 else 32 }}/putty{{ "-64bit" if is_x64 }}-{{ version }}-installer.msi
    install_flags: /qn
    uninstall_flags: /qn
    msiexec: true
{%- endfor %}
{%- for version in old_versions %}
  '{{ version }}':
    full_name: PuTTY release {{ version }}
    installer: https://the.earth.li/~sgtatham/putty/{{ version }}/x86/putty-{{ version }}-installer.exe
    install_flags: /SP- /verysilent /norestart
    uninstaller: '{{ PROGRAM_FILES }}\PuTTY\unins000.exe'
    uninstall_flags: /SP- /silent /verysilent /suppressmsgboxes /norestart /UNINSTMODE
{%- endfor %}
