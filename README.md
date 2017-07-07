# HTTPS Proxy Role for Ansible

A brief description of the role goes here.

## Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

## Role Variables

Required variables:

* `external_hostname` - the external URL of this proxy
* `upstream_origin` - the internal hostname + port (if not 80) being proxied to

## Dependencies

* [`geerlingguy.nginx`](https://galaxy.ansible.com/geerlingguy/nginx/)
* [`geerlingguy.repo-epel`](https://galaxy.ansible.com/geerlingguy/repo-epel/)
* [`jdauphant.ssl-certs`](https://galaxy.ansible.com/jdauphant/ssl-certs/)

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- hosts: servers
  roles:
     - { role: username.rolename, x: 42 }
```

## License

CC0
