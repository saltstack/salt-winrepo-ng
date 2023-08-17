rSync Git Package Definition
============================

rSync is an optional tool in msys2. A standard git installation contains the
standard msys2 tools. Optional tools can be downloaded and placed in the
``usr\bin`` directory in the git installation. Therefore, this package
definition depends on an existing git installation of at least version
2.41.0.3.

Additionally, the rSync package itself is a ``tar.zst`` file and cannot be
unzipped natively in Windows. It requires a tool like 7-zip with Z-Standard
support, such as https://github.com/mcmilk/7-Zip-zstd. Therefore, this package
depends on an existing 7-zip-zstd installation.

```yaml
install_rsync_deps:
  pkg.installed:
    - pkgs:
      - 7zip-zstd
      - git: 2.41.0.3

install_rsync-git:
  pkg.installed:
    - name: rsync-git
    - require:
        - pkg: install_rsync_deps
```
