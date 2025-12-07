# README — Como rodar os SQL scripts

Este documento descreve as **configurações e cuidados necessários** para executar os scripts SQL exportados neste repositório.

> **Visão geral:** os scripts dependem do carregamento de arquivos (LOAD DATA / LOAD DATA LOCAL INFILE). Antes de rodar, verifique as configurações do MySQL e o posicionamento dos arquivos exportados na máquina.

---

## 1) Habilitar `OPT_LOCAL_INFILE=1` (LOCAL INFILE)

**O que fazer:**

* No cliente/servidor MySQL deve estar permitido o uso de `LOCAL INFILE` para que comandos como `LOAD DATA LOCAL INFILE` funcionem com arquivos locais.
* No MySQL Workbench ou em clientes que possuam uma seção *Advanced* / *Options*, defina `OPT_LOCAL_INFILE=1` (ou marque a opção equivalente: "Enable LOCAL INFILE").

**Espaço para captura de tela:**

> ![INSERIR IMAGEM AQUI — captura de tela do Advanced com OPT\_LOCAL\_INFILE=1](./assets/localinfilemysql.png
>)
> *Substitua a imagem acima pela captura de tela do seu cliente mostrando `OPT_LOCAL_INFILE=1`.*

## 2) Posicionamento dos arquivos exportados e path (Windows ↔ UNIX)

**Regra:** coloque cada arquivo exportado (CSV, TSV, etc.) no diretório indicado nos scripts ou ajuste os caminhos nos scripts para apontar para o diretório onde os arquivos realmente estão.

**Atenção com barras:**

* O MySQL usa **barras normais** `/` como separador de diretórios.
* Se você estiver em **Windows**, os caminhos frequentemente vêm com barras invertidas `\`. **Antes de rodar os scripts, troque as barras invertidas `\` por barras normais `/`.**

**Exemplos:**

* Windows comum (original):

```
C:\dados\exports\clientes.csv
```

* Deve ficar (para MySQL):

```
C:/dados/exports/clientes.csv
```

## 4) Possíveis problemas e soluções rápidas

* **Erro: "The used command is not allowed with this MySQL version"** → Ative `--local-infile=1` no cliente e/ou `local_infile=1` no servidor.
* **Erro relacionado a `secure_file_priv`** → Se houver restrição `secure_file_priv`, o MySQL pode permitir apenas importação de arquivos dentro de um diretório específico. Neste caso, mova os arquivos para o diretório permitido ou ajuste a configuração do servidor (requer acesso de administrador).
* **Permissões de arquivo** → Garanta que o usuário do sistema que executa o cliente MySQL tenha permissão de leitura sobre os arquivos.

## Contato / Observações finais

Se precisar, adicione uma `issue` neste repositório com a captura de tela da sua configuração e exemplo de caminho/arquivo para que eu possa orientar um ajuste mais específico.

---

*Fim do README.*
