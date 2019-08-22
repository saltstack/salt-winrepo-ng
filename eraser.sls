{% set versions = [('6', '2', '0', '2986', '{5227C9E1-58FC-45DE-880C-0E4C3559837D}'),
                   ('6', '2', '0', '2983', '{5247E16E-BCF8-95AB-1653-B3F8FBF8B3F1}')] %}

eraser:
{% for major, minor, sub, build, guid in versions %}
  '{{ major }}.{{ minor }}.{{ build }}':
    full_name: 'Eraser {{ major }}.{{ minor }}.{{ sub }}.{{ build }}'
    installer: 'https://downloads.sourceforge.net/project/eraser/Eraser%20{{ major }}/{{ major }}.{{ minor }}/Eraser%20{{ major }}.{{ minor }}.{{ sub }}.{{ build }}.exe'
    install_flags: '--quiet /verysilent /norestart'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/x {{ guid }} /qn /norestart'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
