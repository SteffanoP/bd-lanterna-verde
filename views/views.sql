USE Lanterna_Verde;

# Consulta nome e senha para a autenticação
SELECT email AS 'Email', senha AS 'Senha' FROM Usuario;

# Consulta Função de um administrador
SELECT us.email AS 'Email',
       us.nome AS 'Nome',
       ad.funcao AS 'Função'
FROM Administrador ad
JOIN Usuario us on us.email = ad.email;

# View para pegar o relatório de uma empresas
CREATE OR REPLACE VIEW relatorio_empresa AS
SELECT Empresa.cnpj, FazAnalise.comentario, FazAnalise.score, FazAnalise.deadline
FROM Empresa INNER JOIN FazAnalise on Empresa.cnpj = FazAnalise.cnpjEmpresa;

# Consulta relatorio de sugestão de empresas

SELECT cnpj,nomeEmpresa,descricao FROM SugestaoDeEmpresa 
WHERE cnpj = '315487432';

# Consultar se um Analista está disponível para fazer Análises;

SELECT cpf,disponivel FROM Analista WHERE cpf = '894561231'

# View para pegar as avaliações dos consumidores
CREATE OR REPLACE VIEW avaliacaoConsumidor AS
SELECT e.cnpj, a.cnpjEmpresa, a.nota FROM Avalia a
INNER JOIN Empresa e ON a.cnpjEmpresa = e.cnpj;

# Consultar Avaliações de Consumidores para mostrar sua reputação
SELECT * FROM avaliacaoConsumidor WHERE cnpj = '315487432';

# Consultar Análises de Empresas para mostrar sua reputação a partir da View
SELECT cnpj, AVG(score) FROM relatorio_empresa
WHERE cnpj = '315487432';

-- View para comentarios de consumidores
CREATE OR REPLACE VIEW comentarios AS
SELECT Empresa.cnpj,
Consumidor.nome AS 'Consumidor',
Comentario AS 'Comentario'
FROM Consumidor, Comenta, Empresa
WHERE idConsumidor=id_cons;

-- Consulta por empresa
SELECT * FROM comentarios WHERE cnpj=146745612;

-- View para solicitacoes de analise
CREATE OR REPLACE VIEW solicitacoesdeanalise AS
SELECT cnpjEmpresa,
descricao AS 'Descrição',
dataHora AS 'Data'
FROM SolicitacaoAnalise;

-- Consulta de solicitacoes
SELECT * FROM solicitacoesdeanalise;

# Cria View para as Notícias do website
CREATE OR REPLACE VIEW Notícias AS
SELECT titulo AS 'Título',
       autor AS 'Autor',
       corpo AS 'Corpo',
       dataHora AS 'Data'
FROM Noticia;
