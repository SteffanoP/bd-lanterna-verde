USE Lanterna_Verde;

# Consulta nome e senha para a autenticação
SELECT email AS 'Email', senha AS 'Senha' FROM Usuario;

# Consulta Função de um administrador
SELECT us.email AS 'Email',
       us.nome AS 'Nome',
       ad.funcao AS 'Função'
FROM Administrador ad
JOIN Usuario us on us.email = ad.email;

# Cria View para as Notícias do website
CREATE OR REPLACE VIEW Notícias AS
SELECT titulo AS 'Título',
       autor AS 'Autor',
       corpo AS 'Corpo',
       dataHora AS 'Data'
FROM Noticia;

# View para pegar as avaliações dos consumidores 
CREATE OR REPLACE VIEW avaliacaoConsumidor AS
SELECT e.cnpj, a.cnpjEmpresa, a.nota FROM Avalia a
INNER JOIN empresa e ON a.cnpjEmpresa = e.cnpj;

# Consultar Avaliações de Consumidores para mostrar sua reputação
SELECT * FROM avaliacaoConsumidor WHERE cnpj = '315487432';

# View para pegar o relatório de uma empresas
CREATE OR REPLACE VIEW relatorio_empresa AS
SELECT empresa.cnpj, fazanalise.comentario, fazanalise.score, fazanalise.deadline
FROM empresa INNER JOIN fazanalise on empresa.cnpj = fazanalise.cnpjEmpresa;

# Consultar Análises de Empresas para mostrar sua reputação a partir da View
SELECT cnpj, AVG(score) FROM relatorio_empresa
WHERE cnpj = '315487432';

-- View para comentarios de consumidores
CREATE OR REPLACE VIEW comentarios AS
SELECT empresa.cnpj,
consumidor.nome AS 'Consumidor', 
comentario AS 'Comentario' 
FROM consumidor, comenta, empresa, usuario
WHERE idConsumidor=id_cons AND empresa.email=usuario.email;

-- Consulta por empresa
SELECT * FROM comentarios WHERE cnpj=146745612;

-- View para solicitacoes de analise
CREATE OR REPLACE VIEW solicitacoesdeanalise AS
SELECT cnpjEmpresa, 
descricao AS 'Descrição', 
dataHora AS 'Data' 
FROM solicitacaoanalise;

-- Consulta de solicitacoes
SELECT * FROM solicitacoesdeanalise;
