{% if grains['cpuarch'] == 'AMD64' %}
    {% set cpuarch = "x64" %}
{% else %}
    {% set cpuarch = "x86" %}
{% endif %}
{% if grains['osrelease'] == '2008ServerR2' %}
    {% set osrelease = "2008r2" %}
{% elif grains['osrelease'] == '2008Server' %}
    {% set osrelease = "2008" %}
{% elif grains['osrelease'] == '2012ServerR2' %}
    {% set osrelease = "2012r2" %}
{% elif grains['osrelease'] == '2012Server' %}
    {% set osrelease = "2012" %}
{% elif grains['osrelease'] == '2016Server' %}
    {% set osrelease = "2016" %}
{% endif %}
sensu:
  {% for version in ['1.4.2',
                     '1.0.2',
                     '0.28.4',
                     '0.26.5',
                     '0.26.3',
                     '0.25.3'] %}
  '{{ version }}':
    full_name: 'Sensu'
    installer: 'http://sensu.global.ssl.fastly.net/msi/{{ osrelease }}/sensu-{{ version }}-1-{{ cpuarch }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'http://sensu.global.ssl.fastly.net/msi/{{ osrelease }}/sensu-{{ version }}-1-{{ cpuarch }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}