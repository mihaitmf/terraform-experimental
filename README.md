# Terraform experimental project
Getting started with terraform

## Quick start
1. Create a copy of the `config.yml.dist` file with the name `config.yml` and set your desired properties 
(ex: project name, project root path, git user name and email etc.) 
1. Run `vagrant up`
1. Terraform should be installed: `terraform --version`

### Git config
Git user **name** and **email** are configured in the `config.yml` file.

Default versions of `.gitignore` and `.gitattributes` files are auto-generated.

### Vagrant provisioning 
To run just a single provisioner:
- `vagrant provision --provision-with <provisioner-name>`

- Example: `vagrant provision --provision-with install-packages`

### Enjoy!
