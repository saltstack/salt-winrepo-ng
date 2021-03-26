nsclient:
  {% for split_version in [
    ['0.5.3', '4'],
    ['0.5.2', '39'],
    ['0.5.2', '29'],
    ['0.5.1', '46'],
    ['0.5.1', '44'],
    ['0.5.0', '62'],
    ['0.4.4', '23'],
    ['0.4.4', '19'],
    ['0.4.3', '143'],
    ['0.4.3', '88']
   ] %}

  {% if split_version[0][2] > '4' %} # versions prior to 0.5.xxxx had 3 dots
    {% set version = "0".join(split_version) %}
  {% else %}
    {% set version = ".".join(split_version) %}
  {% endif %}
  {% set file_version = ".".join(split_version) %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name:  'NSClient++ (x64)'
    installer: 'https://github.com/mickem/nscp/releases/download/{{ file_version }}/NSCP-{{ file_version }}-x64.msi'
    uninstaller: 'https://github.com/mickem/nscp/releases/download/{{ file_version }}/NSCP-{{ file_version }}-x64.msi'
    {% else %}
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
