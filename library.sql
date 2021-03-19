drop database if exists library;

create database library;

Use library;

drop table if exists clients;

create table clients 
(
    id int primary key auto_increment not null,
    FirstName varchar(25) not null,
    LastName varchar(25) not null,
    Birthday date,
    Phone varchar (10) not null unique,
    Mail varchar (40) not null unique
);

drop table if exists authors;

create table authors 
(
    id int primary key auto_increment not null,
    Name varchar (25),
    Birthday date not null
);

drop table if exists books ;

create table books 
(
    id int primary key auto_increment not null,
    Title varchar(75) not null unique,
    Height int(4),
    Genre varchar(25) default null,
    Publisher varchar(25) default null,
    Author int default null,
    constraint books_authors_id foreign key (Author) references authors (id) on delete cascade
)engine=InnoDB default charset=utf8 collate=utf8_general_ci;

drop table if exists registrations; 

create table registrations
(
    id int primary key auto_increment not null,
    DateBorrow date not null,
    DateReservation date not null,
    Book int default null,
    client int default null,
    constraint registrations_books_id foreign key (Book) references books (id) on delete cascade,
    constraint registrations_clients_id foreign key (Client) references clients (id) on delete cascade
)engine=InnoDB default charset=utf8 collate=utf8_general_ci;