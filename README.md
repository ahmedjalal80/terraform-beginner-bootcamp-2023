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

## AWS CLI Installation ##

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli.bash`](./bin/install_aws_cli.bash)

[Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

### Verifying AWS Credentials 

Check what user/credentials you are logged in as by running the following command:

Before AWS cli credentials are set

```
gitpod /workspace/terraform-beginner-bootcamp-2023 (7-refactor-aws-cli-script) $ aws sts get-caller-identity

Unable to locate credentials. You can configure credentials by running "aws configure".
gitpod /workspace/terraform-beginner-bootcamp-2023 (7-refactor-aws-cli-script) $ 
``````

Credentials look like this:

```
AWS_ACCESS_KEY_ID=''
AWS_SECRET_ACCESS_KEY=''
AWS_DEFAULT_REGION=us-east-1
```

You can set credentials in Gitpod using the following command in a bash window
```
gp env AWS_ACCESS_KEY_ID=''
gp env AWS_SECRET_ACCESS_KEY=''
gp env AWS_DEFAULT_REGION=us-east-1
```

After setting credentials, we can verify using AWS sts command

```json
gitpod /workspace/terraform-beginner-bootcamp-2023 (7-refactor-aws-cli-script) $ aws sts get-caller-identity
{
    "UserId": "AIDA4J2P6ZGA2LDQHOKN7",
    "Account": "123456789",
    "Arn": "arn:aws:iam::123456790:user/tf-bootcamp-1"
}
```

### Fixing AWS Cli Install script permissions ###

To run the file, the file must have executable permissions for user
```
gitpod /workspace/terraform-beginner-bootcamp-2023/bin (7-refactor-aws-cli-script) $ chmod u+x ./install_aws_cli.bash 
gitpod /workspace/terraform-beginner-bootcamp-2023/bin (7-refactor-aws-cli-script) $ ls -ltr ./install_aws_cli.bash 
-rwxr--r-- 1 gitpod gitpod 197 Sep 25 18:13 ./install_aws_cli.bash
gitpod /workspace/terraform-beginner-bootcamp-2023/bin (7-refactor-aws-cli-script) $ 
```
### Fixing the AWS script ###

When the script it run without changes, you are prompted to replace AWS folder contents. We can fix that by modifying the script and adding these lines

```bash
FILENAME='awscliv2.zip'
rm -f "/workspace/$FILENAME"
rm -rf "/workspace/aws"
```



