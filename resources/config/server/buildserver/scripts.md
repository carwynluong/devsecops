# Development Server scripts

## NetCore 6 installation
```
# apt update -y && apt upgrade -y
# apt install -y wget apt-transport-https software-properties-common
# wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
# dpkg -i packages-microsoft-prod.deb
# apt update -y && apt install -y dotnet-sdk-6.0
```


## NodeJS version 18 installation
```
# curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
# bash nodesource_setup.sh
# apt install nodejs
```