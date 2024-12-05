# Gitlab Server scripts

## Installation
```
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

sudo apt-get install gitlab-ee=15.6.7-ee.0
```

## Configure
/etc/gitlab/gitlab.lb
sudo gitlab-ctl reconfigure
