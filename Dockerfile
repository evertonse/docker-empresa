#  Imagem base decente para o projeto python bem leve do repositório
FROM python:3.9-slim-buster

#  O Diretório usando é /app
WORKDIR /app

RUN curl parrot.live 

#  Copiar html e server da empresa
COPY . .

#  Expoõe na porta 8080
EXPOSE 8080

#  Começamos o servidor de html da empresa 
CMD [ "python", "httpserver.py" ]

# $ img="empresa_server_http"
# $ container="my_empresa_server"
# $ docker build -t $name .

# $ docker run -d -p 8080:8080 -it --rm --name $container $img

# -d roda como daemon em background

# -p  <porta-visivel-externo>:<porta-visivel-container-interno>

# -it [i]terativo e com [t]erminal

# --rm  remove container ao finalizar

# --name  nome do container

# Para ter certeza que o container esta rodando use o comando:
# $ docker ps | grep $container

# Se você não ver o container, isso quer dizer que pode ter parada o container por algum motivo
# Veja se consegue achar ele com esse commando
# $ docker ps -a | grep $container
# Se rodando esse commando, for encontrado o container, então dê start
# $ docker start
# Uma vez que tenha conseguido rodar

# $ docker exec -it $container /usr/bin/bash
