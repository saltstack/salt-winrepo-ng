# NOTE: If the lazarus installation directory exists the installation will
#       pop up a dialog box. This will cause the minion to hang because it
#       is waiting for the user to click continue on a dialog box that will
#       never be seen. So, before running this, make sure the lazarus
#       installation directory is not present.
#       If doing an upgrade that means you'll have to do something like the
#       following:
#       pkg.remove lazarus
#       file.remove c:\lazarus
#       pkg.install lazarus

{% set versions = [('1.8.0', '3.0.4'),
                   ('1.6.4', '3.0.2')] %}
lazarus:
  {% for version, fpc_version in versions %}
  '{{ version }}':
    full_name: Lazarus {{ version }}
    {% if salt.grains.get('cpuarch') == 'AMD64' %}
    installer: https://downloads.sourceforge.net/project/lazarus/Lazarus%20Windows%2064%20bits/Lazarus%20{{ version }}/lazarus-{{ version }}-fpc-{{ fpc_version }}-win64.exe
    {% else %}
    installer: https://downloads.sourceforge.net/project/lazarus/Lazarus%20Windows%2032%20bits/Lazarus%20{{ version }}/lazarus-{{ version }}-fpc-{{ fpc_version }}-win32.exe
    {% endif %}
    install_flags: /SP- /VERYSILENT /NORESTART /SUPPRESSMSGBOXES
    uninstaller: C:\\lazarus\\unins000.exe
    uninstall_flags: /VERYSILENT /NORESTART /SUPPRESSMSGBOXES
  {% endfor %}
