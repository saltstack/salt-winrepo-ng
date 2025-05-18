{% load_yaml as versions -%}
# renovate: datasource=github-releases depName=pandoc packageName=jgm/pandoc
- '3.7.0.1'
- '3.7'
- '3.6.4'
- '3.6.3'
- '3.6.2'
- '3.6.1'
- '3.6'
- '3.5'
- '3.4'
- '3.3'
- '3.2.1'
- '3.2'
- '3.1.13'
- '3.1.12.3'
- '3.1.12.2'
- '3.1.12.1'
- '3.1.12'
- '3.1.11.1'
- '3.1.11'
- '3.1.10'
- '3.1.9'
- '3.1.8'
- '3.1.7'
- '3.1.6.2'
- '3.1.6.1'
- '3.1.6'
- '3.1.5'
- '3.1.4'
- '3.1.3'
- '3.1.2'
- '3.1.1'
- '3.1'
- '3.0.1'
- '3.0'
- '1.19.2.1'
- '1.17.0.2'
{% endload -%}

pandoc:
{%- for version in versions %}
  {%- set parts = version.split(".") %}
  {%- if [parts[0], parts[1]] | map('int') | list >= [2, 2]%}
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
{%- endfor %}
