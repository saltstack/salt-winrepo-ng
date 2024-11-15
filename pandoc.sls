{%- load_yaml as versions %}
# renovate: datasource=github-releases depName=pandoc packageName=jgm/pandoc
- 1.17.0.2
{%- endload%}
pandoc:
  {%- for version in versions %}
  '{{ version }}':
    full_name: 'Pandoc {{ version }}'
    installer: 'https://github.com/jgm/pandoc/releases/download/{{ version }}/pandoc-{{ version }}-windows.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'https://github.com/jgm/pandoc/releases/download/{{ version }}/pandoc-{{ version }}-windows.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {%- endfor %}
