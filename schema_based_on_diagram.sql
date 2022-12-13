CREATE TABLE patients (
    id int PRIMARY KEY GENEREATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
);

CREATE TABLE medical_histories(
    id          INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id  INT REFERENCES patients(id),
    status      VARCHAR(300)
);

CREATE TABLE treatments(
    id          INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type        VARCHAR(200),
    name        VARCHAR(60)
);

CREATE TABLE invoices(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount         DECIMAL,
    generated_at         TIMESTAMP,
    payed_at             TIMESTAMP,
    medical_history_id   INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price      DECIMAL,
    quantity        INT,
    total_price     DECIMAL,
    invoice_id      INT REFERENCES invoices(id),
    treatment_id    INT REFERENCES treatments(id)
);

-- join table

CREATE TABLE medical_treatment(
    treatments_id INT REFERENCES treatments(id),
    medical_histories_id INT REFERENCES medical_histories(id)
);