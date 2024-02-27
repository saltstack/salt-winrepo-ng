{% set data = {
     64: {
       "pkg": "_x64",
       "name": " (64-bit)",
       "url": "?archType=x64",
     },
     86: {
       "name": " (32-bit)",
     },
   }
-%}

{% for arch in 64, 86 -%}
zoom{{ data[arch].pkg|d }}:
  latest:
    full_name: Zoom{{ data[arch].name|d }}
    installer: https://zoom.us/client/latest/ZoomInstallerFull.msi{{ data[arch].url|d }}
    install_flags: /qn /norestart
    uninstall_flags: /qn /norestart
    msiexec: true
{% endfor -%}
