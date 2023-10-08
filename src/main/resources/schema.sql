BEGIN;

CREATE TABLE IF NOT EXISTS authorities
(
    username character varying(50)  NOT NULL,
    authority character varying(50)  NOT NULL,
    CONSTRAINT authorities_idx_1 UNIQUE (username, authority)
    );

CREATE TABLE IF NOT EXISTS medicine
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    barcode bigint NOT NULL,
    name character varying  NOT NULL,
    dosageform character varying ,
    strength character varying ,
    manufacturer character varying ,
    activeingredient character varying  NOT NULL,
    alertexpired date NOT NULL,
    alertamount bigint NOT NULL,
    category_id bigint NOT NULL,
    arabicname character varying  NOT NULL,
    CONSTRAINT medicine_pkey PRIMARY KEY (id),
    CONSTRAINT barcode_unique UNIQUE (barcode)
    );

CREATE TABLE IF NOT EXISTS medicine_category
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying  NOT NULL,
    CONSTRAINT medicine_category_pkey PRIMARY KEY (id)
    );

CREATE TABLE IF NOT EXISTS order_medicine
(
    order_id bigint NOT NULL,
    medicine_id bigint NOT NULL,
    amount bigint NOT NULL,
    expirydate date NOT NULL,
    price bigint NOT NULL,
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    CONSTRAINT order_medicine_pkey PRIMARY KEY (id)
    );

CREATE TABLE IF NOT EXISTS orders
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    supplyrequest bigint NOT NULL,
    deliveryrequest bigint NOT NULL,
    supplier_id bigint NOT NULL,
    dateofsupply date NOT NULL,
    CONSTRAINT "Order_pkey" PRIMARY KEY (id)
    );

CREATE TABLE IF NOT EXISTS supplier
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying NOT NULL,
    CONSTRAINT supplier_pkey PRIMARY KEY (id)
    );

CREATE TABLE IF NOT EXISTS users
(
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    enabled smallint NOT NULL,
    phone bigint NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (username)
    );

ALTER TABLE IF EXISTS authorities
    ADD CONSTRAINT authorities_ibfk_1 FOREIGN KEY (username)
    REFERENCES users (username) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_authorities_ibfk_1
    ON authorities(username);


ALTER TABLE IF EXISTS medicine
    ADD CONSTRAINT "medicine_category_FK" FOREIGN KEY (category_id)
    REFERENCES medicine_category (id) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS order_medicine
    ADD CONSTRAINT "medicineFK" FOREIGN KEY (medicine_id)
    REFERENCES medicine (id) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_medicineFK"
    ON order_medicine(medicine_id);


ALTER TABLE IF EXISTS order_medicine
    ADD CONSTRAINT "orderFK" FOREIGN KEY (order_id)
    REFERENCES orders (id) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS orders
    ADD CONSTRAINT "order_supplier_FK" FOREIGN KEY (supplier_id)
    REFERENCES supplier (id) MATCH SIMPLE
    ON UPDATE NO ACTION
       ON DELETE NO ACTION;

END;