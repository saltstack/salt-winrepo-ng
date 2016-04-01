zeal:
  {% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
    {% set arch = "win64" %}
  {% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
    {% set arch = "win32" %}
  {% endif %}
  {% for version in '0.2.1' %}
  '{{ version }}':
    full_name: 'Zeal {{ version }} x86 {{grains['locale_info']['defaultlanguage']}})'
    installer: 'https://bintray.com/artifact/download/zealdocs/windows/zeal-{{version}}-windows-x86.msi'
    install_flags: '/quiet'
    uninstaller: 'https://bintray.com/artifact/download/zealdocs/windows/zeal-{{version}}-windows-x86.msi'
    uninstall_flags: '/uninstall /quiet'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  {% endfor %}

