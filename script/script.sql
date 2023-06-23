
CREATE TABLE grupos (
                codigo VARCHAR NOT NULL,
                tema VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT codigo PRIMARY KEY (codigo)
);


CREATE TABLE eventos (
                cod_evento VARCHAR NOT NULL,
                codigo VARCHAR NOT NULL,
                data_evento VARCHAR NOT NULL,
                CONSTRAINT cod_evento PRIMARY KEY (cod_evento)
);


CREATE TABLE Tipo_skill (
                nome VARCHAR NOT NULL,
                Descrio VARCHAR NOT NULL,
                Skill VARCHAR NOT NULL,
                CONSTRAINT nome PRIMARY KEY (nome)
);


CREATE TABLE CARGOS (
                CARGO_CODIGO VARCHAR(2) NOT NULL,
                NOME VARCHAR NOT NULL,
                CONSTRAINT cargos_codigo PRIMARY KEY (CARGO_CODIGO)
);
COMMENT ON TABLE CARGOS IS 'Essa tabela armazena informações sobre os cargos que os colaboradores podem ocupar.';


CREATE TABLE SOFTSKILLS (
                SS_CODIGO VARCHAR(2) NOT NULL,
                NOME_TIPO_SKILL VARCHAR NOT NULL,
                CONSTRAINT ss_codigo PRIMARY KEY (SS_CODIGO)
);
COMMENT ON TABLE SOFTSKILLS IS 'Essa tabela armazena informações sobre as softskills que os colaboradores podem possuir.';


CREATE TABLE HARDSKILLS (
                HS_CODIGO VARCHAR(2) NOT NULL,
                NOME_TIPO_SKILL VARCHAR NOT NULL,
                CONSTRAINT hs_codigo PRIMARY KEY (HS_CODIGO)
);
COMMENT ON TABLE HARDSKILLS IS 'Essa tabela guarda informações sobre as hardskills que os colaboradores podem possuir.';


CREATE TABLE DEPARTAMENTO (
                DEPT_CODIGO VARCHAR(2) NOT NULL,
                NOME VARCHAR NOT NULL,
                CONSTRAINT dept_codigo PRIMARY KEY (DEPT_CODIGO)
);
COMMENT ON TABLE DEPARTAMENTO IS 'Essa tabela guarda informações referentes aos departamentos.';


CREATE TABLE COLABORADORES (
                CPF NUMERIC(11) NOT NULL,
                NOME VARCHAR NOT NULL,
                DATA_ADMISSAO DATE NOT NULL,
                SEXO VARCHAR(1),
                DEPT_CODIGO VARCHAR(2) NOT NULL,
                CARGO_CODIGO VARCHAR(2) NOT NULL,
                CONSTRAINT cpf_COLABORADORES PRIMARY KEY (CPF)
);
COMMENT ON TABLE COLABORADORES IS 'Essa tabela faz referência aos colaboradores, principais ativos da empresa.';


CREATE TABLE membros_grupo (
                data_entrada VARCHAR NOT NULL,
                COLABORADORES_CPF NUMERIC(11) NOT NULL,
                codigo VARCHAR NOT NULL,
                CONSTRAINT data_entrada PRIMARY KEY (data_entrada, COLABORADORES_CPF, codigo)
);


CREATE TABLE eventos_que_participou (
                CPF NUMERIC(11) NOT NULL,
                cod_evento VARCHAR NOT NULL,
                CONSTRAINT cpf_eventos_que_participou PRIMARY KEY (CPF, cod_evento)
);


CREATE TABLE EMAILS (
                EMAIL VARCHAR NOT NULL,
                CPF NUMERIC(11) NOT NULL,
                CONSTRAINT email PRIMARY KEY (EMAIL)
);
COMMENT ON TABLE EMAILS IS 'Essa tabela guarda informações sobre os e-mails de telefones dos colaboradores.';


CREATE TABLE HS_QUE_POSSUI (
                CPF NUMERIC(11) NOT NULL,
                HS_CODIGO VARCHAR(2) NOT NULL,
                PROEFICIENCIA NUMERIC(2) NOT NULL,
                CONSTRAINT cpf_HS_QUE_POSSUI PRIMARY KEY (CPF, HS_CODIGO)
);
COMMENT ON TABLE HS_QUE_POSSUI IS 'Essa tabela relaciona quais hardskills cada colaborador possui.';


CREATE TABLE CERTIFICACOES (
                CPF NUMERIC(11) NOT NULL,
                HS_CODIGO VARCHAR(2) NOT NULL,
                CERTIFICADO_CODIGO VARCHAR(2) NOT NULL,
                NOME VARCHAR NOT NULL,
                PROVEDOR VARCHAR NOT NULL,
                DATA_EMISSAO DATE NOT NULL,
                DATA_EXPIRACAO DATE,
                CONSTRAINT cpf_CERTIFICACOES PRIMARY KEY (CPF, HS_CODIGO, CERTIFICADO_CODIGO)
);
COMMENT ON TABLE CERTIFICACOES IS 'Essa tabela guarda informações sobre as diversas certificações que um colaborador pode possuir sobre uma hardskill específica';


