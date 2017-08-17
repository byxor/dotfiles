.PHONY: apply_local apply_remote

apply_local:
	python update_repository.py

apply_remote:
	git pull && cd configurations && cp -af . ~
