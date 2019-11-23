node.js-lts:
  {% for version in ['12.13.1', '10.16.0', '10.15.3', '8.16.0', '6.17.1', '6.11.3', '6.9.1'] %}
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
