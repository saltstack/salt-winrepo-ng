# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
blender:
  '2.78':
    full_name: 'Blender'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://ftp.nluug.nl/pub/graphics/blender/release/Blender2.78/blender-2.78-windows64.msi'
    uninstaller: 'https://ftp.nluug.nl/pub/graphics/blender/release/Blender2.78/blender-2.78-windows64.msi'
    {% else %}
    installer: 'https://ftp.nluug.nl/pub/graphics/blender/release/Blender2.78/blender-2.78-windows32.msi'
    uninstaller: 'https://ftp.nluug.nl/pub/graphics/blender/release/Blender2.78/blender-2.78-windows32.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False

# Note: Since April/May 2021, installer name has changed slightly (windows64 -> windows-x64).
# Note2: Newer versions of Blender do not provide 32-bit installers anymore.
{% for version, patch in [('3.3', '3'),
                          ('3.3', '2'),
                          ('3.3', '1'),
                          ('3.3', '0'),
                          ('2.93', '14'),
                          ('2.93', '13'),
                          ('2.93', '12'),
                          ('2.93', '11'),
                          ('2.93', '10'),
                          ('2.93', '9'),
                          ('2.93', '8'),
                          ('2.93', '7'),
                          ('2.93', '6'),
                          ('2.93', '5'),
                          ('2.93', '4'),
                          ('2.93', '3'),
                          ('2.93', '2'),
                          ('2.93', '1'),
                          ('2.93', '0'),
                          ('2.83', '18'),
                          ('2.83', '17'),
                          ('2.83', '16'),
                          ('2.83', '15'),
                          ('2.83', '14')] %}
  '{{ version }}.{{ patch }}':
    full_name: 'blender'
    installer: 'https://ftp.nluug.nl/pub/graphics/blender/release/Blender{{version}}/blender-{{version}}.{{patch}}-windows-x64.msi'
    uninstaller: 'https://ftp.nluug.nl/pub/graphics/blender/release/Blender{{version}}/blender-{{version}}.{{patch}}-windows-x64.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