CREATE TABLE SS_QUE_POSSUI (
                CPF NUMERIC(11) NOT NULL,
                SS_CODIGO VARCHAR(2) NOT NULL,
                PROEFICIENCIA NUMERIC(2) NOT NULL,
                CONSTRAINT cpf_SS_QUE_POSSUI PRIMARY KEY (CPF, SS_CODIGO)
);
COMMENT ON TABLE SS_QUE_POSSUI IS 'Essa tabela relaciona quais softskills cada colaborador possui.';


CREATE TABLE TELEFONES (
                DDD NUMERIC(2) NOT NULL,
                NUMERO_TELEFONE NUMERIC(9) NOT NULL,
                CPF NUMERIC(11) NOT NULL,
                CONSTRAINT numero_telefone PRIMARY KEY (DDD, NUMERO_TELEFONE)
);
COMMENT ON TABLE TELEFONES IS 'Essa tabela guarda informações sobre os números de telefones dos colaboradores.';


CREATE TABLE ENDERECOS (
                CEP NUMERIC NOT NULL,
                NUMERO NUMERIC(10) NOT NULL,
                CPF NUMERIC(11) NOT NULL,
                CONSTRAINT cep PRIMARY KEY (CEP, NUMERO)
);
COMMENT ON TABLE ENDERECOS IS 'Essa tabela guarda informações sobre os endereços dos colaboradores';


ALTER TABLE eventos ADD CONSTRAINT grupos_eventos_fk
FOREIGN KEY (codigo)
REFERENCES grupos (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE membros_grupo ADD CONSTRAINT grupos_membros_grupo_fk
FOREIGN KEY (codigo)
REFERENCES grupos (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE eventos_que_participou ADD CONSTRAINT eventos_eventos_que_participou_fk
FOREIGN KEY (cod_evento)
REFERENCES eventos (cod_evento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE SOFTSKILLS ADD CONSTRAINT tipo_skill_softskills_fk
FOREIGN KEY (NOME_TIPO_SKILL)
REFERENCES Tipo_skill (nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE HARDSKILLS ADD CONSTRAINT tipo_skill_hardskills_fk
FOREIGN KEY (NOME_TIPO_SKILL)
REFERENCES Tipo_skill (nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE COLABORADORES ADD CONSTRAINT cargos_colaboradores_fk
FOREIGN KEY (CARGO_CODIGO)
REFERENCES CARGOS (CARGO_CODIGO)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE SS_QUE_POSSUI ADD CONSTRAINT softskills_ss_que_possui_fk
FOREIGN KEY (SS_CODIGO)
REFERENCES SOFTSKILLS (SS_CODIGO)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE HS_QUE_POSSUI ADD CONSTRAINT hardskills_hs_que_possui_fk
FOREIGN KEY (HS_CODIGO)
REFERENCES HARDSKILLS (HS_CODIGO)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE COLABORADORES ADD CONSTRAINT departamento_colaboradores_fk
FOREIGN KEY (DEPT_CODIGO)
REFERENCES DEPARTAMENTO (DEPT_CODIGO)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ENDERECOS ADD CONSTRAINT colaboradores_enderecos_fk
FOREIGN KEY (CPF)
REFERENCES COLABORADORES (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE TELEFONES ADD CONSTRAINT colaboradores_telefones_fk
FOREIGN KEY (CPF)
REFERENCES COLABORADORES (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE SS_QUE_POSSUI ADD CONSTRAINT colaboradores_ss_que_possui_fk
FOREIGN KEY (CPF)
REFERENCES COLABORADORES (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE HS_QUE_POSSUI ADD CONSTRAINT colaboradores_hs_que_possui_fk
FOREIGN KEY (CPF)
REFERENCES COLABORADORES (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE EMAILS ADD CONSTRAINT colaboradores_emails_fk
FOREIGN KEY (CPF)
REFERENCES COLABORADORES (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE eventos_que_participou ADD CONSTRAINT colaboradores_eventos_que_participou_fk
FOREIGN KEY (CPF)
REFERENCES COLABORADORES (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE membros_grupo ADD CONSTRAINT colaboradores_membros_grupo_fk
FOREIGN KEY (COLABORADORES_CPF)
REFERENCES COLABORADORES (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE CERTIFICACOES ADD CONSTRAINT hs_que_possui_certificacoes_fk
FOREIGN KEY (CPF, HS_CODIGO)
REFERENCES HS_QUE_POSSUI (CPF, HS_CODIGO)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
