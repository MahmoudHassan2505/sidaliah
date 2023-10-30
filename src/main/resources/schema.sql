BEGIN;


CREATE TABLE IF NOT EXISTS useage
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    prescription_id bigint NOT NULL,
    date date NOT NULL,
    CONSTRAINT useage_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS prescription
(
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    is_allowed boolean NOT NULL,
    pateint_id bigint NOT NULL,
    CONSTRAINT prescription_pkey PRIMARY KEY (id),
    CONSTRAINT prescription_id_key UNIQUE (id)
);

CREATE TABLE IF NOT EXISTS prescription_category
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying NOT NULL,
    CONSTRAINT prescription_category_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS patient
(
    national_id bigint NOT NULL,
    student_id bigint,
    is_chronic boolean NOT NULL,
    name character varying NOT NULL,
    gender character varying ,
    level character varying ,
    phone_number character varying ,
    CONSTRAINT pateint_pkey PRIMARY KEY (national_id)
);

CREATE TABLE IF NOT EXISTS patient_disease
(
    patient_id bigint NOT NULL,
    disease_id bigint NOT NULL
);

CREATE TABLE IF NOT EXISTS disease
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying NOT NULL,
    CONSTRAINT disease_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS useage_medicine
(
    useage_id bigint NOT NULL,
    medicine_id bigint NOT NULL,
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    price bigint NOT NULL,
    CONSTRAINT useage_medicine_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS medicine
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    barcode bigint NOT NULL,
    name character varying NOT NULL,
    dosageform character varying,
    strength character varying,
    manufacturer character varying,
    activeingredient character varying NOT NULL,
    alertexpired date NOT NULL,
    alertamount bigint NOT NULL,
    category_id bigint NOT NULL,
    arabicname character varying NOT NULL,
    CONSTRAINT medicine_pkey PRIMARY KEY (id),
    CONSTRAINT barcode_unique UNIQUE (barcode)
);

CREATE TABLE IF NOT EXISTS medicine_category
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying NOT NULL,
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

ALTER TABLE IF EXISTS useage
    ADD CONSTRAINT "prescription_FK" FOREIGN KEY (prescription_id)
        REFERENCES prescription (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_prescription_FK"
    ON useage(prescription_id);


ALTER TABLE IF EXISTS prescription
    ADD CONSTRAINT "category_FK" FOREIGN KEY (category_id)
        REFERENCES prescription_category (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_category_FK"
    ON prescription(category_id);


ALTER TABLE IF EXISTS prescription
    ADD CONSTRAINT "patient_prescription_FK" FOREIGN KEY (pateint_id)
        REFERENCES patient (national_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_patient_prescription_FK"
    ON prescription(pateint_id);


ALTER TABLE IF EXISTS patient_disease
    ADD CONSTRAINT "disease_FK" FOREIGN KEY (disease_id)
        REFERENCES disease (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
CREATE INDEX IF NOT EXISTS fki_p
    ON patient_disease(disease_id);


ALTER TABLE IF EXISTS patient_disease
    ADD CONSTRAINT "patient_FK" FOREIGN KEY (patient_id)
        REFERENCES patient (national_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_patient_FK"
    ON patient_disease(patient_id);


ALTER TABLE IF EXISTS useage_medicine
    ADD CONSTRAINT "medicine_useage_FK" FOREIGN KEY (medicine_id)
        REFERENCES medicine (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_medicine_useage_FK"
    ON useage_medicine(medicine_id);


ALTER TABLE IF EXISTS useage_medicine
    ADD CONSTRAINT "useage_FK" FOREIGN KEY (useage_id)
        REFERENCES useage (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_useage_FK"
    ON useage_medicine(useage_id);


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


ALTER TABLE IF EXISTS public.order_medicine
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