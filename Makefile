.PHONY: sync apply_local apply_remote clean_local


THIS_FILE := $(lastword $(MAKEFILE_LIST))

MASTER_BRANCH = 'master'
TEMPORARY_BRANCH = 'temporary'

m = Miscellaneous commit
COMMIT_MESSAGE = '$m'


apply_local:
#
# Use this when you want to save some changes you've made locally.
#
# #### What it does:
# 
# * Copies all local configuration files into the repository.
# * Syncs them with the latest configuration files from the server.
# * Pushes the new changes to the server.
#
# #### Usage:
#
# ```
# make {{target}}
# ```
#
# An optional commit message can be specified, for example:
#
# ```
# make {{target}} m="Modify bashrc contents"
# ```
#
# #### Notes:
#
# * If your local changes conflict with any new ones from upstream, you
#   can resolve the conflicts with git.
#
	@$(MAKE) -f $(THIS_FILE) __sync
	git push

apply_remote:
#
# Use this to fetch the latest changes from the internet.
#
# ```
# make {{target}}
# ```
#
# #### What it does:
# * Fetches latest changes from server.
# * Syncs them with any local changes.
# * Copies the latest files to your local machine.
#
	@$(MAKE) -f $(THIS_FILE) __sync
	@$(MAKE) -f $(THIS_FILE) __overwrite_local_configurations

update_tools:
#
# Use this to obtain updates to the repository without
# overwriting or updating any local changes.
#
# ```
# make {{target}}
# ```
#
	@$(MAKE) -f $(THIS_FILE) __get_latest_changes

clean_local:
#
# Use this to overwrite any local changes with the contents
# of the repository. This will not fetch any new changes
# from the server.
#
# ```
# make {{target}}
# ```
#
	@$(MAKE) -f $(THIS_FILE) __overwrite_local_configurations

__get_latest_changes:
	git checkout $(MASTER_BRANCH)
	git pull

__sync:
	# Get the latest tools before syncing
	@$(MAKE) -f $(THIS_FILE) update_tools
	@$(MAKE) -f $(THIS_FILE) __perform_sync

__perform_sync:
	@$(MAKE) -f $(THIS_FILE) __get_latest_changes

	# Create temporary branch
	if git show-ref --quiet refs/heads/$(TEMPORARY_BRANCH); then git branch -d $(TEMPORARY_BRANCH); fi
	git checkout -b $(TEMPORARY_BRANCH)

	# Apply local changes to temporary branch
	python tools/update_repository.py
	git add .
	git commit -am $(COMMIT_MESSAGE)

	# Merge temporary branch into main branch
	git checkout $(MASTER_BRANCH)
	git merge $(TEMPORARY_BRANCH)
	git branch -d $(TEMPORARY_BRANCH)

__overwrite_local_configurations:
	cd configurations; cp -af . ~
