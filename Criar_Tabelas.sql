-- Criação das tabelas do cadastro das operadoras e demonstrações contábeis

CREATE TABLE IF NOT EXISTS operadoras (
    registro_operadora INT PRIMARY KEY,
    cnpj VARCHAR(20), -- varchar é mais seguro por as vezes pode ter zeros a esquerda.
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(100),
    logradouro VARCHAR(255),
    numero VARCHAR(100), -- Número pode ser 'S/N'.
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2),
    cep VARCHAR(20),
    ddd VARCHAR(5),
    telefone VARCHAR(20),
    fax VARCHAR(20),
    endereco_eletronico VARCHAR(255),
    representante VARCHAR(255),
    cargo_representante VARCHAR(100),
    regiao_comercializacao VARCHAR(100),
    data_registro_ans DATE,
    INDEX idx_modalidade (modalidade)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; -- Assegurar que a engine a ser usada seja o InnoDB por segurança -- o UTF8MB4 é o real (UTF8) do MySQL por usar os 4 bytes

CREATE TABLE IF NOT EXISTS demonstracoes_contabeis (
    id BIGINT AUTO_INCREMENT PRIMARY KEY, 
    data_referencia DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(50),
    descricao VARCHAR(255),
    saldo_inicial DECIMAL(20,2), 
    saldo_final DECIMAL(20,2),
    INDEX idx_data (data_referencia),
    INDEX idx_reg_ans (reg_ans),
    INDEX idx_conta (cd_conta_contabil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;  -- Assegurar que a engine a ser usada seja o InnoDB por segurança -- o UTF8MB4 é o real (UTF8) do MySQL por usar os 4 bytes