PLAYBOOK_DIR := tests

install_roles:
	cd $(PLAYBOOK_DIR) && ansible-galaxy install -r requirements.yml

validate:
	cd $(PLAYBOOK_DIR) && ansible-playbook --syntax-check test.yml
