-- =====================================================
-- Projeto: Jogo de RPG Online - SENAI
-- Atividade: Criar as tabelas com DDL
-- =====================================================

CREATE DATABASE Jogo_RPG;
GO

USE Jogo_RPG;
GO

-- 1. Tabela USUARIOS
CREATE TABLE USUARIOS (
    UsuarioId INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);
GO

-- 2. Tabela CLASSES
CREATE TABLE CLASSES (
    ClasseId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(255) NULL
);
GO

-- 3. Tabela HABILIDADES
CREATE TABLE HABILIDADES (
    HabilidadeId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);
GO

-- 4. Tabela PERSONAGENS
-- Tem 2 chaves estrangeiras: UsuarioId e ClasseId
CREATE TABLE PERSONAGENS (
    PersonagemId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Nivel INT NOT NULL DEFAULT 1,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,
    CONSTRAINT FK_PERSONAGENS_USUARIOS FOREIGN KEY (UsuarioId) REFERENCES USUARIOS(UsuarioId),
    CONSTRAINT FK_PERSONAGENS_CLASSES FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId)
);
GO

-- 5. Tabela CLASSES_HABILIDADES (tabela associativa N:N)
-- A chave primária é composta pelas duas FKs
CREATE TABLE CLASSES_HABILIDADES (
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,
    CONSTRAINT PK_CLASSES_HABILIDADES PRIMARY KEY (ClasseId, HabilidadeId),
    CONSTRAINT FK_CH_CLASSES FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId),
    CONSTRAINT FK_CH_HABILIDADES FOREIGN KEY (HabilidadeId) REFERENCES HABILIDADES(HabilidadeId)
);
GO
