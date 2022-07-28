/* Criação estrutura banco de dados */

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

DROP TABLE tb_speedtoheroespecie
CREATE TABLE tb_speedtoheroespecie
(
  seqespecie INT NOT NULL AUTO_INCREMENT,
  especie VARCHAR(100) NOT NULL,
  PRIMARY KEY (seqespecie)
);

SELECT * FROM tb_speedtoheroespecie;

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
/*---------------------------------------------------------*/

/* Populando tb_speedtoheroespecie banco de dados */
INSERT INTO tb_speedtoheroespecie (especie) VALUES ('Mouse');
INSERT INTO tb_speedtoheroespecie (especie) VALUES ('Teclado');
INSERT INTO tb_speedtoheroespecie (especie) VALUES ('Notebook');
INSERT INTO tb_speedtoheroespecie (especie) VALUES ('Suporte');

/* Populando tb_speedtoherocolaborador banco de dados */
INSERT INTO tb_speedtoherocolaborador (nome,sexo,dtanascimento,email,situacao) VALUES ('Adriano','M','1993-03-24','adriano@mail.com','A');
INSERT INTO tb_speedtoherocolaborador (nome,sexo,dtanascimento,email,situacao) VALUES ('Adriano Antunes','M','1993-03-24','adriano@mail.com','A');
INSERT INTO tb_speedtoherocolaborador (nome,sexo,dtanascimento,email,situacao) VALUES ('Leandro','M','1993-03-24','adriano@mail.com','A');
INSERT INTO tb_speedtoherocolaborador (nome,sexo,dtanascimento,email,situacao) VALUES ('Leandro Viana','M','1993-03-24','adriano@mail.com','I');
INSERT INTO tb_speedtoherocolaborador (nome,sexo,dtanascimento,email,situacao) VALUES ('Emilia','F','1993-03-24','emilia@mail.com','A');
INSERT INTO tb_speedtoherocolaborador (nome,sexo,dtanascimento,email,situacao) VALUES ('Emilia Vieira','F','1993-03-24','emilia@mail.com','I');

/* Populando tb_speedtoheroequipamento banco de dados */
INSERT INTO tb_speedtoheroequipamento (nome,seqespecie,situacao) VALUES ('Mouse',1,'A');
INSERT INTO tb_speedtoheroequipamento (nome,seqespecie,situacao) VALUES ('Mouse 88',1,'I');
INSERT INTO tb_speedtoheroequipamento (nome,seqespecie,situacao) VALUES ('Teclado',2,'A');
INSERT INTO tb_speedtoheroequipamento (nome,seqespecie,situacao) VALUES ('Teclado 88',2,'I');
INSERT INTO tb_speedtoheroequipamento (nome,seqespecie,situacao) VALUES ('Notebook',3,'A');
INSERT INTO tb_speedtoheroequipamento (nome,seqespecie,situacao) VALUES ('Notebook 88',3,'I');
INSERT INTO tb_speedtoheroequipamento (nome,seqespecie,situacao) VALUES ('Suporte',4,'A');
INSERT INTO tb_speedtoheroequipamento (nome,seqespecie,situacao) VALUES ('Suporte88',4,'I');

/*---------------------------------------------------------*/

/* Visualizando informações realizando um "SELECT All FROM ..." detalhado*/

-- Colaboradores
SELECT a.seqcolaborador,
       a.nome,
       a.sexo,
       a.dtanascimento,
       a.email,
       a.situacao
FROM tb_speedtoherocolaborador a;

-- Especies
SELECT a.seqespecie,
       a.especie 
FROM tb_speedtoheroespecie a;

-- Equipamentos
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       a.situacao
FROM tb_speedtoheroequipamento a;

-- Locacoes
SELECT a.seqcolaborador,
       a.seqequipamento,
       a.dtalocacao,
       a.dtadevolucao
FROM tb_speedtoherolocacao a;

/*---------------------------------------------------------*/

SELECT a.seqcolaborador,
       b.nome,
       a.seqequipamento,
       c.nome,
       a.dtalocacao,
       a.dtadevolucao
 FROM tb_speedtoherolocacao a,
      tb_speedtoherocolaborador b,
      tb_speedtoheroequipamento c
