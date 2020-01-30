DROP DATABASE IF EXISTS dnds_db;
CREATE DATABASE dnds_db;

USE dnds_db;

CREATE TABLE npcs (
    id INT AUTO_INCREMENT NOT NULL,
    fullname VARCHAR(30) NOT NULL,
    race VARCHAR(15) NOT NULL,
    descript VARCHAR(250) NOT NULL,
    personality VARCHAR(20) NOT NULL, 
    profession VARCHAR(20) NOT NULL, 
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT NOT NULL,
    username VARCHAR(25) NOT NULL,
    pass VARCHAR(16) NOT NULL,
    email VARCHAR(25) NOT NULL,
    actType BOOLEAN NOT NULL,    
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT NOT NULL,
    username VARCHAR(25) NOT NULL,
    pass VARCHAR(16) NOT NULL,
    email VARCHAR(25) NOT NULL,
    actType BOOLEAN NOT NULL,    
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE chats (
    id INT AUTO_INCREMENT NOT NULL,
    ownerId INT NOT NULL,
    username VARCHAR(25) NOT NULL,
    contents VARCHAR(125) NOT NULL,   
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, ownerId)
);