Create database E23_26JesusLuyo;

use E23_26JesusLuyo;

CREATE TABLE ADMINISTROR (
    id int NOT NULL,
    name varchar(60)  NOT NULL,
    last_name varchar(60)  NOT NULL,
    dni char(8)  NOT NULL,
    email varchar(150)  NOT NULL,
    password varchar(150)  NOT NULL,
    active char(1)  default 'A' check(active = 'A' or active = 'I') NOT NULL,
    CONSTRAINT ADMINISTROR_pk PRIMARY KEY  (id)
);

-- Tabla BRANCH
CREATE TABLE BRANCH (
    id int  NOT NULL,
    name varchar(60)  NOT NULL,
    description varchar(120)  NOT NULL,
    price decimal(4,2)  NOT NULL,
    amount int  NOT NULL,
    active char(1)  default 'A' check(active = 'A' or active = 'I')  NOT NULL,
    administrator_id int  NOT NULL,
    CONSTRAINT BRANCH_pk PRIMARY KEY(id)
);

-- Tabla DELIVERY
CREATE TABLE DELIVERY (
    id int  NOT NULL,
    address varchar(150)  NOT NULL,
    date date  NOT NULL,
    state char(1) default 'A' check(state = 'A' or state = 'I') NOT NULL,
    sale_id int  NOT NULL,
    seller_id int  NOT NULL,
    CONSTRAINT DELIVERY_pk PRIMARY KEY  (id)
);

-- Tabla PRODUCT
CREATE TABLE PRODUCT (
    id int  NOT NULL,
    name varchar(60)  NOT NULL,
    desciption varchar(120)  NOT NULL,
    price decimal(4,2)  NOT NULL,
    amount int  NOT NULL,
    CONSTRAINT PRODUCT_pk PRIMARY KEY  (id)
);

-- Tabla SALE
CREATE TABLE SALE (
    id int  NOT NULL,
    date date  NOT NULL,
    amount int  NOT NULL,
    cost decimal(4,2)  NOT NULL,
    state char(1) default 'A' check(state = 'A' or state = 'I')  NOT NULL,
    seller_id int  NOT NULL,
    product_id int  NOT NULL,
    CONSTRAINT SALE_pk PRIMARY KEY  (id)
);

-- Tabla SELLER
CREATE TABLE SELLER (
    id int  NOT NULL,
    name varchar(60)  NOT NULL,
    last_name varchar(60)  NOT NULL,
    dni char(8)  NOT NULL,
    email varchar(150)  NOT NULL,
    branch_id int  NOT NULL,
    CONSTRAINT SELLER_pk PRIMARY KEY  (id)
);

ALTER TABLE DELIVERY ADD CONSTRAINT ENTREGA_VENDEDOR
    FOREIGN KEY (seller_id)
    REFERENCES SELLER (id);

ALTER TABLE DELIVERY ADD CONSTRAINT ENTREGA_VENTA
    FOREIGN KEY (sale_id)
    REFERENCES SALE (id);

ALTER TABLE SALE ADD CONSTRAINT SALE_PRODUCT
    FOREIGN KEY (product_id)
    REFERENCES PRODUCT (id);

ALTER TABLE SALE ADD CONSTRAINT SALE_SELLER
    FOREIGN KEY (seller_id)
    REFERENCES SELLER (id);

ALTER TABLE SELLER ADD CONSTRAINT SELLER_SUCURSAL
    FOREIGN KEY (branch_id)
    REFERENCES BRANCH (id);

ALTER TABLE BRANCH ADD CONSTRAINT SUCURSAL_ADMINISTROR
    FOREIGN KEY (administrator_id)
    REFERENCES ADMINISTROR (id);

