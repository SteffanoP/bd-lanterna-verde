use lanterna_verde;


#View para pegar o relatório de uma empresas
CREATE OR REPLACE VIEW relatorio_empresa AS
SELECT empresa.cnpj, fazanalise.comentario, fazanalise.score, fazanalise.deadline
FROM empresa INNER JOIN fazanalise on empresa.cnpj = fazanalise.cnpjEmpresa;

select * from relatorio_empresa where cnpj = "146745612";