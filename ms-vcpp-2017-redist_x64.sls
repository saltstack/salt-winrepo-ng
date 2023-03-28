ms-vcpp-2017-redist_x64:
   '14.20.27508':
      full_name: 'Microsoft Visual C++ 2017 Redistributable (x64) - 14.20.27508'
      installer: 'https://download.visualstudio.microsoft.com/download/pr/602ece0b-dae9-4f47-84c5-240dc997483e/5a0b5cec555e06240d79eb4ac6bc8973/vc_redist.x64.exe'
      install_flags: '/quiet /norestart'
      uninstaller: 'https://download.visualstudio.microsoft.com/download/pr/602ece0b-dae9-4f47-84c5-240dc997483e/5a0b5cec555e06240d79eb4ac6bc8973/vc_redist.x64.exe'
      uninstall_flags: '/uninstall /quiet /norestart'
      msiexec: False
      locale: en_US
      reboot: False
{% set version_data = {
                        '14.20.27508': {
                                         '1': '602ece0b-dae9-4f47-84c5-240dc997483e/5a0b5cec555e06240d79eb4ac6bc8973'
                                       },
                        '14.29.30037': {
                                         '0': 'f1998402-3cc0-466f-bd67-d9fb6cd2379b/A1592D3DA2B27230C087A3B069409C1E82C2664B0D4C3B511701624702B2E2A3'
                                       },
                        '14.29.30135': {
                                         '0': 'd3cbdace-2bb8-4dc5-a326-2c1c0f1ad5ae/9B9DD72C27AB1DB081DE56BB7B73BEE9A00F60D14ED8E6FDE45DAB3E619B5F04'
                                       }
                      }
%}
{% for major_version in version_data %}
{% for minor_version in version_data[major_version] %}
{% set subpath = version_data[major_version][minor_version] %}
   '{{ major_version }}.{{ minor_version }}':
      full_name: 'Microsoft Visual C++ 2015-2019 Redistributable (x64) - {{ major_version }}'
      installer: 'https://download.visualstudio.microsoft.com/download/pr/{{ subpath }}/VC_redist.x64.exe'
      install_flags: '/quiet /norestart'
      uninstaller: 'https://download.visualstudio.microsoft.com/download/pr/{{ subpath }}/VC_redist.x64.exe'
      uninstall_flags: '/uninstall /quiet /norestart'
      msiexec: False
      reboot: False
{% endfor %}
{% endfor %}

