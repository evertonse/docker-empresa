import socket

HOST = ''
PORT = 8080
# wget http://localhost:8080
html = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>GanhaMuOnline</title>
    </head>
    <body>
        <h1>Ganha MuOnline</h1>
        
        <h2>Servidor Pirata de Mu Online para Sergipanos</h2>
    </body>
    </html>
"""

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.bind((HOST, PORT))

s.listen(True)

print("server started", PORT)

while True:
    conn, client = s.accept()
    print ("server aceitou", client)

    data = conn.recv(1024)
    print ("server received data")
    conn.sendall("HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n" + html)

    conn.close()