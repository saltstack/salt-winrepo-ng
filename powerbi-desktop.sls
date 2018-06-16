### NOTE: You must accept the PowerBI Desktop EULA by setting the
### Pillar key `powerbi:desktop:accept_eula` to `True` in order to
### install this package.  You can find a copy of the EULA at
### https://powerbi.microsoft.com/en-us/desktop-eula/.

powerbi-desktop:
  ## version 4.0.1 - https://www.microsoft.com/en-us/download/details.aspx?id=45331
  '2.59.5135.421': &powerbi-desktop
    full_name:
      {{ 'Microsoft PowerBI Desktop%s'|format(' (x64)' if salt['grains.get']('cpuarch') == 'AMD64' else '')|yaml_encode }}
    installer: &msi401
      {{ 'https://download.microsoft.com/download/9/B/A/9BAEFFEF-1A68-4102-8CDF-5D28BFFE6A61/PBIDesktop%s.msi'|format('_x64' if salt['grains.get']('cpuarch') == 'AMD64' else '')|yaml_encode }}
    install_flags: &flags
      /qn
      /norestart
      ACCEPT_EULA={{
        '1' if salt['pillar.get']('powerbi:desktop:accept_eula', False) else
        '0' }}
    uninstaller: *msi401
    uninstall_flags: *flags
    msiexec: True
    reboot: False
