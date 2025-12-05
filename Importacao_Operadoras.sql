-- Importa o CSV do cadastro das operadoras.

LOAD DATA LOCAL INFILE 'C:/Users/marco/OneDrive/Documentos/4T2023/Relatorio_cadop.csv' -- Adapte para o caminho exato da pasta onde está o CSV dos registros das operadoras.
INTO TABLE operadoras
CHARACTER SET utf8mb4 -- Enconding adequado.
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES -- Ignorar a primeira linha do CSV.
(
    registro_operadora, 
    cnpj, 
    razao_social, 
    @v_nome_fantasia, 
    modalidade, 
    logradouro, 
    numero, 
    @v_complemento, 
    bairro, 
    cidade, 
    uf, 
    cep, 
    @v_ddd, 
    @v_telefone, 
    @v_fax, 
    endereco_eletronico, 
    representante, 
    cargo_representante, 
    @v_regiao, 
    @v_data_registro
)
SET  -- Tratamento das variaveis para ser adicionada corretamente na tabela na hora da importação.
    nome_fantasia = NULLIF(@v_nome_fantasia, ''),
    complemento = NULLIF(@v_complemento, ''),
    ddd = NULLIF(@v_ddd, ''),
    telefone = NULLIF(@v_telefone, ''),
    fax = NULLIF(@v_fax, ''),
    regiao_comercializacao = NULLIF(@v_regiao, ''),
    data_registro_ans = STR_TO_DATE(NULLIF(@v_data_registro, ''), '%Y-%m-%d');

SELECT count(*) as total_operadoras FROM operadoras; -- Deve retornar a quantidade de operadoras registradas.