WHERE a.seqcolaborador = b.seqcolaborador
AND a.seqequipamento = c.seqequipamento;

SELECT a.seqcolaborador,
       a.seqequipamento,
       a.dtalocacao,
       a.dtadevolucao
FROM tb_speedtoherolocacao a
ORDER BY a.seqequipamento ASC;


SELECT a.seqequipamento,
             a.nome,
             a.seqespecie
FROM tb_speedtoheroequipamento a
WHERE NOT EXISTS( SELECT 1
	        FROM tb_speedtoherolocacao b
                WHERE a.seqequipamento = b.seqequipamento
                AND b.dtadevolucao IS NULL
              );

/*---------------------------------------------------------*/

/*Usando campos com "DECODE"*/
/*Lista de Colaboradores com Decode (IF) no Sexo*/
SELECT a.seqcolaborador,
       a.nome, 
       IF(a.sexo='M','Masculino','Feminino') AS sexo,
       a.dtanascimento,
       a.email
FROM tb_speedtoherocolaborador a;

/*Lista de Colaboradores com Decode (IF) na Espécie*/
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       b.especie
FROM tb_speedtoheroequipamento a,
     tb_speedtoheroespecie b
WHERE a.seqespecie = b.seqespecie;

/*---------------------------------------------------------*/

/*Quantidade total de equipamentos*/
SELECT a.seqespecie, 
       b.especie,
       COUNT(a.seqespecie) AS quantidade
FROM tb_speedtoheroequipamento a,
     tb_speedtoheroespecie b
WHERE a.seqespecie = b.seqespecie
GROUP BY a.seqespecie;

/*Quantidade total de equipamento por especie*/
SELECT a.seqespecie, 
       b.especie,
       COUNT(a.seqespecie) AS quantidade
FROM tb_speedtoheroequipamento a,
     tb_speedtoheroespecie b
WHERE b.especie = 'Mouse'
AND a.seqespecie = b.seqespecie; 

/*Quantidade total de equipamento por nome*/
SELECT a.nome, 
       a.seqespecie, 
       b.especie
FROM tb_speedtoheroequipamento a,
     tb_speedtoheroespecie b
WHERE a.nome LIKE '%Mouse %'
AND a.seqespecie = b.seqespecie; 

SELECT a.seqequipamento, 
       a.nome, 
       a.seqespecie,
       b.dtalocacao,
       b.dtadevolucao,
       SUM(a.seqespecie) AS quantidade
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b
WHERE a.seqequipamento = b.seqequipamento
AND dtadevolucao IS NULL 
GROUP BY seqespecie;

/*---------------------------------------------------------*/

/*Equipamentos alocados*/
SELECT a.seqequipamento, 
       a.nome, 
       a.seqespecie,
       b.dtalocacao,
       b.dtadevolucao
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b
WHERE a.seqequipamento = b.seqequipamento
AND dtadevolucao IS NULL;

/*Equipamentos devolvidos*/
SELECT a.seqequipamento, 
       a.nome, 
       a.seqespecie,
       b.dtalocacao,
       b.dtadevolucao
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b
WHERE a.seqequipamento = b.seqequipamento
AND dtadevolucao IS NOT NULL;

/*Equipamentos alocados por nome*/
SELECT a.seqequipamento, 
       a.nome, 
       a.seqespecie,
       b.dtalocacao,
       b.dtadevolucao
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b
WHERE a.seqequipamento = b.seqequipamento
AND a.nome = 'Mouse B'
AND dtadevolucao IS NULL;

/*Equipamentos alocados e devolvidos por especie*/
SELECT a.seqequipamento, 
       a.nome, 
       a.seqespecie,
       c.especie,
       b.dtalocacao,
       b.dtadevolucao
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b,
     tb_speedtoheroespecie c
WHERE a.seqequipamento = b.seqequipamento
AND a.seqespecie = c.seqespecie
AND c.seqespecie = 1;

