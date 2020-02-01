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

CREATE TABLE locations (
    id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(50) NOT NULL,
    notes VARCHAR(150) NOT NULL,
    parentLocale VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT NOT NULL,
    username VARCHAR(25) NOT NULL,
    pass VARCHAR(16) NOT NULL,
    email VARCHAR(50) NOT NULL,
    actType BOOLEAN NOT NULL,    
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE characters (
    id INT AUTO_INCREMENT NOT NULL,
    charName VARCHAR (300) NOT NULL,
    class VARCHAR (300) NOT NULL,
    lvl INTEGER NOT NULL,
    experience INTEGER NOT NULL,
    race VARCHAR (300) NOT NULL,
    align VARCHAR (200) NOT NULL,    
    profBonus INTEGER NOT NULL,
    AC INTEGER NOT NULL,
    speed INTEGER NOT NULL,
    maxHd INTEGER NOT NULL,
    strength INTEGER NOT NULL,
    dex INTEGER NOT NULL,
    constitution INTEGER NOT NULL,
    intelligence INTEGER NOT NULL,
    wisdom INTEGER NOT NULL,
    charisma INTEGER NOT NULL,
    inventory VARCHAR (100) NOT NULL,
    notes VARCHAR (200) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE chats (
    id INT AUTO_INCREMENT NOT NULL,
    message_content VARCHAR(150) NOT NULL,
    user_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
