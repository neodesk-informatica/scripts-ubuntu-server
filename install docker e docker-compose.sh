#------------------------------------------------
#    INSTALACAO DO DOCKER E DOCKER COMPOSE NeoDesk
#------------------------------------------------

echo "#------------------------------------------#"
echo           "Atualizando o Sistema" 
echo "#------------------------------------------#"

sudo apt update && sudo apt upgrade -y

clear
echo "#------------------------------------------#"
echo           "PRÉ INSTALAÇÃO Docker" 
echo "#------------------------------------------#"

sudo apt install apt-transport-https ca-certificates curl software-properties-common

clear
echo "#--------------------------------------------------------------#"
echo  "  Adicionando a chave GPG e o repositório oficial do Docker" 
echo "#--------------------------------------------------------------#"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

clear
echo "#------------------------------------------#"
echo  "           Instalando o Docker" 
echo "#------------------------------------------#"

sudo apt update
sudo apt install docker-ce
docker --version
sudo usermod -aG docker ${USER}
su - ${USER}

clear
echo "#------------------------------------------#"
echo    "Instalando o Docker Compose" 
echo "#------------------------------------------#"

mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.27.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
docker compose version

echo "#-----------------------------------------#"
echo                  "FIM"
echo "#-----------------------------------------#"
