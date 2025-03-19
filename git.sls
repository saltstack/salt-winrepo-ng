# Both 32-bit (x86) AND a 64-bit (AMD64) installer available for Git until v2.48.1
{% set cpu_arch = salt["grains.get"]("cpuarch", "AMD64") -%}
{% set url_arch = {"AMD64": "64", "x86": "32"}[cpu_arch] ~ "-bit" -%}

# Since version 2.33.0 no version number is added to the full_name field
# See https://github.com/git-for-windows/build-extra/pull/365

# There was a short-lived change in version format
# See https://github.com/git-for-windows/git/issues/2223
{% load_yaml as new_style_versions -%}
- '2.23.0.windows.1'
- '2.22.0.windows.1'
{% endload -%}

{% load_yaml as versions -%}
# renovate: datasource=github-releases depName=git packageName=git-for-windows/git
[]
{% endload -%}

{% load_yaml as x64_and_x86_versions -%}
- '2.48.1.windows.1'
- '2.47.1.windows.2'
- '2.47.1.windows.1'
- '2.47.0.windows.2'
- '2.47.0.windows.1'
- '2.46.2.windows.1'
- '2.46.1.windows.1'
- '2.46.0.windows.1'
- '2.45.2.windows.1'
- '2.45.1.windows.1'
- '2.45.0.windows.1'
- '2.44.0.windows.1'
- '2.43.0.windows.1'
- '2.42.0.windows.2'
- '2.42.0.windows.1'
- '2.41.0.windows.3'
- '2.41.0.windows.1'
- '2.40.1.windows.1'
- '2.40.0.windows.1'
- '2.39.2.windows.1'
- '2.39.1.windows.1'
- '2.39.0.windows.2'
- '2.39.0.windows.1'
- '2.38.1.windows.1'
- '2.38.0.windows.1'
- '2.37.3.windows.1'
- '2.37.2.windows.2'
- '2.37.1.windows.1'
- '2.37.0.windows.1'
- '2.36.1.windows.1'
- '2.36.0.windows.1'
- '2.35.3.windows.1'
- '2.35.2.windows.1'
- '2.35.1.windows.2'
- '2.35.1.windows.1'
- '2.35.0.windows.1'
- '2.34.1.windows.1'
- '2.34.0.windows.1'
- '2.33.1.windows.1'
- '2.33.0.windows.2'
- '2.33.0.windows.1'
- '2.32.0.windows.2'
- '2.32.0.windows.1'
- '2.31.1.windows.1'
- '2.31.0.windows.1'
- '2.30.2.windows.1'
- '2.30.1.windows.1'
- '2.30.0.windows.2'
- '2.30.0.windows.1'
- '2.29.2.windows.3'
- '2.29.2.windows.2'
- '2.29.2.windows.1'
- '2.29.1.windows.1'
- '2.29.0.windows.1'
- '2.28.0.windows.1'
- '2.27.0.windows.1'
- '2.26.2.windows.1'
- '2.26.1.windows.1'
- '2.26.0.windows.1'
- '2.25.1.windows.1'
- '2.25.0.windows.1'
- '2.24.1.windows.2'
- '2.24.0.windows.2'
- '2.24.0.windows.1'
- '2.23.0.windows.1'
- '2.22.0.windows.1'
- '2.21.0.windows.1'
- '2.20.1.windows.1'
- '2.20.0.windows.1'
- '2.19.1.windows.1'
- '2.19.0.windows.1'
- '2.18.0.windows.1'
- '2.17.1.windows.2'
- '2.17.1.windows.1'
- '2.17.0.windows.1'
- '2.16.3.windows.1'
- '2.16.2.windows.1'
- '2.16.1.windows.4'
- '2.16.1.windows.3'
- '2.16.1.windows.2'
- '2.16.1.windows.1'
- '2.16.0.windows.2'
- '2.15.1.windows.2'
- '2.15.1.windows.1'
- '2.15.0.windows.1'
- '2.14.3.windows.1'
- '2.14.2.windows.3'
- '2.14.2.windows.2'
- '2.14.2.windows.1'
- '2.14.1.windows.1'
- '2.14.0.windows.2'
- '2.14.0.windows.1'
- '2.13.3.windows.1'
- '2.13.2.windows.1'
- '2.13.1.windows.2'
- '2.13.1.windows.1'
- '2.13.0.windows.1'
- '2.12.2.windows.2'
- '2.12.2.windows.1'
- '2.12.1.windows.1'
- '2.12.0.windows.1'
- '2.11.1.windows.1'
- '2.11.0.windows.3'
- '2.11.0.windows.2'
- '2.11.0.windows.1'
- '2.10.2.windows.1'
- '2.10.1.windows.1'
- '2.10.0.windows.1'
- '2.9.3.windows.2'
- '2.9.3.windows.1'
- '2.9.2.windows.1'
- '2.9.0.windows.1'
- '2.8.4.windows.1'
- '2.8.3.windows.1'
- '2.8.2.windows.1'
- '2.8.1.windows.1'
- '2.8.0.windows.1'
- '2.7.4.windows.1'
- '2.7.3.windows.1'
- '2.7.2.windows.1'
- '2.7.1.windows.2'
- '2.7.1.windows.1'
- '2.7.0.windows.2'
- '2.7.0.windows.1'
- '2.6.4.windows.1'
- '2.6.3.windows.1'
- '2.6.2.windows.1'
- '2.6.1.windows.1'
- '2.6.0.windows.1'
- '2.5.3.windows.1'
- '2.5.2.windows.2'
- '2.5.2.windows.1'
- '2.5.1.windows.1'
- '2.5.0.windows.1'
{% endload -%}

