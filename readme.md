
# Como subir um docker para servir páginas web da empresa
## 1. Primeiro der clone na repo https://github.com/evertonse/docker-empresa.git
- $ ``git clone https://github.com/evertonse/docker-empresa.git``
- $ ``cd docker-empresa``

## 2. Criando variaveis convenientes para os comando a seguir
- $ ``img="empresa_server_http"``
- $ ``container="my_empresa_server"``
- $ ``port="8080"``
## 3. Construa a imagem a partir do Dockerfile da repo
-  $ ``docker build -t $img.``

## 4. Rode o container a partir da imagem gerada e mapeado nas portas 8080 (mesma porta pra interno e externo)
-  $ ``docker run -d -p $port:8080 -it --name $container $img``

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


### Dentro podemos usar ``ps aux`` para observar o servidor http rodando, algo assim deve aparecer com ``python httpserver.py``
root@36325ffb5139:/app# ps aux

                                                                                                                                         USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND                                                                                                                                                                                root         1  0.5  0.0  13900 10980 pts/0    Ss+  05:37   0:00 python httpserver.py                                                                                                                                                                   root         8  0.7  0.0   5748  3544 pts/1    Ss   05:37   0:00 /bin/bash                                                                                                                                                                              root        13  0.0  0.0   9388  3180 pts/1    R+   05:37   0:00 ps aux                                                                                                                                                                                 root@36325ffb5139:/app# exit   

### Rode ``exit`` para sair do modo interativo

### Rode ``wget http://localhost:$port`` para receber a paginas html docontainer rodando