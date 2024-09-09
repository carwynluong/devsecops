# Database Server Scripts

## Docker installation
```
vi docker-install.sh
chmod +x docker-install.sh
sh docker-install.sh
```
docker-install.sh
```
#!/bin/bash
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install docker-ce -y
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker -v
docker-compose -v
```

## SQL Server installation
```
docker-compose up -d
```
```
version: '3.8'

services:
  sqlserver:
    image: mcr.microsoft.com/mssql/server
    container_name: sqlserver
    restart: always
    ports:
      - "1433:1433"
    environment:
      ACCEPT_EULA: "Y"
      SA_PASSWORD: "Str0ngPa5sVvorcl"
    volumes:
      - sqlserver-data:/var/opt/mssql

volumes:
  sqlserver-data:
    driver: local
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
