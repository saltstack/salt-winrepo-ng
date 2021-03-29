{% set versions = [
                   '1.55.0', 
                   '1.54.0', 
                   '1.53.0', 
                   '1.52.0', 
                   '1.51.0', 
                   '1.50.0', 
                   '1.49.0', 
                   '1.48.0', 
                   '1.47.0', 
                   '1.46.0', 
                   '1.45.0', 
                   '1.44.0', 
                   '1.43.0', 
                   '1.42.0', 
                   '1.41.0', 
                   '1.40.1', 
                   '1.40.0',
                   '1.39.1',
                   '1.39.0',
                   '1.38.2',
                   '1.38.1',
                   '1.38.0',
                   '1.28.0', 
                   '1.27.2', 
                   '1.27.1', 
                   '1.23.3', 
                   '1.8.0', 
                   '1.7.3'
                   ] %}
atom:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Atom'
    installer: 'https://github.com/atom/atom/releases/download/v{{ version }}/AtomSetup.exe'
    install_flags: '--machine'
    uninstaller: '%AppData%\Local\atom\Update.exe'
    uninstall_flags: '--uninstall'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
