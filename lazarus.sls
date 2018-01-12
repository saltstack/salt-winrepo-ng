lazarus:
  1.8.0:
    full_name:
      Lazarus 1.8.0
    installer:
{%- if salt.grains.get('cpuarch') == 'AMD64' %}
      https://gigenet.dl.sourceforge.net/project/lazarus/Lazarus%20Windows%2064%20bits/Lazarus%201.8.0/lazarus-1.8.0-fpc-3.0.4-win64.exe
{%- else %}
      https://phoenixnap.dl.sourceforge.net/project/lazarus/Lazarus%20Windows%2032%20bits/Lazarus%201.8.0/lazarus-1.8.0-fpc-3.0.4-win32.exe
{%- endif %}
    install_flags:
      /silent
    uninstaller:
      C:\\lazarus\\unins000.exe
    uninstall_flags:
      /silent
