{% set arch = {"AMD64": "amd64", "x86": "x86"}[grains["cpuarch"]] %}
{%- load_yaml as versions %}

# This version is no longer available for download
# -
  # - 3.1237.1764
  # - Microsoft Web Deploy 3.5
  # - https://download.microsoft.com/download/D/4/4/D446D154-2232-49A1-9D64-F5A9429913A4/WebDeploy_{{ arch }}_en-US.msi
-
  - 10.0.1973
  - Microsoft Web Deploy 3.6
  - https://download.microsoft.com/download/0/1/D/01DC28EA-638C-4A22-A57B-4CEF97755C6C/WebDeploy_{{ arch }}_en-US.msi
  - {{ '6773A61D-755B-4F74-95CC-97920E45E696' if arch == "amd64" else '39F793B1-4FDD-4994-A46D-245F994DC9E2' }}

{%- endload %}

webdeploy:
  {%- for version, full_name, install_url, uninstall_guid in versions %}
  '{{ version }}':
    full_name: {{ full_name }}
    installer: {{ install_url }}
    uninstaller: msiexec /x {{ "{" }}{{ uninstall_guid }}{{ "}" }}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor -%}
