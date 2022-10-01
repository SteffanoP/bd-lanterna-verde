USE Lanterna_Verde;

SELECT * FROM Usuario;
INSERT INTO Usuario VALUES
('gio@gmail.com', 'Giovani', '1234'),
('carla@gmail.com', 'Carla','admin'),
('luana@gmail.com', 'Luana','123');
INSERT INTO Usuario VALUES
('caio@gmail.com', 'Caio', 'senha'),
('luiza@gmail.com', 'Luiza', 'luiza'),
('marcos@hotmail.com', 'Marcos', 'm123'),
('bellemodas@hotmail.com', 'Ana', 'anab123'),
('artefatos@gmail.com', 'Davi', 'artdavi'),
('sportsfc@gmail.com', 'Paula', 'sportsp');

SELECT * FROM Administrador;
INSERT INTO Administrador VALUES
('gio@gmail.com', DEFAULT,'Diretor'),
('carla@gmail.com', DEFAULT,'Diretor'),
('luana@gmail.com', DEFAULT, 'Gerente');

SELECT * FROM Analista;
INSERT INTO Analista VALUES
('caio@gmail.com', '245678912', True, 'Ambiental'),
('luiza@gmail.com', '894561231', False, 'Florestal'),
('marcos@hotmail.com', '692581478', True, 'Sustentável');

SELECT * FROM Empresa;
INSERT INTO Empresa VALUES
('bellemodas@hotmail.com', '146745612', 'Rua das Flores, 281, Piedade'),
('artefatos@gmail.com', '315487432', 'Rua Amarela, 175, Olinda'),
('sportsfc@gmail.com', '254796863', 'Rua Gabriela, 85, Recife');

SELECT * FROM EspecialidadeEmp;
INSERT INTO EspecialidadeEmp VALUES
('146745612', 'Roupas'),
('315487432', 'Recicláveis'),
('254796863', 'Roupa');

SELECT * FROM Consumidor;
INSERT INTO Consumidor VALUES
(DEFAULT, 'Bárbara'),
(DEFAULT, 'Luan'),
(DEFAULT, 'Alice');

SELECT * FROM Avalia;
INSERT INTO Avalia VALUES
('1', '146745612', '5'),
('2', '315487432', '3.2'),
('3', '254796863', '4');

SELECT * FROM Comenta;
INSERT INTO Comenta VALUES
('1', '146745612', 'Roupas incríveis! Sendo o tecido, de fato, sustentável.'),
('2', '315487432', 'Objetos de baixa qualidade.'),
('3', '254796863', 'As roupas são interessantes.');

SELECT * FROM FazAnalise;
INSERT INTO FazAnalise VALUES
('245678912', '146745612', 'A empresa não apresenta falhas nas suas políticas sustentáveis.', '5', True, '2022-9-26'),
('894561231', '315487432', 'A empresa apresenta falhas nas suas políticas sustentáveis.', '2.50', False, '2022-10-10'),
('692581478', '254796863', 'A empresa não apresenta falhas consideráveis nas suas políticas sustentáveis.', '4.7', True, '2022-9-9');

SELECT * FROM SugestaoDeEmpresa;
INSERT INTO SugestaoDeEmpresa VALUES
(DEFAULT, NULL, 'Google', NULL, '1', NULL, '1'),
(DEFAULT, NULL, 'Amazon', NULL, '2', 'Descarte incorreto dos produtos excedidos', '1'),
(DEFAULT, NULL, 'SpaceX', NULL, '3', 'A empresa produz muito lixo espacial.', '1');

SELECT * FROM Noticia;
INSERT INTO Noticia VALUES
(DEFAULT, 'Empresa x ganha prêmio', 'Giovani', 'Após avalização baixa no site Lanter Verde, a empresa resolveu rever suas atitudes e a melhora foi excelente.', '2022-09-26 11:02:00', '1'),
(DEFAULT, 'Empresa perde pontos', 'Carla', NULL, '2022-09-22 10:30:20', '2'),
(DEFAULT, 'Empresa do grupo x cresce', 'Luana', NULL, '2022-09-20 19:02:00', '3');

SELECT * FROM SolicitacaoAnalise;
INSERT INTO SolicitacaoAnalise VALUES
(DEFAULT, '146745612', NULL, '2022-09-26 11:08:00'),
(DEFAULT, '315487432', 'Peço a avaliação da empresa, pois ela descarta seu lixo de maneira incorreta', '2022-09-26 11:08:00'),
(DEFAULT, '254796863', 'A empresa pode não estar reciclando seus tecidos como diz que faz', '2022-09-26 11:08:00');