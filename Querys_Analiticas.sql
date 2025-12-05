SELECT
	operadoras.registro_operadora,
    operadoras.razao_social,
    sum(demonstracoes_contabeis.saldo_final) AS total_saldo_final
FROM demonstracoes_contabeis
JOIN operadoras ON demonstracoes_contabeis.reg_ans = operadoras.registro_operadora -- Chave em comum das tabelas para o join
WHERE
	demonstracoes_contabeis.descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    and demonstracoes_contabeis.data_referencia = (SELECT max(data_referencia) FROM demonstracoes_contabeis) -- Seleciona o ultimo trimestre
GROUP BY operadoras.registro_operadora, operadoras.razao_social
ORDER BY sum(demonstracoes_contabeis.saldo_final) DESC LIMIT 10;

SELECT
	operadoras.registro_operadora,
    operadoras.razao_social,
    sum(demonstracoes_contabeis.saldo_final) AS total_saldo_final
FROM demonstracoes_contabeis
JOIN operadoras ON demonstracoes_contabeis.reg_ans = operadoras.registro_operadora
WHERE
	demonstracoes_contabeis.descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND YEAR(demonstracoes_contabeis.data_referencia) = YEAR((SELECT max(data_referencia) FROM demonstracoes_contabeis)) -- Seleciona o ultimo ano.
GROUP BY operadoras.registro_operadora, operadoras.razao_social
ORDER BY sum(demonstracoes_contabeis.saldo_final) DESC LIMIT 10;