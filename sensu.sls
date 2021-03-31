#
# https://docs.sensu.io/sensu-core/latest/
# IMPORTANT: Sensu Core reached end-of-life (EOL) on December 31, 2019, more than 8 years after its inception as an open source software project, 
# and we permanently removed the Sensu EOL repository on February 1, 2021.
#
# To migrate to Sensu Go, read Migrate from Sensu Core and Sensu Enterprise to Sensu Go.
#

#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Sensu that have had the installer assets removed from sensu.io.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` - if you want/need to remove them you need 
# to find the msi GUID and feed it to msiexec /x to uninstall manually 
# or look for the msi on the internet wayback machine archive. 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
{% else %}
    {% set osrelease = "2012r2" %}
{% endif %}
sensu:
  {% for version in ['1.4.2',
                     '1.0.2',
                     '0.28.4',
                     '0.26.5',
                     '0.26.3',
                     '0.25.3'] %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'Sensu'
    #installer: 'http://sensu.global.ssl.fastly.net/msi/{{ osrelease }}/sensu-{{ version }}-1-{{ cpuarch }}.msi'
    #install_flags: '/qn /norestart'
    uninstaller: 'http://sensu.global.ssl.fastly.net/msi/{{ osrelease }}/sensu-{{ version }}-1-{{ cpuarch }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
