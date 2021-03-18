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
    Phone varchar(10) not null unique,
    Mail varchar(40) not null unique
);

drop table if exists genres;

create table genres
(
    id int primary key auto_increment not null,
    Name varchar(25) not null unique
);

drop table if exists publishers ;

create table publishers
(
    id int primary key auto_increment not null,
    Name varchar(25) unique
);

drop table if exists authors ;

create table authors
(
    id int primary key auto_increment not null,
    Name varchar(30),
    Birthday date not null
);

drop table if exists books;

create table books
(
    id int primary key auto_increment not null,
    Title varchar(75) not null unique,
    Height int(4),
    Genre int default null,
    Publisher int default null,
    Author int default null,
    constraint books_genres_id foreign key (Genre) references genres (id) on delete cascade,
    constraint books_publishers_id foreign key (Publisher) references publishers (id) on delete cascade,
    constraint books_authors_id foreign key (Author) references authors (id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






