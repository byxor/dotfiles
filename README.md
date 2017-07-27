# configurations

A collection of configuration files for various programs I use.

## Installation (from repo to PC)

Copy the contents of the `configuration` directory into your home directory.

e.g.
```
$ cp -af repositoryRoot/configurations ~
```

## Synchronisation (from PC to Repo)

To bring the repository up-to-date with your current configurations, run:

```bash
$ python3 update_repository.py
```

This will back-up everything listed in `files_to_save` into the repository's `configurations` directory.