{% load_yaml as uninstall_only -%}
- '2.19.2.windows.1'
{% endload -%}

{% set arch_specific_versions = {"AMD64": versions + x64_and_x86_versions, "x86": x64_and_x86_versions} -%}

git:
{%- for version in arch_specific_versions[cpu_arch] + uninstall_only %}
  {% set git_version = version.split(".")[:3]|join(".") -%}
  {% set win_suffix = version[-1:] -%}
  {% if win_suffix|int > 1 -%}
  {%   set compact_version = git_version ~ "." ~ win_suffix -%}
  {% else -%}
  {%   set compact_version = git_version -%}
  {% endif -%}
  {% if version in new_style_versions -%}
  {%   set display_version = version -%}
  {% else -%}
  {%   set display_version = compact_version -%}
  {% endif -%}
  '{{ display_version }}':
    {% if salt["pkg.compare_versions"](version, "<", "2.33.0.windows.1") -%}
    {%   set full_name_suffix = " version " ~ display_version -%}
    {% endif -%}
    full_name: Git{{ full_name_suffix|d }}
    {% if version not in uninstall_only -%}
    installer: https://github.com/git-for-windows/git/releases/download/v{{ version }}/Git-{{ compact_version }}-{{ url_arch }}.exe
    # It is impossible to downgrade git silently. It will always pop a message
    # that will cause salt to hang. `/SUPPRESSMSGBOXES` will suppress that
    # warning allowing salt to continue, but the package will not downgrade
    install_flags: /VERYSILENT /NORESTART /SP- /NOCANCEL /SUPPRESSMSGBOXES
    {% endif -%}
    uninstaller: forfiles
    uninstall_flags: /p "%ProgramFiles%\Git" /m unins*.exe /c "cmd /c @path /VERYSILENT /NORESTART"
{%- endfor %}

{% set PROGRAM_FILES = {"AMD64": "%ProgramFiles(x86)%", "x86": "%ProgramFiles%"}[cpu_arch] -%}

msysgit:
  '1.9.5-preview20150319':
    full_name: 'Git version 1.9.5-preview20150319'
    installer: 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20150319/Git-1.9.5-preview20150319.exe'
    install_flags: '/VERYSILENT /NORESTART /SP- /NOCANCEL'
    uninstaller: '{{ PROGRAM_FILES }}\Git\unins000.exe'
    uninstall_flags: '/VERYSILENT /NORESTART '
  '1.9.5-preview20141217':
    full_name: 'Git version 1.9.5-preview20141217'
    installer: 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20141217/Git-1.9.5-preview20141217.exe'
    install_flags: '/VERYSILENT /NORESTART /SP- /NOCANCEL'
    uninstaller: '{{ PROGRAM_FILES }}\Git\unins000.exe'
    uninstall_flags: '/VERYSILENT /NORESTART'
  '1.9.4-preview20140815':
    full_name: 'Git version 1.9.4-preview20140815'
    installer: 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.4-preview20140815/Git-1.9.4-preview20140815.exe'
    install_flags: '/VERYSILENT /NOREBOOT'
    uninstaller: '{{ PROGRAM_FILES }}\Git\unins000.exe'
    uninstall_flags: '/VERYSILENT /NOREBOOT'
