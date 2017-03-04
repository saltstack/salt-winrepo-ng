salt-winrepo-ng
===============

Salt Windows Software Package Manager Repo.

Documentation
-------------

Official Salt documentation provides a getting started guide.

http://docs.saltstack.com/en/latest/topics/windows/windows-package-manager.html

Contributing
-------------
Before submitting new or edits to existing sls files. Please deploy add them to your salt master and then run
`salt windows-minion-client pkg.refresh_db` which will report any errors.
