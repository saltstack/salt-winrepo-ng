eraser:
{% for version in ['6.2.2982'] %}
{% for version_full in ['6.2.0.2982'] %}
  '{{ version }}':
    full_name: 'Eraser {{ version_full }}'
    installer: 'https://10gbps-io.dl.sourceforge.net/project/eraser/Eraser%206/6.2/Eraser%206.2.0.2982.exe'
    install_flags: '--quiet /verysilent /norestart'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {DFCF78CC-3DAD-4C1E-8BC6-94DC5B73461E} /norestart'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}
