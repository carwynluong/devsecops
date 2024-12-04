# Gitlab Runner Scripts

## Gitlab Runner installation
Install on DevServer and BuildServer
```
# apt update -y
# curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
# apt install gitlab-runner
```

## Gitlab register

```
# gitlab-runner register
```

## Cloud beaver installation
```
docker-compose up -d
```
```
version: '3.8'

services:
  cloudbeaver:
    image: dbeaver/cloudbeaver
    container_name: cloudbeaver
    restart: always
    ports:
      - "8978:8978"
    volumes:
      - cloudbeaver-data:/opt/cloudbeaver/workspace

volumes:
  cloudbeaver-data:
    driver: local
```

## Migrate database
- Copy table-init.sql to Cloudbeaver and run script
- Then copy run data-init.sql
