# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
{% set VERSIONS  = ['3.1.15',
                    '3.1.14',
                    '3.1.13',
                    '3.1.12',
                    '3.1.11',
                    '3.1.10',
                    '3.1.9',
                    '3.1.8',
                    '3.1.7',
                    '3.1.6',
                    '3.1.5',
                    '3.1.4',
                    '3.1.3',
                    '3.1.2',
                    '3.1.1',
                    '3.1.0',
                    '3.0.3',
                    '3.0.2',
                    '3.0.1',
                    '3.0.0', 
                    '2.3.4', 
                    '2.3.3', 
                    '2.3.2', 
                    '2.3.1', 
                    '2.3.0', 
                    '2.2.4'] %}
gpg4win:
  {% for VERSION in VERSIONS %}
  {{ VERSION }}:
    full_name: 'Gpg4win ({{ VERSION }})'
    installer: 'http://files.gpg4win.org/gpg4win-{{ VERSION }}.exe'
    install_flags: '/S /C=C:\salt\var\cache\salt\minion\files\base\win\repo-ng\salt-winrepo-ng\gpg4win\silent.ini'
    uninstaller: '{{ PROGRAM_FILES }}\gpg4win\gpg4win-uninstall.exe'
    uninstall_flags: '/S'
    cache_file: salt://win/repo-ng/salt-winrepo-ng/gpg4win/silent.ini
    msiexec: False
    reboot: False
  {% endfor %}
