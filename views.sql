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
