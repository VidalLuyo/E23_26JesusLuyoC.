-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-05-30 17:28:06.365

-- tables
-- Table: ADMINISTROR
CREATE TABLE ADMINISTROR (
    id int  NOT NULL,
    name varchar(60)  NOT NULL,
    last_name varchar(60)  NOT NULL,
    dni char(8)  NOT NULL,
    email varchar(150)  NOT NULL,
    password varchar(150)  NOT NULL,
    active char(1)  NOT NULL,
    CONSTRAINT ADMINISTROR_pk PRIMARY KEY  (id)
);

-- Table: BRANCH
CREATE TABLE BRANCH (
    id int  NOT NULL,
    name varchar(60)  NOT NULL,
    description varchar(120)  NOT NULL,
    price decimal(4,2)  NOT NULL,
    amount int  NOT NULL,
    active char(1)  NOT NULL,
    administrator_id int  NOT NULL,
    CONSTRAINT BRANCH_pk PRIMARY KEY  (id)
);

-- Table: DELIVERY
CREATE TABLE DELIVERY (
    id int  NOT NULL,
    address varchar(150)  NOT NULL,
    date date  NOT NULL,
    state char(1)  NOT NULL,
    sale_id int  NOT NULL,
    seller_id int  NOT NULL,
    CONSTRAINT DELIVERY_pk PRIMARY KEY  (id)
);

-- Table: PRODUCT
CREATE TABLE PRODUCT (
    id int  NOT NULL,
    name varchar(60)  NOT NULL,
    desciption varchar(120)  NOT NULL,
    price decimal(4,2)  NOT NULL,
    amount int  NOT NULL,
    CONSTRAINT PRODUCT_pk PRIMARY KEY  (id)
);

-- Table: SALE
CREATE TABLE SALE (
    id int  NOT NULL,
    date date  NOT NULL,
    amount int  NOT NULL,
    cost decimal(4,2)  NOT NULL,
    state char(1)  NOT NULL,
    seller_id int  NOT NULL,
    product_id int  NOT NULL,
    CONSTRAINT SALE_pk PRIMARY KEY  (id)
);

-- Table: SELLER
CREATE TABLE SELLER (
    id int  NOT NULL,
    name varchar(60)  NOT NULL,
    last_name varchar(60)  NOT NULL,
    dni char(8)  NOT NULL,
    email varchar(150)  NOT NULL,
    branch_id int  NOT NULL,
    CONSTRAINT SELLER_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: ENTREGA_VENDEDOR (table: DELIVERY)
ALTER TABLE DELIVERY ADD CONSTRAINT ENTREGA_VENDEDOR
    FOREIGN KEY (seller_id)
    REFERENCES SELLER (id);

-- Reference: ENTREGA_VENTA (table: DELIVERY)
ALTER TABLE DELIVERY ADD CONSTRAINT ENTREGA_VENTA
    FOREIGN KEY (sale_id)
    REFERENCES SALE (id);

-- Reference: SALE_PRODUCT (table: SALE)
ALTER TABLE SALE ADD CONSTRAINT SALE_PRODUCT
    FOREIGN KEY (product_id)
    REFERENCES PRODUCT (id);

-- Reference: SALE_SELLER (table: SALE)
ALTER TABLE SALE ADD CONSTRAINT SALE_SELLER
    FOREIGN KEY (seller_id)
    REFERENCES SELLER (id);

-- Reference: SELLER_SUCURSAL (table: SELLER)
ALTER TABLE SELLER ADD CONSTRAINT SELLER_SUCURSAL
    FOREIGN KEY (branch_id)
    REFERENCES BRANCH (id);

-- Reference: SUCURSAL_ADMINISTROR (table: BRANCH)
ALTER TABLE BRANCH ADD CONSTRAINT SUCURSAL_ADMINISTROR
    FOREIGN KEY (administrator_id)
    REFERENCES ADMINISTROR (id);

-- End of file.

