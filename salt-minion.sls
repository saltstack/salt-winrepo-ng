# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This software definition will only work in versions of Salt newer than
# 2015.8.2. In version 2015.8.2 we added the `use_scheduler` option which
# allowed us to launch the installer using the Windows task manager.
# This option is not available in earlier versions of Salt. So, while this
# software definition will allow you to install versions of Salt older than
# 2015.8.2 you will not be able to use pkg.install to upgrade Salt again. You
# will have to upgrade Salt through another means.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{%- set install_dir = salt["reg.read_value"]("HKLM", "SOFTWARE\\Salt Project\\Salt", "install_dir").vdata %}
{%- set install_dir = install_dir or "C:\\salt" %}

# Starting in Version 3006 salt standardized builds across all OSes on the
# Relative Environment for Python project (relenv). The url changed as a result
# Use Renovate to apply automatic version updates. Due to the way Renovate works
# each major version must be updated separately (otherwise all versions would be
# updated to the latest version). New major versions e.g. 3008.0 must be added manually.
{%- load_yaml as relenv_versions %}
# renovate: datasource=github-tags depName=salt-3007.x packageName=saltstack/salt
- '3007.5'
- '3007.4'
- '3007.3'
- '3007.2'
- '3007.1'
- 3007.0
# renovate: datasource=github-tags depName=salt-3006.x packageName=saltstack/salt
- '3006.14'
- '3006.13'
- '3006.12'
- '3006.11'
- '3006.10'
- '3006.9'
- 3006.8
- 3006.7
- 3006.6
{%- endload %}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Versions of Salt that contain CVE's have been moved to an archive at:
# archive.repo.saltstack.com/windows. The ability to install those versions
# using winrepo has been removed.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# Additionally, as of 2024-10-30 packages are no longer hosted on AWS. As part
# of the migration, only the latest 2 major versions are available for
# download.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{%- load_yaml as remove_only_versions %}
- 3006.5
- 3006.4
- 3006.3
- 3006.2
- 3006.1
- 3006.0
- 3005.5
- 3005.4
- 3005.3
- 3005.2
- 3005.1-5
- 3005.1-4
- 3005.1-3
- 3005.1-2
- 3005.1-1
- 3005.1
- 3004.2-1
- 3003.5-1
- 3002.9-1
- 3004.1-1
- 3004-3
- 3004-2
- 3004
- 3003.4-1
- 3003.3
- 3003.2
- 3003.1
- 3003
- 3002.8-1
- 3002.7
- 3002.6
- 3002.5
- 3002.4
- 3002.3
- 3002.2
- 3002.1
- 3002
- 3001.8
- 3001.7
- 3001.6
- 3001.5
- 3001.4
- 3001.2
- 3001.1
- 3001
- 3000.9
- 3000.8
- 3000.7
- 3000.6
- 3000.4
- 3000.3
- 3000.2
- 3000.1
- 3000
- 2019.2.8
- 2019.2.6
- 2019.2.5
- 2019.2.4
- 2019.2.3
- 2019.2.2
- 2019.2.1
- 2019.2.0
- 2018.3.5
- 2018.3.4
- 2018.3.3
- 2018.3.2
- 2018.3.1
- 2018.3.0
- 2017.7.8
- 2017.7.7
- 2017.7.6
- 2017.7.5
- 2017.7.4
- 2017.7.3
- 2017.7.2
- 2017.7.1
- 2017.7.0
{%- endload %}

salt-minion-py3:
  # RELENV VERSIONS
  {%- for version in relenv_versions %}
  '{{ version }}':
    full_name: 'Salt Minion {{ version }} (Python 3)'
    {% if grains['cpuarch'] == 'AMD64' -%}
    installer: 'https://packages.broadcom.com/artifactory/saltproject-generic/windows/{{ version }}/Salt-Minion-{{ version }}-Py3-AMD64-Setup.exe'
    {% else -%}
    installer: 'https://packages.broadcom.com/artifactory/saltproject-generic/windows/{{ version }}/Salt-Minion-{{ version }}-Py3-x86-Setup.exe'
    {% endif -%}
    {% raw -%}
    # install_flags: "/S /master={{ salt['pillar.get']('salt:master', 'salt.domain.tld') }} /minion-id={{ salt['pillar.get']('salt:minion:ids:' ~ grains['host'] }}"
    {% endraw -%}
    install_flags: '/S'
    uninstaller: '{{ install_dir }}\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    use_scheduler: True
    reboot: False
  {% endfor -%}

  # REMOVE ONLY VERSIONS (CVE, Unsupported, Missing Artifacts)
  {%- for version in remove_only_versions %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'Salt Minion {{ version }} (Python 3)'
    uninstaller: '{{ install_dir }}\uninst.exe'
    uninstall_flags: '/S'
    use_scheduler: True
  {% endfor -%}
