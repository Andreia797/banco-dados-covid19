


/*
Criação das tabelas
*/

CREATE TABLE tb_Acompanhante(
IdAcompanhante INT PRIMARY KEY IDENTITY (1,1), 
nmAcompanhante VARCHAR(50) NOT NULL, -- Obriatorio
telefone VARCHAR (15),
Concelho VARCHAR(50) NOT NULL, -- Obriatorio
Parentesco VARCHAR(50) NOT NULL, -- Obriatorio
);

-- Inserir dados na tabela Acompanhante 
-- INSRT INTO [nome da tabela] ([colunas]) VALUES()

INSERT INTO tb_Acompanhante VALUES('JakimTakeiro','9763453','PeDekabuska','Pai') 


CREATE  TABLE tb_Consulta(
IdConsulta INT PRIMARY KEY IDENTITY (1,1),
Data DATE,
Localizacao VARCHAR (50) NOT NULL, -- Obriatorio,
);

INSERT INTO tb_Consulta
VALUES('Fazenda')


CREATE TABLE tb_Fornecedor(
IdFornecedor  INT PRIMARY KEY IDENTITY (1,1),
nmFornecedor VARCHAR(50) NOT NULL, -- Obriatorio
Data DATE,
Localizacao VARCHAR (50) NOT NULL, -- Obriatorio
);
INSERT INTO tb_Fornecedor
VALUES('Alilu','Portugal')


CREATE TABLE tb_Funcionario(
IdFuncionario  INT PRIMARY KEY IDENTITY (1,1), 
nmFuncionario VARCHAR(50) NOT NULL, -- Obriatorio
Nif VARCHAR (50) NOT NULL, -- Obriatorio
telefone VARCHAR (15),
Cargo VARCHAR(50) NOT NULL, -- Obriatorio
);
INSERT INTO tb_Funcionario
VALUES('Tito','19876f','5956743','Alto')


CREATE  TABLE tb_Hospital(
IdHospital INT PRIMARY KEY IDENTITY (1,1), 
IdFuncionario INT NOT NULL FOREIGN KEY REFERENCES tb_Funcionario(IdFuncionario), 
nmHospital VARCHAR (50) NOT NULL, -- Obriatorio
Localizacao VARCHAR (50) NOT NULL, -- Obriatorio
);
INSERT INTO tb_Hospital
VALUES('AgustinhoNeto','Plateau')


CREATE  TABLE tb_Ilha(
IdIlha INT PRIMARY KEY IDENTITY (1,1), 
IdHospital INT NOT NULL FOREIGN KEY REFERENCES tb_Hospital(IdHospital),
nmIlha VARCHAR (50) NOT NULL, -- Obriatorio
Localizacao VARCHAR (50) NOT NULL, -- Obriatorio
numInfetado INT,
numHabitantes INT,
numObito INT,
numRecuperado INT,
numNovoCaso INT,
);
INSERT INTO tb_Ilha(IdIlha,IdHospital,nmIlha,Localizacao,numInfetado,numHabitantes,numObito,numRecuperado,numNovoCaso)
 VALUES ('Santiago','Sotavento',10705,31897,110,6034,32)


CREATE TABLE tb_Infermeiro(
IdInfermeiro  INT PRIMARY KEY IDENTITY (1,1), 
nmInfermeiro VARCHAR(50) NOT NULL, -- Obriatorio
Nif VARCHAR (50) NOT NULL, -- Obriatorio
telefone VARCHAR (15),
);
INSERT INTO tb_Infermeiro(IdInfermeiro,nmInfermeiro,Nif,telefone)
VALUES('Tata Lopes','123987f','9785642')



CREATE TABLE tb_Laboratorio(
IdLaboratorio  INT PRIMARY KEY IDENTITY (1,1), 
IdHospital INT NOT NULL FOREIGN KEY REFERENCES tb_Hospital(IdHospital),
IdFuncionario INT NOT NULL FOREIGN KEY REFERENCES tb_Funcionario(IdFuncionario), 
nmLaboratorio VARCHAR(50) NOT NULL, -- Obriatorio
Localizacao VARCHAR (50) NOT NULL, -- Obriatorio
);
INSERT INTO tb_Laboratorio(IdLaboratorio,IdHospital,IdFuncionario,nmLaboratorio,Localizacao)
VALUES('TUMtum','Plateau')



