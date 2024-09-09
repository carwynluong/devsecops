# Registry Server scripts

## Docker installation
```
# apt update -y && apt upgrade -y
# apt install -y docker.io docker-compose certbot net-tools
```


## Portus installation
```
git clone https://github.com/SUSE/Portus.git
cd Portus/examples/compose

cerbot certonly --standalone -d kinkun.cloud --preferred-challenges http --agree-tos -m kinlng2002@gmail.com --keep-until-expiring

Chạy xong sẽ đc 2  file fullchain.pem và privatekey.pem

vi nginx/nginx.conf
Copy 2 file vừa tạo vào secret

vi .env
Sửa MACHINE_FQDN = kinkun.cloud 

docker-compose -f docker-compose.clair-ssl.yml	up -d
```