/*Equipamentos alocados e indisponíveis por especie*/
SELECT a.seqequipamento, 
       a.nome, 
       a.seqespecie,
       c.especie,
       b.dtalocacao,
       b.dtadevolucao
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b,
     tb_speedtoheroespecie c
WHERE a.seqequipamento = b.seqequipamento
AND a.seqespecie = c.seqespecie
AND c.seqespecie = 1
AND b.dtadevolucao IS NULL;

/*Equipamentos alocados e disponíveis por especie*/
SELECT a.seqequipamento, 
       a.nome, 
       a.seqespecie,
       c.especie,
       b.dtalocacao,
       b.dtadevolucao
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b,
     tb_speedtoheroespecie c
WHERE a.seqequipamento = b.seqequipamento
AND a.seqespecie = c.seqespecie
AND c.seqespecie = 1
AND b.dtadevolucao IS NOT NULL;


/*Equipamento Disponíveis*/                            
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie
FROM tb_speedtoheroequipamento a
WHERE NOT EXISTS( SELECT 1
	        FROM tb_speedtoherolocacao b
                WHERE a.seqequipamento = b.seqequipamento
                AND b.dtadevolucao IS NOT NULL
              );

/*Equipamento Indisponíveis*/                            
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie
FROM tb_speedtoheroequipamento a
WHERE EXISTS( SELECT 1
	        FROM tb_speedtoherolocacao b
                WHERE a.seqequipamento = b.seqequipamento
                AND b.dtadevolucao IS NULL
              );

/*Equipamento Indisponíveis e para qual colaborador está alocado*/                            

SELECT a.seqcolaborador,
       a.seqequipamento,
       a.dtalocacao,
       a.dtadevolucao
FROM tb_speedtoherolocacao a
ORDER BY a.seqequipamento ASC;
          
/*Equipamento Não Alocados por espécie*/                            
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie
FROM tb_speedtoheroequipamento a
WHERE a.seqespecie = 1
AND NOT EXISTS( SELECT 1
	        FROM tb_speedtoherolocacao b
                WHERE a.seqequipamento = b.seqequipamento
                AND b.dtadevolucao IS NULL
              );
              
              
/*Equipamento Alocados*/                                         
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie
FROM tb_speedtoheroequipamento a
WHERE a.seqespecie = 1
AND EXISTS( SELECT 1
	        FROM tb_speedtoherolocacao b
                WHERE a.seqequipamento = b.seqequipamento
                AND b.dtadevolucao IS NULL
              );

/*---------------------------------------------------------*/

/* TESTES */
SELECT b.seqcolaborador,
       d.nome,
       a.seqequipamento, 
       a.nome, 
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
ORDER BY 1 ASC;

ORDER BY b.seqcolaborador;

SELECT * FROM tb_speedtoherocolaborador;

/*Equipamentos Alocados tabela de locação*/
SELECT a.* FROM tb_speedtoherolocacao a WHERE a.seqequipamento = 8;
SELECT * FROM tb_speedtoherolocacao WHERE dtadevolucao IS NULL;
          
              
/*Tb locacao select*/
SELECT a.seqequipamento, 
       a.nome, 
       a.seqespecie,
       c.especie,
       b.dtalocacao,
       b.dtadevolucao
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b,
     tb_speedtoheroespecie c
WHERE a.seqequipamento = b.seqequipamento
AND a.seqespecie = c.seqespecie;
              
/* Testes */

/*Equipamento Ativo e Inativos*/
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       a.situacao,
       b.especie
FROM tb_speedtoheroequipamento a,
     tb_speedtoheroespecie b
WHERE a.seqespecie = b.seqespecie
AND a.situacao = 'A';

/*Lista Equipamentos Disponíveis*/
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       b.especie
FROM tb_speedtoheroequipamento a,
     tb_speedtoheroespecie b
WHERE a.seqespecie =  b.seqespecie  
AND NOT EXISTS( SELECT 1
	        FROM tb_speedtoherolocacao c
                WHERE a.seqequipamento = c.seqequipamento
                AND c.dtadevolucao IS NULL
              );

