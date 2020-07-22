{% set versions = [('3.2',  'dl2'),
                   ('3.1.2', 'dl')] %}
sumatrapdf:
  {% for version, path in versions %}
  '{{ version }}':
    full_name: 'SumatraPDF'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://www.sumatrapdfreader.org/{{ path }}/SumatraPDF-{{ version }}-64-install.exe'
    {% else  %}
    installer: 'https://www.sumatrapdfreader.org/{{ path }}/SumatraPDF-{{ version }}-install.exe'
    {% endif %}
    install_flags: '/s /opt'
    uninstaller: '%ProgramFiles%\SumatraPDF\uninstall.exe'
    uninstall_flags: '/s'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
