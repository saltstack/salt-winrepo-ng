# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" -%}
blender:
  '2.78':
    full_name: 'Blender'
    {% if grains['cpuarch'] == 'AMD64' -%}
    installer: 'https://ftp.nluug.nl/pub/graphics/blender/release/Blender2.78/blender-2.78-windows64.msi'
    {% else -%}
    installer: 'https://ftp.nluug.nl/pub/graphics/blender/release/Blender2.78/blender-2.78-windows32.msi'
    {% endif -%}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True

# Note: Since April/May 2021, installer name has changed slightly (windows64 -> windows-x64).
# Note2: Newer versions of Blender do not provide 32-bit installers anymore.
  {% for version, patches in [
                          ('4.0', ['2', '1', '0']),
                          ('3.6', ['9', '8', '7', '5', '4', '3', '2', '1', '0']),
                          ('3.3', ['16', '15', '14', '12', '11', '10', '9', '8', '7', '6', '5', '4', '3', '2', '1', '0']),
                          ('2.93', ['14', '13', '12', '11', '10', '9', '8', '7', '6', '5', '4', '3', '2', '1', '0']),
                          ('2.83', ['18', '17', '16', '15', '14'])
                          ] %}
  {%   for patch in patches %}
  '{{ version }}.{{ patch }}':
    full_name: 'blender'
    installer: 'https://ftp.nluug.nl/pub/graphics/blender/release/Blender{{version}}/blender-{{version}}.{{patch}}-windows-x64.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
  {%   endfor %}
  {% endfor %}
