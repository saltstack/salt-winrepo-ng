# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
7zip_beta:
  {% for version, dl_version in (('15.14', '1514'), ('15.13', '1513'), ('15.12', '1512'), ('15.11', '1511'), ('15.10', '1510'), ('15.09', '1509'), ('15.08', '1508'), ('15.07', '1507'), ('15.06', '1506'), ('15.05', '1505')) %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: '7-Zip {{ version }} beta x64'
    installer: 'http://heanet.dl.sourceforge.net/project/sevenzip/7-Zip/{{ version }}/7z{{ dl_version }}-x64.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: '7-Zip {{ version }} beta'
    installer: 'http://heanet.dl.sourceforge.net/project/sevenzip/7-Zip/{{ version }}/7z{{ dl_version }}.exe'
    {% endif %}
    install_flags: '/S /D="C:\Program Files\7-zip_beta"'
    uninstaller: '{{ PROGRAM_FILES }}\7-zip_beta\Uninstall.exe' 
    uninstall_flags: '/S'
    msiexec: False
    reboot: False
    locale: en_US
  {% endfor %}
