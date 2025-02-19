--Inserir novo colaborador

INSERT INTO brh_colaborador (matricula, nome, cpf, salario, departamento, cep, logradouro, complemento_endereco) VALUES ('A124', 'Fulano de Tal', '777.888.999-00', '7890', 'DEPTI', '06722-200', 'Avenida das Cruzadas', 'Casa 19');
INSERT INTO brh_projeto (id, nome, responsavel, inicio, fim) VALUES (5, 'BI', 'A124', to_date('2024-03-21', 'yyyy-mm-dd'), null);
INSERT INTO brh_papel (id, nome) VALUES (8, 'Especialista de Neg�cios')
INSERT INTO brh_telefone_colaborador (colaborador, numero, tipo) VALUES ('A124', '(61) 9 9999-9999', 'C');
INSERT INTO brh_telefone_colaborador (colaborador, numero, tipo) VALUES ('A124', '(61) 3030-4040', 'R');
INSERT INTO brh_email_colaborador (colaborador, email, tipo) VALUES ('A124', 'fulano@email.com', 'P');
INSERT INTO brh_email_colaborador (colaborador, email, tipo) VALUES ('A124', 'fulano.tal@brh.com', 'T');
INSERT INTO brh_dependente (cpf, colaborador, nome, parentesco, data_nascimento) VALUES ('111.222.333-44', 'A124', 'Beltrana de Tal', 'Filho(a)', to_date('1997-07-20', 'yyyy-mm-dd'));
INSERT INTO brh_dependente (cpf, colaborador, nome, parentesco, data_nascimento) VALUES ('555.666.777-88', 'A124', 'Cicrana de Tal', 'C�njuge', to_date('1979-07-12', 'yyyy-mm-dd'));

--Atualizar cadastro de colaborador
UPDATE brh_colaborador
set nome = 'Maria Mendon�a'
WHERE matricula = 'M123'

UPDATE brh_email_colaborador
set email = 'maria.mendonca@email.com'
WHERE colaborador = 'M123' and tipo = 'P'

--Relat�rio de c�njuges
SELECT colaborador, nome, data_nascimento
FROM brh_dependente WHERE parentesco = 'C�njuge';

--Relat�rio de contatos telef�nicos
SELECT colaborador AS "matricula-colaborador", numero, tipo
FROM brh_telefone_colaborador
WHERE tipo IN ('M','C')
ORDER BY "matricula-colaborador", numero;

--Excluir departamento SECAP
DELETE FROM brh_departamento WHERE sigla = 'SECAP';

--Relat�rio de departamentos
SELECT departamento AS sigla, nome FROM brh_colaborador WHERE cep = '71777-700'
AND departamento IN ('SECAP', 'SESEG');

--Relat�rio de dependentes menores de idade
SELECT colaborador AS "matricula-colaborador", nome, TRUNC(MONTHS_BETWEEN(SYSDATE, DATA_NASCIMENTO)/12) AS idade
FROM brh_dependente
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, DATA_NASCIMENTO)/12) < 18