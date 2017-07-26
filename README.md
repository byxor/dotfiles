# configurations

A collection of configuration files for various programs I use.

## Installation

```
(repository ---[configs]---> yourComputer)
```

* Copy the contents of the `configuration` directory into your home directory.

## Synchronisation

```
(repository <---[configs]--- yourComputer)
```

To bring the repository up-to-date with your current configurations, run:

```bash
$ python3 update_repository.py
```

This will back-up everything listed in `files_to_save` into the repository's `configurations` directory.