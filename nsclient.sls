nsclient:
  {% for version, file_version in [
    ('0.5.2029', '0.5.2.29'),
    ('0.5.1046', '0.5.1.46'),
    ('0.5.1044', '0.5.1.44'),
    ('0.5.0062', '0.5.0.62'),
    ('0.4.4023', '0.4.4.23'),
    ('0.4.4019', '0.4.4.19'),
    ('0.4.30143', '0.4.3.143'),
    ('0.4.3088', '0.4.3.88')
   ] %}

  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name:  'NSClient++ (x64)'
    installer: 'https://github.com/mickem/nscp/releases/download/{{ file_version }}/NSCP-{{ file_version }}-x64.msi'
    uninstaller: 'https://github.com/mickem/nscp/releases/download/{{ file_version }}/NSCP-{{ file_version }}-x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name:  'NSClient++ (x86)'
    installer: 'https://github.com/mickem/nscp/releases/download/{{ file_version }}/NSCP-{{ file_version }}-Win32.msi'
    uninstaller: 'https://github.com/mickem/nscp/releases/download/{{ file_version }}/NSCP-{{ file_version }}-Win32.msi'
    {% endif %}
    install_flags: '/quiet'
    uninstall_flags: '/quiet'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
