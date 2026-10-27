# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This software definition will only work in versions of Salt newer than
# 2015.8.2. In version 2015.8.2 we added the `use_scheduler` option which
# allowed us to launch the installer using the Windows Task Scheduler.
# This option is not available in earlier versions of Salt. So, while this
# software definition will allow you to install versions of Salt older than
# 2015.8.2 you will not be able to use pkg.install to upgrade Salt again. You
# will have to upgrade Salt through another means.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{% set arch = salt["grains.get"]("cpuarch") -%}
{% set install_dir = salt["reg.read_value"]("HKLM", "SOFTWARE\\Salt Project\\Salt", "install_dir").vdata -%}
{% set install_dir = install_dir or "C:\\salt" -%}

# Starting with version 3006 Salt standardized builds across all OSes on the
# Relative Environment for Python project (relenv) (https://github.com/saltstack/relenv).
#
# Use Renovate to apply automatic version updates. Due to the way Renovate works
# each release branch must be updated separately (otherwise all versions would be
# updated to the very latest version).
# New major versions e.g. 3009.0 must be added manually along with the appropriate
# Renovate comment line.
{% load_yaml as x64_only_versions -%}
# renovate: datasource=github-tags depName=salt-3008.x packageName=saltstack/salt
- '3008.5'
- '3008.4'
- '3008.3'
{% endload -%}

{% load_yaml as relenv_versions -%}
- '3008.2'
- '3008.1'
- '3008.0'
# renovate: datasource=github-tags depName=salt-3007.x packageName=saltstack/salt
- '3007.17'
- '3007.16'
- '3007.15'
- '3007.14'
- '3007.13'
- '3007.12'
- '3007.11'
- '3007.10'
- '3007.9'
- '3007.8'
- '3007.7'
- '3007.6'
- '3007.5'
- '3007.4'
- '3007.3'
- '3007.2'
- '3007.1'
- '3007.0'
# renovate: datasource=github-tags depName=salt-3006.x packageName=saltstack/salt
- '3006.30'
- '3006.29'
- '3006.28'
- '3006.27'
- '3006.26'
- '3006.25'
- '3006.24'
- '3006.23'
- '3006.22'
- '3006.21'
- '3006.20'
- '3006.19'
- '3006.18'
- '3006.17'
- '3006.16'
- '3006.15'
- '3006.14'
- '3006.13'
- '3006.12'
- '3006.11'
- '3006.10'
- '3006.9'
- '3006.8'
- '3006.7'
- '3006.6'
{% endload -%}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# As of 2024-10-30 packages are no longer hosted on AWS. As part
# of the migration, only installers for versions v3006.6 and later are
# available for download from Broadcom's Artifactory.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{% load_yaml as remove_only_versions -%}
- '3006.5'
- '3006.4'
- '3006.3'
- '3006.2'
- '3006.1'
- '3006.0'
- '3005.5'
- '3005.4'
- '3005.3'
- '3005.2'
- '3005.1-5'
- '3005.1-4'
- '3005.1-3'
- '3005.1-2'
- '3005.1-1'
- '3005.1'
- '3004.2-1'
- '3003.5-1'
- '3002.9-1'
- '3004.1-1'
- '3004-3'
- '3004-2'
- '3004'
- '3003.4-1'
- '3003.3'
- '3003.2'
- '3003.1'
- '3003'
- '3002.8-1'
- '3002.7'
- '3002.6'
- '3002.5'
- '3002.4'
- '3002.3'
- '3002.2'
- '3002.1'
- '3002'
- '3001.8'
- '3001.7'
- '3001.6'
- '3001.5'
- '3001.4'
- '3001.2'
- '3001.1'
- '3001'
- '3000.9'
- '3000.8'
- '3000.7'
- '3000.6'
- '3000.4'
- '3000.3'
- '3000.2'
- '3000.1'
- '3000'
- '2019.2.8'
- '2019.2.6'
- '2019.2.5'
- '2019.2.4'
- '2019.2.3'
- '2019.2.2'
- '2019.2.1'
- '2019.2.0'
- '2018.3.5'
- '2018.3.4'
- '2018.3.3'
- '2018.3.2'
- '2018.3.1'
- '2018.3.0'
- '2017.7.8'
- '2017.7.7'
- '2017.7.6'
- '2017.7.5'
- '2017.7.4'
- '2017.7.3'
- '2017.7.2'
- '2017.7.1'
- '2017.7.0'
{% endload -%}

{% set arch_specific_versions = {"AMD64": x64_only_versions + relenv_versions, "x86": relenv_versions} -%}

salt-minion-py3:
  # RELENV VERSIONS
  {%- for version in arch_specific_versions[arch] %}
  '{{ version }}':
    full_name: Salt Minion {{ version }} (Python 3)
    installer: https://packages.broadcom.com/artifactory/saltproject-generic/windows/{{ version }}/Salt-Minion-{{ version }}-Py3-{{ arch }}-Setup.exe
    install_flags: /S
    uninstaller: '{{ install_dir }}\uninst.exe'
    uninstall_flags: /S
    use_scheduler: true
  {% endfor -%}

  # REMOVE ONLY VERSIONS (CVE, Unsupported, Missing Artifacts)
  {%- for version in remove_only_versions %}
  '{{ version }}':
    skip_urltest: true
    full_name: Salt Minion {{ version }} (Python 3)
    uninstaller: '{{ install_dir }}\uninst.exe'
    uninstall_flags: /S
    use_scheduler: true
  {% endfor -%}
