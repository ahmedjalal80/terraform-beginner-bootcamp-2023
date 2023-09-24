# Terraform Beginner Bootcamp 2023

## Install the Terraform CLI 

## Considerations with the Terraform CLI changes

## Considerations for Linux distribution

This project is built on Ubuntu Linux. Please take that into consideration when writing code

```sh
$ cat /etc/os-release 

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

The terraform installation has changed due to GPG changes
[Install Terraform CLI] (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Refactoring into bash script 

We moved the terraform install steps into a seperate script and then refernced it from the gitpod.yml script.
This will give us more flexibility in the future if we need to make any changes

Bash script is located in ./bin/install_terraform_cli.bash

## Working with ENV Vars 

We can list variables using `env` command

We can filter specific env vars using `echo $PROJECT_ROOT | grep` command

### Setting and unsetting variables

We can set variables using 
```
set VAR123="hello"
```

We can unset variables using
```
unset VAR123
```

### Printing Vars 

We can print an env var using echo eg. `echo $HELLO`

### Scoping of Env Vars

When you open up a new bash terminals in VScode, it will not be aware of env vars that have set in another window

If you want env vars to persist across all future bash terminals,  you need to set env vars in the bash profile, example: `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars into Gitpod by storing them in Gitpod Secrets Storage

```
gp env Hello='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in those workspaces

We can also set them in .gitpod.yml

