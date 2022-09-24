USE Lanterna_Verde;

CREATE TABLE Usuario (
    email VARCHAR(30) NOT NULL,
    nome VARCHAR(30),
    senha VARCHAR(30),
    PRIMARY KEY (email)
);

CREATE TABLE Analista (
    email VARCHAR(30) NOT NULL,
    cpf INTEGER(11) NOT NULL,
    disponivel BOOL,
    especialidade VARCHAR(50),
    PRIMARY KEY (cpf),
    FOREIGN KEY (email) REFERENCES Usuario(email)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
);

CREATE TABLE Administrador (
    email VARCHAR(30) NOT NULL,
    id_admin INTEGER(5) NOT NULL,
    funcao ENUM(''),
    PRIMARY KEY (id_admin),
    FOREIGN KEY (email) REFERENCES Usuario(email)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
);

CREATE TABLE Empresa (
    email VARCHAR(30) NOT NULL,
    cnpj INTEGER(14) NOT NULL,
    endereco VARCHAR(100),
    PRIMARY KEY (cnpj),
    FOREIGN KEY (email) REFERENCES Usuario(email)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
);

CREATE TABLE EspecialidadeEmp (
    cnpjEmpresa INTEGER(14) NOT NULL,
    especialidade VARCHAR(15) NOT NULL,
    PRIMARY KEY (cnpjEmpresa, especialidade),
    FOREIGN KEY (cnpjEmpresa) REFERENCES Empresa(cnpj)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
);

CREATE TABLE Consumidor (
    id_cons INTEGER(5) NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30),
    PRIMARY KEY (id_cons)
);

CREATE TABLE Avalia (
    idConsumidor INTEGER(5) NOT NULL,
    cnpjEmpresa INTEGER(14) NOT NULL,
    nota FLOAT(1,2),
    PRIMARY KEY (idConsumidor, cnpjEmpresa),
    FOREIGN KEY (idConsumidor) REFERENCES Consumidor(id_cons)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE,
    FOREIGN KEY (cnpjEmpresa) REFERENCES  Empresa(cnpj)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
);

CREATE TABLE Comenta (
    idConsumidor INTEGER(5) NOT NULL,
    cnpjEmpresa INTEGER(14) NOT NULL,
    comentario CHAR(200),
    PRIMARY KEY (idConsumidor, cnpjEmpresa),
    FOREIGN KEY (idConsumidor) REFERENCES Consumidor(id_cons)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE,
    FOREIGN KEY (cnpjEmpresa) REFERENCES  Empresa(cnpj)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
);

CREATE TABLE FazAnalise (
    cpfAnalista INTEGER(11) NOT NULL,
    cnpjEmpresa INTEGER(12) NOT NULL,
    comentario CHAR(500),
    score FLOAT(3,2),
    autorizada BOOL,
    deadline DATE,
    PRIMARY KEY (cpfAnalista, cnpjEmpresa),
    FOREIGN KEY (cpfAnalista) REFERENCES Analista(cpf)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE,
    FOREIGN KEY (cnpjEmpresa) REFERENCES Empresa(cnpj)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
);

CREATE TABLE SugestaoDeEmpresa (
    id_suge INTEGER(5) NOT NULL AUTO_INCREMENT,
    cnpj INTEGER(14),
    nomeEmpresa VARCHAR(30),
    informacaoContato INTEGER(11),
    idConsumidor INTEGER(5) NOT NULL,
    descricao CHAR(100),
    qtd_sugestao_empresa TINYINT,
    PRIMARY KEY (id_suge),
    FOREIGN KEY (idConsumidor) REFERENCES Consumidor(id_cons)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
);

CREATE TABLE Noticia (
    id_noti INTEGER(5) NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(30),
    autor VARCHAR(30),
    corpo VARCHAR(500),
    dataHora DATETIME,
    idAdmin INTEGER(5) NOT NULL,
    PRIMARY KEY (id_noti),
    FOREIGN KEY (idAdmin) REFERENCES Administrador(id_admin)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
);

CREATE TABLE SolicitacaoAnalise (
    id_soli INTEGER(5) NOT NULL AUTO_INCREMENT,
    cnpjEmpresa INTEGER(14) NOT NULL,
    descricao CHAR(200),
    dataHora DATETIME,
    PRIMARY KEY (id_soli),
    FOREIGN KEY (cnpjEmpresa) REFERENCES Empresa(cnpj)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
);