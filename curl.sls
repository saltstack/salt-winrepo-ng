# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
curl:
  '7.46.0':
    full_name: 'cURL'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/curl/curl-7.46.0-win64.msi'
    uninstaller: 'salt://win/repo-ng/curl/curl-7.46.0-win64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/curl/curl-7.46.0-win32.msi'
    uninstaller: 'salt://win/repo-ng/curl/curl-7.46.0-win32.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '7.45.0':
    full_name: 'cURL'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/curl/curl-7.45.0-win64.msi'
    uninstaller: 'salt://win/repo-ng/curl/curl-7.45.0-win64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/curl/curl-7.45.0-win32.msi'
    uninstaller: 'salt://win/repo-ng/curl/curl-7.45.0-win32.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '7.44.0':
    full_name: 'cURL'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/curl/curl-7.44.0-win64.msi'
    uninstaller: 'salt://win/repo-ng/curl/curl-7.44.0-win64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/curl/curl-7.44.0-win32.msi'
    uninstaller: 'salt://win/repo-ng/curl/curl-7.44.0-win32.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '7.43.0':
    full_name: 'cURL'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/curl/curl-7.43.0-win64.msi'
    uninstaller: 'salt://win/repo-ng/curl/curl-7.43.0-win64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/curl/curl-7.43.0-win32.msi'
    uninstaller: 'salt://win/repo-ng/curl/curl-7.43.0-win32.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '7.40.0':
    full_name: 'cURL'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/curl/curl-7.40.0-win64.msi'
    uninstaller: 'salt://win/repo-ng/curl/curl-7.40.0-win64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/curl/curl-7.40.0-win32.msi'
    uninstaller: 'salt://win/repo-ng/curl/curl-7.40.0-win32.msi'
    {% endif %}
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
#
# You need to download the win64 msi from website (Captcha protected) and place in your winrepo-ng on master
# http://www.confusedbycode.com/curl/#downloads
# Note: 'curl' is also a standard powershell alias as of at least .NET 4.0 for Invoke-WebRequest,
# so you might not be calling the right 'curl'
