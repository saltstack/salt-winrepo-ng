libreoffice:
  {% for version in ['5.3.5.2', '5.3.6.1', '5.4.6.2', '5.4.7.2', '6.0.5.2', '6.2.7.1', '6.4.7.2', '7.0.2.2'] %}
  '{{ version }}':
    full_name: 'LibreOffice {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://downloadarchive.documentfoundation.org/libreoffice/old/{{ version }}/win/x86_64/LibreOffice_{{ version }}_Win_x64.msi'
    uninstaller: 'https://downloadarchive.documentfoundation.org/libreoffice/old/{{ version }}/win/x86_64/LibreOffice_{{ version }}_Win_x64.msi'
    {% else %}
    installer: 'https://downloadarchive.documentfoundation.org/libreoffice/old/{{ version }}/win/x86/LibreOffice_{{ version }}_Win_x86.msi'
    uninstaller: 'https://downloadarchive.documentfoundation.org/libreoffice/old/{{ version }}/win/x86/LibreOffice_{{ version }}_Win_x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
