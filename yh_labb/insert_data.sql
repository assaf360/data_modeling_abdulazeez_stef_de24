INSERT INTO Program (program_name, start_date, end_date, credits, description) VALUES
('Systemutvecklare .NET', '2024-08-20', '2026-06-15', 400, 'Tvåårigt YH-program');

INSERT INTO Utbildningsledare (first_name, last_name, email, address) VALUES
('Anna', 'Andersson', 'anna.andersson@yh.se', 'Stockholm');

INSERT INTO Klass (program_id, utbildningsledare_id, max_capacity) VALUES
(1, 1, 30);  

INSERT INTO Student (first_name, last_name, personal_number, email, klass_id) VALUES
('Erik', 'Svensson', '199001011234', 'erik.svensson@student.se', 1),
('Maria', 'Karlsson', '199502028765', 'maria.karlsson@student.se', 1),
('Johanna', 'Pettersson', '199604151234', 'johanna.pettersson@student.se', 1);

INSERT INTO Kurs (kurs_name, credits, description) VALUES
('Databasteknik', 20, 'Grundläggande SQL');

INSERT INTO Program_kurs (program_id, kurs_id) VALUES
(1, 1); 


INSERT INTO Company (company_org_number, has_f_skatt) VALUES
('556677-8899', TRUE);

INSERT INTO Utbildare (first_name, last_name, is_consult, company_id) VALUES
('Lisa', 'Nilsson', TRUE, 1),
('Kalle', 'Johansson', FALSE, NULL);  

INSERT INTO Utbildare_kurs (utbildare_id, kurs_id) VALUES
(1, 1), 
(2, 1); 
