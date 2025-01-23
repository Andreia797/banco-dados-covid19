/*
CREATE TABLE tb_Acompanhante_Hist(
IdAcompanhante INT PRIMARY KEY IDENTITY (1,1), 
nmAcompanhante VARCHAR(50) NOT NULL, 
telefone VARCHAR (15),
Concelho VARCHAR(50) NOT NULL, 
Parentesco VARCHAR(50) NOT NULL, 
);*/

/*

CREATE TRIGGER tr_Backup_Acompanhante
ON tb_Acompanhante
FOR UPDATE
AS
 INSERT INTO tb_Acompanhante(IdAcompanhante,nmAcompanhante,telefone,Concelho,Parentesco)
 SELECT IdAcompanhante,nmAcompanhante,telefone,Concelho,Parentesco FROM deleted;
 */


 SELECT * FROM tb_Acompanhante;
 SELECT * FROM tb_Acompanhante_Hist;