/*Lista Equipamentos Indisponíveis*/
SELECT b.seqcolaborador,
       a.seqequipamento, 
       a.nome, 
       a.seqespecie,
       c.especie,
       b.dtalocacao,
       b.dtadevolucao
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b,
     tb_speedtoheroespecie c
WHERE a.seqequipamento = b.seqequipamento
AND a.seqespecie = c.seqespecie
AND b.dtadevolucao IS NULL;
             
SELECT * FROM tb_speedtoherocolaborador;
/*Colaboradores Ativos e Inativos*/
-- Ativos
SELECT a.seqcolaborador,
       a.nome,
       a.sexo,
       IF(a.sexo='M','Masculino','Feminino') AS decode_sexo,
       a.dtanascimento,
       a.email,
       a.situacao,
       IF(a.situacao='A','Ativo','Inativo') AS decode_situacao
FROM tb_speedtoherocolaborador a
WHERE a.situacao = 'A';

-- Inativos
SELECT a.seqcolaborador,
       a.nome,
       a.sexo,
       IF(a.sexo='M','Masculino','Feminino') AS decode_sexo,
       a.dtanascimento,
       a.email,
       a.situacao
FROM tb_speedtoherocolaborador a
WHERE a.situacao = 'I';


-- Colaboradores
SELECT a.seqcolaborador,
       a.nome,
       a.sexo,
       a.dtanascimento,
       a.email,
       a.situacao
FROM tb_speedtoherocolaborador a;

-- Especies
SELECT a.seqespecie,
       a.especie 
FROM tb_speedtoheroespecie a;

-- Equipamentos
SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       b.especie,
       a.situacao
FROM tb_speedtoheroequipamento a,
     tb_speedtoheroespecie b
WHERE a.seqespecie = b.seqespecie;


SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       b.especie,
       a.situacao
FROM tb_speedtoheroequipamento a,
          tb_speedtoheroespecie b
WHERE a.seqespecie = b.seqespecie;

/*Equipamentos Ativos e Inativos*/

SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       b.especie,
       a.situacao,
      IF(a.situacao = 'A','Ativo','Inativo') AS decode_situacao
FROM tb_speedtoheroequipamento a,
          tb_speedtoheroespecie b
WHERE a.seqespecie = b.seqespecie;

SELECT '',
       '',
       '',
       '',
       '',
       ''
FROM DUAL

UNION

SELECT c.'' AS branco,
       a.seqequipamento,
       a.nome,
       a.seqespecie,
       b.especie,
       a.situacao,
      IF(a.situacao = 'A','Ativo','Inativo') AS decode_situacao
FROM tb_speedtoheroequipamento a,
     tb_speedtoheroespecie b,
     DUAL c         
WHERE a.seqespecie = b.seqespecie
AND a.seqespecie = b.seqespecie




SELECT a.seqequipamento,
       a.nome,
       a.seqespecie,
       b.especie,
       a.situacao,
      IF(a.situacao = 'A','Ativo','Inativo') AS decode_situacao
FROM tb_speedtoheroequipamento a,
          tb_speedtoheroespecie b
WHERE a.seqespecie = b.seqespecie
AND a.seqespecie = 1;


-- Locacoes
SELECT a.seqcolaborador,
       a.seqequipamento,
       a.dtalocacao,
       a.dtadevolucao
FROM tb_speedtoherolocacao a;

SELECT *
FROM tb_speedtoherocolaborador
WHERE 1=1
AND nome LIKE '%s%'
AND situacao = 'I';


-- Especies
SELECT a.seqespecie,
       a.especie 
FROM tb_speedtoheroespecie a;

SELECT '' AS 'seqespecie',
       '' AS 'especie'
 FROM DUAL
UNION
SELECT a.seqespecie,
       a.especie 
FROM tb_speedtoheroespecie a;

SELECT NULL AS seqespecie,
       'Todos' AS especie,
       0 AS ordem
 FROM DUAL
UNION
SELECT a.seqespecie,
       a.especie,
       1 AS ordem 
FROM tb_speedtoheroespecie a
ORDER BY ordem, especie;


