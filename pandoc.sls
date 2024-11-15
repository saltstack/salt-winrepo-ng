{%- load_yaml as versions %}
# renovate: datasource=github-releases depName=pandoc packageName=jgm/pandoc
- '1.19.2.1'
- '1.17.0.2'
{%- endload%}
pandoc:
{%- for version in versions %}
  {%- if salt["pkg.version_cmp"](version, "2.2") > 0 %}
    # Starting in version 2.2 "-x86_64" is added to the filename
    {%- set file_name = "pandoc-" ~ version ~ "-windows-x86_64.msi" %}
  {%- else %}
    {%- set file_name = "pandoc-" ~ version ~ "-windows.msi" %}
  {%- endif %}

  '{{ version }}':
    full_name: 'Pandoc {{ version }}'
    installer: 'https://github.com/jgm/pandoc/releases/download/{{ version }}/{{ file_name }}'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'https://github.com/jgm/pandoc/releases/download/{{ version }}/{{ file_name }}'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{%- endfor %}
