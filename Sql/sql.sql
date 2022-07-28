/*----------------------------------------------------------*/
/*            Criação da estrutura banco de dados           */
/*----------------------------------------------------------*/

-- Tabela de Colaboradores --------------------------------
DROP TABLE tb_speedtoherocolaborador;
CREATE TABLE tb_speedtoherocolaborador
(
  seqcolaborador INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  sexo VARCHAR(1),
  dtanascimento DATE,
  email VARCHAR(100),
  situacao VARCHAR(1) NOT NULL,
  PRIMARY KEY (seqcolaborador)
);

SELECT * FROM tb_speedtoherocolaborador;

-- Tabela de Espécies dos equipamentos --------------------
DROP TABLE tb_speedtoheroespecie
CREATE TABLE tb_speedtoheroespecie
(
  seqespecie INT NOT NULL AUTO_INCREMENT,
  especie VARCHAR(100) NOT NULL,
  PRIMARY KEY (seqespecie)
);

-- Populando tabela de Espécies via banco de dados com valores fixos 
INSERT INTO tb_speedtoheroespecie (especie) VALUES ('Mouse');
INSERT INTO tb_speedtoheroespecie (especie) VALUES ('Teclado');
INSERT INTO tb_speedtoheroespecie (especie) VALUES ('Notebook');
INSERT INTO tb_speedtoheroespecie (especie) VALUES ('Suporte');

SELECT * FROM tb_speedtoheroespecie;

-- Tabela de Equipamentos ---------------------------------
DROP TABLE tb_speedtoheroequipamento;
CREATE TABLE tb_speedtoheroequipamento
(
  seqequipamento INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  seqespecie INT NOT NULL,
  situacao VARCHAR(1) NOT NULL,
  PRIMARY KEY (seqequipamento)
);
ALTER TABLE tb_speedtoheroequipamento ADD FOREIGN KEY (seqespecie) REFERENCES tb_speedtoheroespecie(seqespecie);

SELECT * FROM tb_speedtoheroequipamento;

-- Tabela de Locações -------------------------------------
DROP TABLE tb_speedtoherolocacao; 
CREATE TABLE tb_speedtoherolocacao
(
  seqcolaborador  INT NOT NULL,
  seqequipamento  INT NOT NULL,
  dtalocacao DATE NOT NULL,
  dtadevolucao DATE,
  PRIMARY KEY (seqcolaborador, seqequipamento, dtalocacao)
);
ALTER TABLE tb_speedtoherolocacao ADD FOREIGN KEY (seqcolaborador) REFERENCES tb_speedtoherocolaborador(seqcolaborador);
ALTER TABLE tb_speedtoherolocacao ADD FOREIGN KEY (seqequipamento) REFERENCES tb_speedtoheroequipamento(seqequipamento);

SELECT * FROM tb_speedtoherolocacao;

/*----------------------------------------------------------*/
/*         SELECTS dos componentes do DM1                   */
/*----------------------------------------------------------*/

-- TZQuery tbColaborador 
SELECT a.seqcolaborador,
       a.nome,
       a.sexo,
       IF(a.sexo='M','Masculino','Feminino') AS decode_sexo,
       a.dtanascimento,
       a.email,
       a.situacao,
       IF(a.situacao='A','Ativo','Inativo') AS decode_situacao
FROM tb_speedtoherocolaborador a;

-- TZQuery tbColaboradorDual 
SELECT 0 AS seqcolaborador,
       'Todos' AS nome,
       '' AS sexo,
       '' AS dtanascimento,
       '' AS email,
       '' AS situacao,
       0 AS ordem
FROM DUAL
UNION
SELECT a.seqcolaborador,
       a.nome,
       a.sexo,
       a.dtanascimento,
       a.email,
       a.situacao,
       1 AS ordem
FROM tb_speedtoherocolaborador a
WHERE a.situacao = 'A'
ORDER BY ordem, nome;

-- TZQuery tbEspecie
SELECT a.seqespecie,
       a.especie 
FROM tb_speedtoheroespecie a;

-- TZQuery tbEspecieDual 
SELECT 0 AS seqespecie,
       'Todos' AS especie,
       0 AS ordem
 FROM DUAL
UNION
SELECT a.seqespecie,
       a.especie,
       1 AS ordem
FROM tb_speedtoheroespecie a
ORDER BY ordem, especie;

-- TZQuery tbEquipamento
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       a.situacao
FROM tb_speedtoheroequipamento a;

-- TZQuery tbEquipamentosDisponíveis
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       b.especie,
       a.situacao,
       IF(a.situacao='A','Ativo','Inativo') AS decode_situacao
FROM tb_speedtoheroequipamento a,
     tb_speedtoheroespecie b
WHERE a.seqespecie =  b.seqespecie
AND a.situacao = 'A'
AND NOT EXISTS( SELECT 1
	                FROM tb_speedtoherolocacao c
                 WHERE a.seqequipamento = c.seqequipamento
                 AND c.dtadevolucao IS NULL
              )
ORDER BY a.seqequipamento ASC;

-- TZQuery tbEquipamentosIndiponíveis
SELECT b.seqcolaborador,
       d.nome AS nomecolaborador,
       a.seqequipamento,
       a.nome AS nomequipamento,
       a.seqespecie,
       c.especie,
       b.dtalocacao,
       b.dtadevolucao
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b,
     tb_speedtoheroespecie c,
     tb_speedtoherocolaborador d
WHERE a.seqequipamento = b.seqequipamento
AND a.seqespecie = c.seqespecie
AND b.seqcolaborador = d.seqcolaborador
AND b.dtadevolucao IS NULL
ORDER BY a.seqequipamento ASC;
 
-- TZQuery tbEquipamentosDBGridEquipamentos
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       b.especie,
       a.situacao,
       IF(a.situacao = 'A','Ativo','Inativo') AS decode_situacao
FROM tb_speedtoheroequipamento a,
     tb_speedtoheroespecie b
WHERE a.seqespecie = b.seqespecie;

-- TZQuery tbLocacao
SELECT a.seqcolaborador,
       a.seqequipamento,
       a.dtalocacao,
       a.dtadevolucao
FROM tb_speedtoherolocacao a;

-- TZQuery tbLocacaoRelatorios 
SELECT a.seqcolaborador,
       b.nome AS nomecolaborador,
       a.seqequipamento,
       c.nome AS nomequipamento,
       d.seqespecie,
       d.especie,
       a.dtalocacao,
       a.dtadevolucao,
       IF(a.dtadevolucao IS NULL,'Alocado',(DATE_FORMAT(a.dtadevolucao,'%d/%m/%Y'))) AS decode_dtadevolucao       
FROM tb_speedtoherolocacao a,
     tb_speedtoherocolaborador b,
     tb_speedtoheroequipamento c,
     tb_speedtoheroespecie d
WHERE a.seqcolaborador = b.seqcolaborador
AND a.seqequipamento = c.seqequipamento
AND c.seqespecie = d.seqespecie;