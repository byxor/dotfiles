# configurations

A collection of configuration files for various programs I use.

You can fork this repository and use it as manager for _your own_ configuration files, should you so wish.

Just empty the `configurations` folder and modify the `files_to_save` file with whatever you want to synchronise.

## Applying changes from remote repository to PC

```bash
$ make apply_remote
```

## Applying local changes to remote repository

To bring the repository up-to-date with your current configurations, run:

```bash
$ make apply_local
```

This will back-up everything listed in `files_to_save` into the repository's `configurations` directory.

You can also provide an optional description of the configuration changes, for example:

```bash
$ make apply_local message='"Update emacs hotkeys"'
```

## Assumptions

Currently, some assumptions are baked into the code. Rather than being silent about them, I will list them here; they might affect you.

Here are some I can think of:

* Your configuration files will be installed into your home directory (cross-platform, I believe).
* You have python installed (for running the synchronisation script).

My configuration files are heavily dependent on linux, but this should only be a problem if you want to use my configuration files on a non-linux OS.