INSERT INTO ADMINISTROR (id, name, last_name, dni, email, password, active)
VALUES
(1, 'John', 'Doe', '12345678', 'johndoe@example.com', 'password123', 'A'),
(2, 'Jane', 'Smith', '87654321', 'janesmith@example.com', 'password456', 'A'),
(3, 'Michael', 'Johnson', '98765432', 'michaeljohnson@example.com', 'password789', 'A'),
(4, 'Emily', 'Brown', '54321678', 'emilybrown@example.com', 'passwordabc', 'A'),
(5, 'Daniel', 'Davis', '87654321', 'danieldavis@example.com', 'passworddef', 'A'),
(6, 'Olivia', 'Wilson', '98761234', 'oliviawilson@example.com', 'passwordghi', 'A'),
(7, 'Alexander', 'Taylor', '34567812', 'alexandertaylor@example.com', 'passwordjkl', 'A'),
(8, 'Sophia', 'Anderson', '56781234', 'sophiaanderson@example.com', 'passwordmno', 'A'),
(9, 'Matthew', 'Thomas', '12348765', 'matthewthomas@example.com', 'passwordpqr', 'A'),
(10, 'Isabella', 'Clark', '87651234', 'isabellaclark@example.com', 'passwordstu', 'A');


INSERT INTO BRANCH (id, name, description, price, amount, active, administrator_id)
VALUES
    (1, 'Yoga en Grupo', 'Clase de yoga en grupo para todos los niveles.', 15.00, 20, 'A', 1),
    (2, 'Entrenamiento Funcional', 'Sesión de entrenamiento funcional para mejorar la resistencia y fuerza.', 20.00, 15, 'A', 2),
    (3, 'Clases de Baile Latino', 'Aprende a bailar salsa, bachata y merengue en nuestras clases grupales.', 12.50, 30, 'A', 1),
    (4, 'Entrenamiento Personalizado', 'Entrenamiento individualizado con un instructor certificado.', 50.00, 5, 'A', 3),
    (5, 'Circuito de Cardio', 'Rutina de ejercicios cardiovasculares para quemar calorías.', 10.00, 25, 'A', 2),
    (6, 'Pilates Mat', 'Clase de pilates en colchonetas para mejorar la flexibilidad y tonificar los músculos.', 18.00, 15, 'A', 1),
    (7, 'Entrenamiento de Boxeo', 'Práctica de boxeo para mejorar la coordinación y resistencia.', 25.00, 10, 'A', 3),
    (8, 'Clases de Spinning', 'Rutinas de ciclismo indoor para fortalecer las piernas y mejorar la resistencia cardiovascular.', 14.00, 20, 'A', 2),
    (9, 'Acondicionamiento Físico', 'Entrenamiento integral para mejorar la condición física general.', 22.00, 12, 'A', 1),
    (10, 'Clases de Zumba', 'Divertidas clases de zumba con ritmos latinos y ejercicios aeróbicos.', 12.00, 18, 'A', 3);

INSERT INTO DELIVERY (id, address, date, state, sale_id, seller_id)
VALUES
    (1, 'Calle Los Pinos 123, San Vicente', '2023-05-15', 'A', 1, 1),
    (2, 'Av. Principal 456, Imperial', '2023-05-16', 'A', 2, 2),
    (3, 'Jirón Los Rosales 789, Nuevo Imperial', '2023-05-17', 'A', 3, 1),
    (4, 'Calle Las Flores 234, San Vicente', '2023-05-18', 'A', 4, 3),
    (5, 'Av. Central 567, Imperial', '2023-05-19', 'A', 5, 2),
    (6, 'Jirón Los Cerezos 890, Nuevo Imperial', '2023-05-20', 'A', 6, 1),
    (7, 'Calle Los Lirios 345, San Vicente', '2023-05-21', 'A', 7, 3),
    (8, 'Av. Libertad 678, Imperial', '2023-05-22', 'A', 8, 2),
    (9, 'Jirón Los Girasoles 901, Nuevo Imperial', '2023-05-23', 'A', 9, 1),
    (10, 'Calle Los Tulipanes 456, San Vicente', '2023-05-24', 'A', 10, 3);

