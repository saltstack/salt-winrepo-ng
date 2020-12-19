salt-winrepo-ng
===============

Salt Windows Software Package Manager Repo.

Documentation
-------------

Official Salt documentation provides a getting started guide.

<http://docs.saltstack.com/en/latest/topics/windows/windows-package-manager.html>

Contributing
-------------

Before submitting new or edits to existing sls files. Please deploy them to
your salt master and then run `salt windows-minion-client pkg.refresh_db`
against a minion on 2016.11 or newer. Ensure no errors are reported.

pre-commit
----------

[pre-commit](https://pre-commit.com/) is configured for this repository, which
you may use to ease the steps involved in submitting your changes.
First install  the `pre-commit` package manager using the appropriate
[method](https://pre-commit.com/#installation), then run `pre-commit install`
and now `pre-commit` will run automatically on each `git commit`.

```bash
git clone --origin upstream https://github.com/saltstack/salt-winrepo-ng.git
cd salt-winrepo-ng
pre-commit install
```
