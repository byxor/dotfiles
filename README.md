# configurations

A collection of configuration files for various programs I use.

You can fork this repository and use it as manager for _your own_ configuration files, should you so wish.

Just empty the `configurations` folder and modify the `files_to_save` file with whatever you want to synchronise.

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

## Assumptions

Currently, some assumptions are baked into the code. Rather than being silent about them, I will list them here; they might affect you.

Here are some I can think of:

* You're running linux.
* Your configuration files will be installed into your home directory.
* You're using bash as your primary shell.
* You have python installed (for running the synchronisation script).