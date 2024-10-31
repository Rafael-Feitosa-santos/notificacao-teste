# Notificação de Acidentes - Teste Automatizados


## Requisitos

Antes de começar, certifique-se de ter os seguintes requisitos instalados:

- [Docker](https://www.docker.com/get-started)
- [Java 21](https://jdk.java.net/21/)


## Como rodar a aplicação

### 1. Clonar o repositório

Clone o projeto para sua máquina local usando Git:

```sh
git clone https://github.com/Rafael-Feitosa-santos/notificacao-acidentes---Testes-automatizados.git
```

### Depois de clonar o projeto, navegue até o diretório que contém o Dockerfile

```sh
cd c:\pasta-projeto\notificacao-acidentes-test_automatizacao
```

### Construir a imagem Docker
Agora que o projeto está compilado, você pode construir a imagem Docker:

``` sh
docker build -t notificacao-teste-image .
```

### Rodar a aplicação com Docker
Para executar a aplicação dentro de um container Docker, utilize o comando:

``` sh
 docker run -d --name api-notificacao-teste -p 8080:8080 notificacao-teste-image
```

