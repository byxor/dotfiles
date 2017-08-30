.PHONY: sync apply_local apply_remote clean_local

THIS_FILE := $(lastword $(MAKEFILE_LIST))
MASTER_BRANCH = 'master'
TEMPORARY_BRANCH = 'temporary'
m = 'Miscellaneous commit'
COMMIT_MESSAGE = m

apply_local:
	@$(MAKE) -f $(THIS_FILE) __sync
	git push

apply_remote:
	@$(MAKE) -f $(THIS_FILE) __sync
	@$(MAKE) -f $(THIS_FILE) __overwrite_local_configurations

clean_local:
	@$(MAKE) -f $(THIS_FILE) __overwrite_local_configurations

__sync:
	# Get latest changes in master
	git checkout $(MASTER_BRANCH)
	git pull

	# Create temporary branch
	if git show-ref --quiet refs/heads/$(TEMPORARY_BRANCH); then git branch -d $(TEMPORARY_BRANCH); fi
	git checkout -b $(TEMPORARY_BRANCH)

	# Apply local changes to temporary branch
	python update_repository.py
	git add configurations
	git commit -am $(COMMIT_MESSAGE)

	# Merge temporary branch into master
	git checkout $(MASTER_BRANCH)
	git merge $(TEMPORARY_BRANCH)
	git branch -d $(TEMPORARY_BRANCH)

__overwrite_local_configurations:
	cd configurations; cp -af . ~
