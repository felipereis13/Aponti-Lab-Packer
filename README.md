# Laboratório de Packer e Docker

Atividades de criação de imagens Docker com HashiCorp Packer, usando Ubuntu Jammy como base.

## Atividades

| Pasta | Objetivo | Imagem criada |
| --- | --- | --- |
| `atividade-1` | Instalar Apache e copiar uma página HTML local | `meu-apache-packer:latest` |
| `atividade-2` | Instalar Python, pip e Flask e definir `/app` como pasta de trabalho | `ambiente-dev-python:v1` |
| `atividade-3` | Instalar Node.js e npm, copiar `package.json` e executar `npm install` em `/app` | `ambiente-node:v1` |

As respostas sobre cloud-init, Packer e Golden Image estão em [respostas.md](respostas.md).

## Requisitos

- Git.
- Packer instalado e disponível no terminal.
- Docker Desktop aberto e configurado para contêineres Linux.
- Acesso à internet para baixar o plugin, a imagem base e os pacotes.

Confira se o Packer e o Docker estão funcionando:

```sh
packer --version
docker ps
```

## Baixar o projeto

```sh
git clone https://github.com/felipereis13/Aponti-Lab-Packer.git
cd Aponti-Lab-Packer
```

Se você já tem o projeto no computador, abra o terminal na pasta dele.

## Atividade 1: Apache

```sh
cd atividade-1
packer init .
packer validate .
packer build .
docker run --rm -p 127.0.0.1:8080:80 meu-apache-packer:latest
```

Abra [http://localhost:8080](http://localhost:8080) no navegador. A página deve mostrar **Meu Apache criado com Packer**.

Pressione `Ctrl+C` no terminal para encerrar o contêiner antes de continuar.

## Atividade 2: Python com Flask

Partindo da pasta `atividade-1`:

```sh
cd ../atividade-2
packer init .
packer validate .
packer build .
docker run --rm ambiente-dev-python:v1 python3 -m flask --version
```

O terminal deve mostrar as versões do Python, Flask e Werkzeug.

## Atividade 3: Node.js

Partindo da pasta `atividade-2`:

```sh
cd ../atividade-3
packer init .
packer validate .
packer build .
docker run --rm ambiente-node:v1 node --version
docker run --rm ambiente-node:v1 npm --version
```

O terminal deve mostrar as versões do Node.js e do npm.

## Comandos utilizados

| Comando | Função |
| --- | --- |
| `packer init .` | Baixa o plugin necessário para usar o Docker. |
| `packer validate .` | Verifica a configuração antes de construir a imagem. |
| `packer build .` | Cria a imagem e remove o contêiner temporário da construção. |
| `docker images` | Lista as imagens salvas no computador. |
| `docker run --rm` | Executa um contêiner e o remove quando ele termina. |

## Packer local no PowerShell

Se você está usando a cópia do Packer que já foi preparada na pasta `.tmp`, execute estes comandos na pasta principal do projeto antes de entrar nas atividades:

```powershell
$env:Path += ";$PWD\.tmp\packer-bin"
$env:PACKER_PLUGIN_PATH = "$PWD\.tmp\packer-plugins"
```

A pasta `.tmp` é ignorada pelo Git e não acompanha o projeto no GitHub.
