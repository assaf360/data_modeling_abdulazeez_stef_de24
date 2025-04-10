--Program
CREATE TABLE Program (
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    credits INT,
    description TEXT
);

--Utbildningsledare
CREATE TABLE Utbildningsledare (
    utbildningsledare_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(255)
);

--Klass
CREATE TABLE Klass (
    klass_id SERIAL PRIMARY KEY,
    program_id INTEGER REFERENCES Program(program_id),
    utbildningsledare_id INTEGER REFERENCES Utbildningsledare(utbildningsledare_id),
    max_capacity INTEGER
);

--Student_private
CREATE TABLE Student_private (
    student_id SERIAL PRIMARY KEY,
    personal_number VARCHAR(12),
    address VARCHAR(255),
    email VARCHAR(100)
);

--Student
CREATE TABLE Student (
    student_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(20),
    birth_date DATE,
    klass_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES Student_private(student_id),
    FOREIGN KEY (klass_id) REFERENCES Klass(klass_id)
);

--Kurs
CREATE TABLE Kurs (
    kurs_id SERIAL PRIMARY KEY,
    kurs_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    credits INT,
    description TEXT
);

--Program_kurs (join-tabell mellan Program och Kurs)
CREATE TABLE Program_kurs (
    program_id INTEGER REFERENCES Program(program_id),
    kurs_id INTEGER REFERENCES Kurs(kurs_id),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (program_id, kurs_id)
);

--Company (för externa utbildare/konsulter)
CREATE TABLE Company (
    company_id SERIAL PRIMARY KEY,
    company_org_number VARCHAR(20),
    address VARCHAR(255),
    hourly_rate DECIMAL(8,2),
    has_f_skatt BOOLEAN
);

--Utbildare
CREATE TABLE Utbildare (
    utbildare_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    is_consult BOOLEAN,
    company_id INTEGER REFERENCES Company(company_id),
    hourly_rate DECIMAL(8,2)
);

--Utbildare_kurs (join-tabell mellan Utbildare och Kurs)
CREATE TABLE Utbildare_kurs (
    utbildare_id INTEGER REFERENCES Utbildare(utbildare_id),
    kurs_id INTEGER REFERENCES Kurs(kurs_id),
    PRIMARY KEY (utbildare_id, kurs_id)
);
