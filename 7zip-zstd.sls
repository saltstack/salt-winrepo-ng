# 7zip-zstd is a version of 7zip that supports the Z-standard library
# With this version you can work with tar.zst files
{% set source_path = 'https://github.com/mcmilk/7-Zip-zstd/releases/download' %}
{%- load_yaml as versions %}
  - {"ver": "22.01", "z_ver": "1.5.5", "rel": "R3"}
  - {"ver": "22.01", "z_ver": "1.5.5", "rel": "R2"}
  - {"ver": "22.01", "z_ver": "1.5.5", "rel": "R1"}
  - {"ver": "22.01", "z_ver": "1.5.4", "rel": "R4"}
  - {"ver": "22.01", "z_ver": "1.5.4", "rel": "R3"}
  - {"ver": "22.01", "z_ver": "1.5.4", "rel": "R2"}
  - {"ver": "22.01", "z_ver": "1.5.4", "rel": "R1"}
{%- endload %}

7zip-zstd:
{% for v in versions %}
  '{{ v.ver }} ZS v{{ v.z_ver }} {{ v.rel }}':
  {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 7-Zip ZS {{ v.ver }} ZS v{{ v.z_ver }} {{ v.rel }} (x64)
    installer: {{ source_path }}/v{{ v.ver }}-v{{ v.z_ver }}-{{ v.rel }}/7z{{ v.ver }}-zstd-x64.exe
  {% else %}
    full_name: 7-Zip ZS {{ v.ver }} ZS v{{ v.z_ver }} {{ v.rel }}
    installer: {{ source_path }}/v{{ v.ver }}-v{{ v.z_ver }}-{{ v.rel }}/7z{{ v.ver }}-zstd-x32.exe
  {% endif %}
    uninstaller: C:\Program Files\7-Zip-Zstandard\Uninstall.exe
    install_flags: /S
    uninstall_flags: /S
    msiexec: False
    reboot: False
{% endfor %}
