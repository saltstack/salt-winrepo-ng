cpu-z:
{% for version in ['1.94', '1.86', '1.85', '1.84', '1.83', '1.82', '1.81', '1.80', '1.79', '1.78', '1.77', '1.76', '1.75', '1.74', '1.73', '1.72.1', '1.71.1', '1.70', '1.69', '1.68', '1.67', '1.66', '1.65'] %}
  '{{ version }}':
    full_name: 'CPUID CPU-Z {{ version }}'
    # http url used as https does not exist for download.cpuid.com subdomain
    installer: 'http://download.cpuid.com/cpu-z/cpu-z_{{ version }}-en.exe'
    install_flags: '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    uninstaller: '%ProgramFiles%\CPUID\CPU-Z\unins000.exe'
    uninstall_flags: '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
