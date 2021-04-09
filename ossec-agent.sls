# just 32-bit x86 installer available

{% set source_path = 'https://updates.atomicorp.com/channels/atomic/windows/' %}

{% if grains['cpuarch'] == 'AMD64' %}
    {% set program_files = "%ProgramFiles(x86)%" %}
{% else %}
    {% set program_files = "%ProgramFiles%" %}
{% endif %}

{% set versions = {
'3.6.0':['14954'],
'3.6.0':['14066'],
'3.6.0':['12032'],
'3.6.0':['12030'],
'3.6.0':['11279'],
'3.5.0':['10635'],
'3.4.0':['9608'],
'3.3.0':['8264'],
'3.2.0':['6132'],
'3.1.0':['5732'],
'3.0.1':['5667'],
'3.0.0':['5609'],
'2.9.4':['5177'],
'2.9.3':['4466'],
'2.9.2':['2760'],
'2.9.0':['2017'],
} %}

ossec-agent:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{ major }}':
    full_name: 'OSSEC HIDS {{ major }}'
    installer: '{{ source_path }}ossec-agent-win32-{{ major }}-{{ minor }}.exe'
    install_flags: '/S'
    uninstaller: '{{ program_files }}\ossec-agent\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}
#

