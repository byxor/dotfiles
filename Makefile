.PHONY: apply_local apply_remote

apply_local:
	python update_repository.py
	git add configurations
	git commit -am "Add new configuration changes"
	git push

apply_remote:
	git pull && cd configurations && cp -af . ~
