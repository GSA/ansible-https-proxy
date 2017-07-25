# HTTPS Proxy Role for Ansible [![CircleCI](https://circleci.com/gh/GSA/ansible-https-proxy.svg?style=svg)](https://circleci.com/gh/GSA/ansible-https-proxy)

Ansible role to set up nginx as a secure proxy. The primary use case is HTTPS termination for another service that can't do so on its own.

## Requirements

None.

## Role variables

Required variables:

* `external_hostname` - the external URL of this proxy
* `upstream_origin` - the internal hostname + port (if not 80) being proxied to
* [SSL configuration](https://github.com/jdauphant/ansible-role-ssl-certs#examples)
    * Storing [key data](https://github.com/jdauphant/ansible-role-ssl-certs#example-to-deploy-a-ssl-certificate-stored-in-variables) in a Vault is the recommended approach, though you can use the other options.

## Dependencies

* [`geerlingguy.nginx`](https://galaxy.ansible.com/geerlingguy/nginx/)
* [`geerlingguy.repo-epel`](https://galaxy.ansible.com/geerlingguy/repo-epel/)
* [`jdauphant.ssl-certs`](https://galaxy.ansible.com/jdauphant/ssl-certs/)

## Example usage

```yaml
# requirements.yml
- name: gsa.https-proxy
  src: https://github.com/GSA/ansible-https-proxy

# group_vars/https_proxy/vars.yml
external_hostname: secure.site.gov
upstream_origin: 127.0.0.1:8080
ssl_certs_local_cert_data: "{{ vault_ssl_certs_local_cert_data }}"
ssl_certs_local_privkey_data: "{{ vault_ssl_certs_local_privkey_data }}"

# group_vars/https_proxy/vault.yml (encrypted)
vault_ssl_certs_local_cert_data: |
  -----BEGIN CERTIFICATE-----
  ...
  -----END CERTIFICATE-----
vault_ssl_certs_local_privkey_data: |
  -----BEGIN RSA PRIVATE KEY-----
  ...
  -----END RSA PRIVATE KEY-----

# playbooks/https_proxy.yml
- hosts: https_proxy
  become: true
  roles:
    - gsa.https-proxy
```

## License

CC0
