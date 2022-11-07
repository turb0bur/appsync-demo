CREATE TABLE `cities`
(
    id         bigint unsigned not null primary key auto_increment,
    name       varchar(255)    not null,
    country_id bigint unsigned null
);

CREATE TABLE `offices`
(
    id               bigint unsigned not null primary key auto_increment,
    name             varchar(255)    not null,
    address          varchar(255)    not null,
    city_id          bigint unsigned not null,
    employees_amount int             not null default 0,
    constraint content_cities_country_id_foreign
        foreign key (city_id) references cities (id)
            on delete cascade
);

INSERT INTO cities
    (name, country_id)
VALUES ('Kyiv', 1),
       ('Lviv', 2);

INSERT INTO offices
    (name, address, city_id)
VALUES ('EPAM-Lviv-Uhorska', 'Lviv, 14A Uhorska St.', 2),
       ('EPAM-Lviv-Shevchenka', 'Lviv, 111 Shevchenko St.', 2);