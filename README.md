# Como rodar os SQL scripts

Este documento descreve as **configurações e cuidados necessários** para executar os scripts SQL exportados neste repositório.

> **Visão geral:** os scripts dependem do carregamento de arquivos (LOAD DATA / LOAD DATA LOCAL INFILE). Antes de rodar, verifique as configurações do MySQL e o posicionamento dos arquivos exportados na máquina.

---

## 1) Habilitar `OPT_LOCAL_INFILE=1` (LOCAL INFILE)

**O que fazer:**

* No cliente/servidor MySQL deve estar permitido o uso de `LOCAL INFILE` para que comandos como `LOAD DATA LOCAL INFILE` funcionem com arquivos locais.
* No MySQL Workbench ou em clientes que possuam uma seção *Advanced* / *Options*, defina `OPT_LOCAL_INFILE=1` (ou marque a opção equivalente: "Enable LOCAL INFILE").


> ![INSERIR IMAGEM AQUI — captura de tela do Advanced com OPT\_LOCAL\_INFILE=1](./assets/localinfilemysql.png
>)

## 2) Posicionamento dos arquivos exportados e path (Windows)

**Regra:** coloque cada arquivo exportado (CSV) no diretório indicado nos scripts ou ajuste os caminhos nos scripts para apontar para o diretório onde os arquivos realmente estão. Ou simplesmente deixe o repositório no disco local C: que fique com o diretório Ex.: "C:/TesteBancoDadosIC/Importacoes_ANS/1T2023.csv"

**Atenção com barras:**

* O MySQL usa **barras normais** `/` como separador de diretórios.
* Se você estiver em **Windows**, os caminhos frequentemente vêm com barras invertidas `\`. **Antes de rodar os scripts, troque as barras invertidas `\` por barras normais `/`.**

**Exemplos:**

* Windows comum (original):

```
C:\TesteBancoDadosIC\Importacoes_ANS\1T2023.csv
```

* Deve ficar (para MySQL):

```
C:/TesteBancoDadosIC/Importacoes_ANS/1T2023.csv
```

## Contato / Observações finais

Se precisar, adicione uma `issue` neste repositório com a captura de tela da sua configuração e exemplo de caminho/arquivo para que eu possa orientar um ajuste mais específico.

---
