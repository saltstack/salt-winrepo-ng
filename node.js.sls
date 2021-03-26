node.js:
  {% for version in ['15.2.0', '15.0.1', '14.13.1', '13.1.0', '12.6.0', '12.0.0', '11.14.0', '10.15.3', '9.11.2', '8.16.0', '8.8.1', '7.10.1', '7.0.0'] %}
  '{{ version }}':
    full_name: 'Node.js'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://nodejs.org/dist/v{{ version }}/node-v{{ version }}-x64.msi'
    uninstaller: 'https://nodejs.org/dist/v{{ version }}/node-v{{ version }}-x64.msi'
    {% else %}
    installer: 'https://nodejs.org/dist/v{{ version }}/node-v{{ version }}-x86.msi'
    uninstaller: 'https://nodejs.org/dist/v{{ version }}/node-v{{ version }}-x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
