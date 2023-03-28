{% set base_url = "https://downloads.sourceforge.net/project/grepwin/" %}
{% set versions = [
    "2.0.11",
    "2.0.10",
    "2.0.9",
    "2.0.8",
    "2.0.6",
    "2.0.5",
    "2.0.4",
] %}
grepwin:
{% for version in versions %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: grepWin x64
    installer: {{ base_url }}{{ version }}/grepWin-{{ version }}-x64.msi
    uninstaller: {{ base_url }}{{ version }}/grepWin-{{ version }}-x64.msi
    {% else %}
    full_name: grepWin
    installer: {{ base_url }}{{ version }}/grepWin-{{ version }}.msi
    uninstaller: {{ base_url }}{{ version }}/grepWin-{{ version }}.msi
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}

# Archive versions
{% set base_url = "https://downloads.sourceforge.net/project/grepwin/Archive/" %}
{% set versions = [
    ("1.6.682", "1.6.15"),
    ("1.6.673", "1.6.14"),
    ("1.6.661", "1.6.13"),
    ("1.6.646", "1.6.12"),
] %}
{% for version, version_dl in versions %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: grepWin x64
    installer: {{ base_url }}{{ version_dl }}/grepWin-{{ version_dl }}-x64.msi
    uninstaller: {{ base_url }}{{ version_dl }}/grepWin-{{ version_dl }}-x64.msi
    {% else %}
    full_name: 'grepWin'
    installer: {{ base_url }}{{ version_dl }}/grepWin-{{ version_dl }}.msi
    uninstaller: {{ base_url }}{{ version_dl }}/grepWin-{{ version_dl }}.msi
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