SELECT '' AS 'seqcolaborador',
       '' AS 'nome',
       '' AS 'sexo',
       '' AS 'dtanascimento',
       '' AS 'email',
       '' AS 'situacao'
FROM DUAL
UNION
SELECT a.seqcolaborador,
       a.nome,
       a.sexo,
       a.dtanascimento,
       a.email,
       a.situacao
FROM tb_speedtoherocolaborador a
WHERE a.situacao = 'A';


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
              );

SELECT * FROM tb_speedtoherocolaborador;

SELECT a.seqcolaborador,
       a.seqequipamento,
       a.dtalocacao,
       a.dtadevolucao
FROM tb_speedtoherolocacao a;


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

SELECT b.seqcolaborador,
       a.seqequipamento,
       a.nome, 
       a.seqespecie,
       c.especie,
       b.dtalocacao,
       b.dtadevolucao
FROM tb_speedtoheroequipamento a,
     tb_speedtoherolocacao b,
     tb_speedtoheroespecie c
WHERE a.seqequipamento = b.seqequipamento
AND a.seqespecie = c.seqespecie
AND b.dtadevolucao IS NULL
ORDER BY a.seqequipamento ASC;


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


SELECT NULL AS 'seqcolaborador',
       '' AS 'nome',
       '' AS 'sexo',
       '' AS 'dtanascimento',
       '' AS 'email',
       '' AS 'situacao'
FROM DUAL
UNION
SELECT a.seqcolaborador,
       a.nome,
       a.sexo,
       a.dtanascimento,
       a.email,
       a.situacao
       



SELECT NULL AS 'seqespecie',
       '' AS 'especie'
 FROM DUAL
UNION
SELECT a.seqespecie,
       a.especie 
FROM tb_speedtoheroespecie a;

SELECT * FROM tb_speedtoherolocacao

SELECT * 
FROM tb_speedtoherocolaborador
WHERE 1 = 1 AND nome LIKE '*az*'


-- Locacoes Relatorios
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


SELECT a.seqcolaborador,
       b.nome AS nomecolaborador,
       a.seqequipamento,
       c.nome AS nomequipamento,
       d.seqespecie,
       d.especie,
       a.dtalocacao,
       a.dtadevolucao,
       IF(a.dtadevolucao IS NULL,'Alocado',(DATE_FORMAT(STR_TO_DATE(a.dtadevolucao,'%Y-%m-%d'),'%Y-%m-%d'))) AS decode_dtadevolucao
FROM tb_speedtoherolocacao a,
     tb_speedtoherocolaborador b,
     tb_speedtoheroequipamento c,
     tb_speedtoheroespecie d
WHERE a.seqcolaborador = b.seqcolaborador
AND a.seqequipamento = c.seqequipamento
AND c.seqespecie = d.seqespecie;
SELECT * FROM tb_speedtoheroequipamento;

SELECT a.seqcolaborador,
       b.nome AS nomecolaborador,
       a.seqequipamento,
       c.nome AS nomequipamento,
       d.seqespecie,
       d.especie,
       a.dtalocacao,
       a.dtadevolucao,
       IF(a.dtadevolucao IS NULL,'Alocado',(STR_TO_DATE(a.dtadevolucao,'%Y-%m-%d'))) AS decode_dtadevolucao
FROM tb_speedtoherolocacao a,
     tb_speedtoherocolaborador b,
     tb_speedtoheroequipamento c,
     tb_speedtoheroespecie d
WHERE a.seqcolaborador = b.seqcolaborador
AND a.seqequipamento = c.seqequipamento
AND c.seqespecie = d.seqespecie;
SELECT * FROM tb_speedtoheroequipamento;


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

SELECT a.seqcolaborador,
       b.nome AS nomecolaborador,
       a.seqequipamento,
       c.nome AS nomequipamento,
       c.seqespecie,
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
AND c.seqespecie = d.seqespecie
-- AND c.seqespecie = 3;
-- AND a.seqequipamento = 11;
-- AND (dtalocacao is not null AND dtadevolucao is not null); Alocados e devolvidos


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

