# Gitlab Server scripts

## Installation
```
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

sudo apt-get install gitlab-ee=15.6.7-ee.0
```

## Configure
/etc/gitlab/gitlab.lb
sudo gitlab-ctl reconfigure

## Arachni Installation
```
# wget https://github.com/Arachni/arachni/releases/download/v1.4/arachni-1.4-0.5.10-linux-x86_64.tar.gz
```