INSERT INTO SELLER (id, name, last_name, dni, email, branch_id)
VALUES
    (1, 'Juan', 'Perez', '12345678', 'juan.perez@example.com', 1),
    (2, 'Maria', 'Lopez', '87654321', 'maria.lopez@example.com', 2),
    (3, 'Pedro', 'Gomez', '45678912', 'pedro.gomez@example.com', 1),
    (4, 'Ana', 'Rodriguez', '98765432', 'ana.rodriguez@example.com', 3),
    (5, 'Carlos', 'Martinez', '56789123', 'carlos.martinez@example.com', 2),
    (6, 'Laura', 'Hernandez', '32198765', 'laura.hernandez@example.com', 1),
    (7, 'Luis', 'Sanchez', '78912345', 'luis.sanchez@example.com', 3),
    (8, 'Sofia', 'Gonzalez', '23456789', 'sofia.gonzalez@example.com', 2),
    (9, 'Diego', 'Torres', '91234567', 'diego.torres@example.com', 1),
    (10, 'Valeria', 'Lopez', '67891234', 'valeria.lopez@example.com', 3);



INSERT INTO SALE (id, date, amount, cost, state, seller_id, product_id)
VALUES
    (1, '2023-05-01', 5, 25.50, 'A', 1, 1),
    (2, '2023-05-02', 3, 15.75, 'A', 2, 2),
    (3, '2023-05-03', 8, 42.00, 'A', 1, 3),
    (4, '2023-05-04', 2, 11.25, 'A', 3, 1),
    (5, '2023-05-05', 6, 31.80, 'A', 2, 2),
    (6, '2023-05-06', 4, 21.00, 'A', 1, 3),
    (7, '2023-05-07', 7, 36.75, 'A', 3, 1),
    (8, '2023-05-08', 9, 47.25, 'A', 2, 2),
    (9, '2023-05-09', 1, 5.25, 'A', 1, 3),
    (10, '2023-05-10', 3, 15.75, 'A', 3, 1);


INSERT INTO PRODUCT (id, name, desciption, price, amount)
VALUES
    (1, 'Pizza Margherita', 'Deliciosa pizza con salsa de tomate, queso mozzarella y albahaca fresca', 12.99, 20),
    (2, 'Pizza Pepperoni', 'Pizza clásica con salsa de tomate, queso mozzarella y pepperoni', 14.99, 15),
    (3, 'Pizza Hawaiana', 'Sabrosa pizza con salsa de tomate, queso mozzarella, jamón y piña', 13.99, 18),
    (4, 'Pizza BBQ', 'Pizza con salsa BBQ, pollo desmenuzado, cebolla roja y queso mozzarella', 15.99, 12),
    (5, 'Pizza Vegetariana', 'Pizza vegetariana con salsa de tomate, queso mozzarella y variedad de vegetales', 13.99, 16),
    (6, 'Pizza Mexicana', 'Pizza con salsa de tomate, queso mozzarella, carne molida, jalapeños y guacamole', 14.99, 14),
    (7, 'Pizza de Pollo y Champiñones', 'Pizza con salsa de tomate, queso mozzarella, pollo desmenuzado y champiñones', 14.99, 17),
    (8, 'Pizza Cuatro Quesos', 'Deliciosa pizza con salsa de tomate y una mezcla de cuatro quesos diferentes', 15.99, 13),
    (9, 'Pizza Calzone', 'Pizza estilo calzone rellena de salsa de tomate, queso mozzarella y pepperoni', 16.99, 10),
    (10, 'Pizza Marinera', 'Pizza con salsa de tomate, queso mozzarella, camarones, mejillones y calamares', 17.99, 9);




select*from ADMINISTROR;
select*from BRANCH;
select*from DELIVERY;
select*from SELLER;
select*from SALE;
select*from PRODUCT;