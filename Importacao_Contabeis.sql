-- Importa dos 8 CSV (cada trimestre) e adiciona na tabela demonstracoes_contabeis

-- Otimização:
SET autocommit = 0;  -- Desabilita o salvamento para cada arquivo, para realizar tudo de uma vez no final.
SET unique_checks = 0;   -- Impossibilita do script analisar se há duplicatas de primary keys toda vez.
SET foreign_key_checks = 0;  -- Impossibilita do script analisar se as chaves estrangeiras estão relacionadas corretamente.

SET GLOBAL local_infile = 1; -- Libera para o MySQL pegar os arquivos do computador.

-- IMPORTAÇÃO DE 2023

-- Atente-se de adicionar cada arquivo exportado conforme seu devido diretório. 
-- Também, se estiver no windows garanta que o diretório esteja com as barras normais "/".
-- Ex.: C:/Users/marco/...

-- 1º Trimestre 2023
LOAD DATA LOCAL INFILE 'C:/TesteBancoDadosIC/Importacoes_ANS/1T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES  -- Ignora a primeria linha do arquivo CSV.
(@v_data, reg_ans, cd_conta_contabil, descricao, @v_saldo_inicial, @v_saldo_final)
SET data_referencia = STR_TO_DATE(@v_data, '%Y-%m-%d'),   -- Define a data para o padão Ano / Mês / Dia
    saldo_inicial = CAST(REPLACE(@v_saldo_inicial, ',', '.') AS DECIMAL(20,2)),  -- Padroniza para o padrão monetário brasileiro.
    saldo_final = CAST(REPLACE(@v_saldo_final, ',', '.') AS DECIMAL(20,2)); -- Padroniza para o padrão monetário brasileiro.

-- 2º Trimestre 2023
LOAD DATA LOCAL INFILE 'C:/TesteBancoDadosIC/Importacoes_ANS/2T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@v_data, reg_ans, cd_conta_contabil, descricao, @v_saldo_inicial, @v_saldo_final)
SET data_referencia = STR_TO_DATE(@v_data, '%Y-%m-%d'),
    saldo_inicial = CAST(REPLACE(@v_saldo_inicial, ',', '.') AS DECIMAL(20,2)),
    saldo_final = CAST(REPLACE(@v_saldo_final, ',', '.') AS DECIMAL(20,2));

-- 3º Trimestre 2023
LOAD DATA LOCAL INFILE 'C:/TesteBancoDadosIC/Importacoes_ANS/3T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@v_data, reg_ans, cd_conta_contabil, descricao, @v_saldo_inicial, @v_saldo_final)
SET data_referencia = STR_TO_DATE(@v_data, '%Y-%m-%d'),
    saldo_inicial = CAST(REPLACE(@v_saldo_inicial, ',', '.') AS DECIMAL(20,2)),
    saldo_final = CAST(REPLACE(@v_saldo_final, ',', '.') AS DECIMAL(20,2));

-- 4º Trimestre 2023
LOAD DATA LOCAL INFILE 'C:/TesteBancoDadosIC/Importacoes_ANS/4T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@v_data, reg_ans, cd_conta_contabil, descricao, @v_saldo_inicial, @v_saldo_final)
SET data_referencia = STR_TO_DATE(@v_data, '%d/%m/%Y'),  -- Por algum motivo tive que definir a data desse modelo pois esse trimestre estava subindo datas como NULL, só assim deu certo...
    saldo_inicial = CAST(REPLACE(@v_saldo_inicial, ',', '.') AS DECIMAL(20,2)),
    saldo_final = CAST(REPLACE(@v_saldo_final, ',', '.') AS DECIMAL(20,2));
    
-- IMPORTAÇÃO DE 2024

-- Atente-se de adicionar cada arquivo exportado conforme seu devido diretório.
    
-- 1º Trimestre 2024
LOAD DATA LOCAL INFILE 'C:/TesteBancoDadosIC/Importacoes_ANS/1T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@v_data, reg_ans, cd_conta_contabil, descricao, @v_saldo_inicial, @v_saldo_final)
SET data_referencia = STR_TO_DATE(@v_data, '%Y-%m-%d'),
    saldo_inicial = CAST(REPLACE(@v_saldo_inicial, ',', '.') AS DECIMAL(20,2)),
    saldo_final = CAST(REPLACE(@v_saldo_final, ',', '.') AS DECIMAL(20,2));
    
-- 2º Trimestre 2024
LOAD DATA LOCAL INFILE 'C:/TesteBancoDadosIC/Importacoes_ANS/2T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@v_data, reg_ans, cd_conta_contabil, descricao, @v_saldo_inicial, @v_saldo_final)
SET data_referencia = STR_TO_DATE(@v_data, '%Y-%m-%d'),
    saldo_inicial = CAST(REPLACE(@v_saldo_inicial, ',', '.') AS DECIMAL(20,2)),
    saldo_final = CAST(REPLACE(@v_saldo_final, ',', '.') AS DECIMAL(20,2));
    
-- 3º Trimestre 2024
LOAD DATA LOCAL INFILE 'C:/TesteBancoDadosIC/Importacoes_ANS/3T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@v_data, reg_ans, cd_conta_contabil, descricao, @v_saldo_inicial, @v_saldo_final)
SET data_referencia = STR_TO_DATE(@v_data, '%Y-%m-%d'),
    saldo_inicial = CAST(REPLACE(@v_saldo_inicial, ',', '.') AS DECIMAL(20,2)),
    saldo_final = CAST(REPLACE(@v_saldo_final, ',', '.') AS DECIMAL(20,2));
    
-- 4º Trimestre 2024
LOAD DATA LOCAL INFILE 'C:/TesteBancoDadosIC/Importacoes_ANS/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@v_data, reg_ans, cd_conta_contabil, descricao, @v_saldo_inicial, @v_saldo_final)
SET data_referencia = STR_TO_DATE(@v_data, '%Y-%m-%d'),
    saldo_inicial = CAST(REPLACE(@v_saldo_inicial, ',', '.') AS DECIMAL(20,2)),
    saldo_final = CAST(REPLACE(@v_saldo_final, ',', '.') AS DECIMAL(20,2));

-- Reativa as verificações e salva tudo
COMMIT;
SET unique_checks = 1; 
SET foreign_key_checks = 1;
SET autocommit = 1;

-- Validação:
SELECT   -- Deve retornar a quantidade de registros do ano de 2023 e 2024 com todos os trimestres.
    YEAR(data_referencia) as Ano, 
    COUNT(*) as Total_Registros 
FROM demonstracoes_contabeis 
GROUP BY YEAR(data_referencia);