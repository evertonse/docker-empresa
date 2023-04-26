
# Como subir um docker para servir páginas web da empresa
## 1. Primeiro der clone na repo https://github.com/evertonse/docker-empresa.git
- $ ``git clone https://github.com/evertonse/docker-empresa.git``
- $ ``cd docker-empresa``

## 2. Criando variaveis convenientes para os comando a seguir
- $ ``img="empresa_server_http"``
- $ ``container="my_empresa_server"``
- $ ``port="8089"``
## 3. Construa a imagem a partir do Dockerfile da repo
-  $ ``docker build -t $img.``

## 4. Rode o container a partir da imagem gerada e mapeado nas portas 8080 (mesma porta pra interno e externo)
-  $ ``docker run -d -p $port:8080 -it --rm --name $container $img``

## O que o commando significa 

-d roda como daemon em background

 -p  [porta-host]:[porta-container]

 -it [i]terativo e com [t]erminal

 --rm  remove container ao finalizar

 --name  nome do container

## 5. Para ter certeza que o container esta rodando use o comando:
- $ ``docker ps | grep $container``

## 6. Se você não ver o container, isso quer dizer que pode ter parada o container por algum motivo
## Veja se consegue achar ele com esse commando
- $ ``docker ps -a | grep $container``
## Se rodando esse commando, for encontrado o container, então dê start
- $ ``docker start``

## Uma vez que tenha conseguido rodar podemos observar a máquina rodando o commando
- $ ``docker exec -it $container /bin/bash``


### Dentro podemos usar ``ps aux`` para observar o servidor http rodando
### Rode ``exit`` para sair do modo interativo
### Rode ``wget http://localhost:$port`` para receber a paginas html docontainer rodando