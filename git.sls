# both 32-bit (x86) AND a 64-bit (AMD64) installer available for git
{% set arch = {'AMD64': '64', 'x86': '32'}[salt["grains.get"]("cpuarch")] -%}

# Since version 2.33.0 no version number is added to the full_name field
# See https://github.com/git-for-windows/build-extra/pull/365

# There was a short-lived change in version format
# See https://github.com/git-for-windows/git/issues/2223
{% set new_style_versions = [
  '2.23.0',
  '2.22.0'
] %}

{% set versions = [
                   '2.33.0.2',
                   '2.33.0',
                   '2.32.0.2',
                   '2.32.0',
                   '2.31.1',
                   '2.31.0',
                   '2.30.2',
                   '2.30.1',
                   '2.30.0.2',
                   '2.30.0',
                   '2.29.2.3',
                   '2.29.2.2',
                   '2.29.2',
                   '2.29.0',
                   '2.28.0',
                   '2.27.0',
                   '2.26.2',
                   '2.26.1',
                   '2.26.0',
                   '2.25.1',
                   '2.25.0',
                   '2.24.1.2',
                   '2.24.0.2',
                   '2.24.0',
                   '2.23.0',
                   '2.22.0',
                   '2.21.0',
                   '2.20.1',
                   '2.20.0',
                   '2.19.2',
                   '2.19.1',
                   '2.19.0',
                   '2.18.0',
                   '2.17.1.2',
                   '2.17.0',
                   '2.16.3',
                   '2.16.2',
                   '2.16.0.2',
                   '2.15.0',
                   '2.14.2',
                   '2.13.3',
                   '2.13.1.2',
                   '2.12.2',
                   '2.12.1',
                   '2.11.0.3',
                   '2.11.0',
                   '2.10.2',
                   '2.10.1',
                   '2.10.0',
                   '2.9.0',
                   '2.8.4',
                   '2.8.3',
                   '2.8.2',
                   '2.8.1',
                   '2.7.2',
                   '2.7.1',
                   '2.7.0',
                   '2.6.4',
                   '2.6.2',
                   '2.5.3',
                   '2.5.2.2',
                   '2.5.0'
] %}

git:
{% for version in versions %}
  {% if version.count('.') == 3  %}
    {% set short_version = version[:-2] %}
    {% set win_ver = version[-1:] %}
  {% else %}
    {% set short_version = version %}
    {% set win_ver = "1" %}
  {% endif %}
  {% set extended_version = short_version ~ ".windows." ~ win_ver %}
  {% if version in new_style_versions %}
    {% set display_version = extended_version %}
  {% else %}
    {% set display_version = version %}
  {% endif %}
  '{{ display_version }}':
    {% if salt["pkg.compare_versions"](version, "<", "2.33.0") -%}
    {%   set displayname_version = " version " ~ display_version -%}
    {% endif -%}
    full_name: Git{{ displayname_version | default("") }}
    installer: https://github.com/git-for-windows/git/releases/download/v{{ extended_version }}/Git-{{ version }}-{{ arch }}-bit.exe
    # It is impossible to downgrade git silently. It will always pop a message
    # that will cause salt to hang. `/SUPPRESSMSGBOXES` will suppress that
    # warning allowing salt to continue, but the package will not downgrade
    install_flags: /VERYSILENT /NORESTART /SP- /NOCANCEL /SUPPRESSMSGBOXES
    uninstaller: forfiles
    uninstall_flags: '/p "%ProgramFiles%\Git" /m unins*.exe /c "cmd /c @path /VERYSILENT /NORESTART"'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}

{% set PROGRAM_FILES = {'AMD64': '%ProgramFiles(x86)%', 'x86': '%ProgramFiles%'}[salt["grains.get"]("cpuarch")] -%}

msysgit:
  '1.9.5-preview20150319':
    full_name: 'Git version 1.9.5-preview20150319'
    installer: 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20150319/Git-1.9.5-preview20150319.exe'
    install_flags: '/VERYSILENT /NORESTART /SP- /NOCANCEL'
    uninstaller: '{{ PROGRAM_FILES }}\Git\unins000.exe'
    uninstall_flags: '/VERYSILENT /NORESTART '
    msiexec: False
    locale: en_US
    reboot: False
  '1.9.5-preview20141217':
    full_name: 'Git version 1.9.5-preview20141217'
    installer: 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20141217/Git-1.9.5-preview20141217.exe'
    install_flags: '/VERYSILENT /NORESTART /SP- /NOCANCEL'
    uninstaller: '{{ PROGRAM_FILES }}\Git\unins000.exe'
    uninstall_flags: '/VERYSILENT /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
  '1.9.4-preview20140815':
    full_name: 'Git version 1.9.4-preview20140815'
    installer: 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.4-preview20140815/Git-1.9.4-preview20140815.exe'
    install_flags: '/VERYSILENT /NOREBOOT'
    uninstaller: '{{ PROGRAM_FILES }}\Git\unins000.exe'
    uninstall_flags: '/VERYSILENT /NOREBOOT'
    msiexec: False
    locale: en_US
    reboot: False