CREATE TABLE tb_Medico(
IdMedico  INT PRIMARY KEY IDENTITY (1,1), 
IdConsulta INT NOT NULL FOREIGN KEY REFERENCES tb_Consulta(IdConsulta),
nmMedico VARCHAR(50) NOT NULL, -- Obriatorio
Especializacao VARCHAR (50) NOT NULL, -- Obriatorio
Nif VARCHAR (50) NOT NULL, -- Obriatorio
telefone VARCHAR (15),
);
INSERT INTO tb_Medico(IdMedico,IdConsulta,nmMedico,Especializacao,Nif,telefone)
VALUES('Elilu','Geral','14647f','9892315')


CREATE TABLE tb_Paciente(
IdPaciente INT PRIMARY KEY IDENTITY (1,1),
IdAcompanhante INT  NOT NULL FOREIGN KEY REFERENCES tb_Acompanhante(IdAcompanhante),
IdInfermeiro INT NOT NULL FOREIGN KEY REFERENCES tb_Infermeiro(IdInfermeiro),
IdConsulta INT NOT NULL FOREIGN KEY REFERENCES tb_Consulta(IdConsulta), 
nmPaciente VARCHAR(50) NOT NULL, -- Obriatorio
Nif VARCHAR (50),
Email VARCHAR (50),
DataNasc DATE,
Sexo VARCHAR (5),
telefone VARCHAR (15),
Concelho VARCHAR(50) NOT NULL, -- Obriatorio
DataDiagnostico DATE,
DoencaCronica VARCHAR(50) NOT NULL, -- Obriatorio
);
INSERT INTO tb_Paciente
VALUES('Elio','23456f','elio@gmail.com',GETDATE(),'masculino','9076534','Praia',GETDATE(),'diabetico')



CREATE  TABLE tb_Quarentena(
IdQuarentena INT PRIMARY KEY IDENTITY (1,1), 
IdPaciente INT NOT NULL,
Localizacao VARCHAR (50) NOT NULL, -- Obriatorio
numPaciente INT,
DataEntrada DATE,
DataSaida DATE,
);

INSERT INTO tb_Quarentena
VALUES('Varzea',32,GETDATE(),GETDATE())


CREATE  TABLE tb_Teste(
IdTeste INT PRIMARY KEY IDENTITY (1,1), 
IdPaciente INT NOT NULL FOREIGN KEY REFERENCES tb_Paciente(IdPaciente),
Localizacao VARCHAR (50) NOT NULL, -- Obriatorio
Resultado VARCHAR (50) NOT NULL, -- Obriatorio
DataTeste DATE NOT NULL, -- Obriatorio
);

INSERT INTO tb_Teste
VALUES('txada','Negativo',GETDATE())


CREATE  TABLE tb_Vacina(
IdVacina INT PRIMARY KEY IDENTITY (1,1), 
IdLaboratorio INT NOT NULL FOREIGN KEY REFERENCES tb_Laboratorio(IdLaboratorio),
IdInfermeiro INT NOT NULL FOREIGN KEY REFERENCES tb_Infermeiro(IdInfermeiro),
IdPaciente INT NOT NULL FOREIGN KEY REFERENCES tb_Paciente(IdPaciente),
IdFornecedor INT NOT NULL FOREIGN KEY REFERENCES tb_Fornecedor(IdFornecedor),
IdIlha INT NOT NULL FOREIGN KEY REFERENCES tb_Ilha(IdIlha),
nmFornecedor VARCHAR(50) NOT NULL, -- Obriatorio
Localizacao VARCHAR (50) NOT NULL, -- Obriatorio
Tipo VARCHAR (50),
DataVacina DATE,
);

INSERT INTO tb_Vacina
VALUES('Alilu','Portugal','AstroZenica',GETDATE())


CREATE  TABLE tb_Ventilador(
IdVentilador INT PRIMARY KEY IDENTITY (1,1), 
IdPaciente INT NOT NULL FOREIGN KEY REFERENCES tb_Paciente(IdPaciente),
numPaciente INT,
numObito INT,
numRecuperado INT,
DataEntrada DATE,
DataSaida DATE,
Diagnostico VARCHAR (50) NOT NULL, -- Obriatorio
);
INSERT INTO tb_Ventilador
VALUES(GETDATE(),'Curado',GETDATE())
