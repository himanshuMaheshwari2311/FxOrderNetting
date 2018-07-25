CREATE DATABASE IF NOT EXISTS forexNetting;

use forexNetting;

SET sql_notes = 0;

create table if not exists instrumentInfo (
	ccyId int primary key,
	ccyCode varchar(255),
	ccyDescription text,
	ccyVariance decimal(5,2),
	ccyLot int
);

create table if not exists tradeType (
	tradeTypeId int primary key,
	tradeTypeName varchar(255)
);
    
    
create table if not exists role(	
	roleId int primary key,
	roleName varchar(255)
);

create table if not exists user (
	userId int primary key,
	username varchar(255) unique,
	password varchar(255),
	roleId int references role.roleId
);

create table if not exists client(
	clientId int primary key,
	clientCode varchar(255) unique,
	clientName varchar(255),
	clientTradingLimit bigint,
	foreign key(clientId) references user(userId)
);

create table if not exists broker(
	brokerId int primary key,
	brokerName varchar(255),
	brokerDesk varchar(255),
	brokerDesignation varchar(255),
	brokerCcyLimit bigint,
	brokerCcyPair int references instrumentInfo(ccyId),
	foreign key(brokerId) references user(userId)
);

create table if not exists orders (
	orderId int auto_increment primary key,
    clientId int references client(clientId),
    ccyId int references instrumentInfo(ccyId),
    baseNotional bigint,
    direction char,
    price bigint,
    tradeTypeId int references tradeType(tradeTypeId),
    tradeDate date,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    modifiedAt TIMESTAMP DEFAULT NULL,
    cancelledAt TIMESTAMP DEFAULT NULL,
    deletedAt TIMESTAMP DEFAULT NULL
);
    
    
SET sql_notes = 1;
    