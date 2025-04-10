SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    u.first_name AS ledare_fornamn,
    u.last_name AS ledare_efternamn
FROM 
    Student s
JOIN 
    Klass k ON s.klass_id = k.klass_id
JOIN 
    Utbildningsledare u ON k.utbildningsledare_id = u.utbildningsledare_id
WHERE 
    k.klass_id = 1;  
   

SELECT 
    p.program_name,
    k.kurs_name,
    k.creddfis AS credits,
    ub.first_name AS utbildare_fornamn,
    ub.last_name AS utbildare_efternamn,
    CASE 
        WHEN ub.is_consult = TRUE THEN 'Konsult'
        ELSE 'Fast anställd'
    END AS anstallningstyp
FROM 
    Program p
JOIN 
    Program_kurs pk ON p.program_id = pk.program_id
JOIN 
    Kurs k ON pk.kurs_id = k.kurs_id
LEFT JOIN 
    utbildare_kurs uk ON k.kurs_id = uk.kurs_id
LEFT JOIN 
    Utbildare ub ON uk.utbildare_id = ub.utbildare_id
WHERE 
    p.program_id = 1; 


SELECT 
    u.first_name,
    u.last_name,
    u.hourly_rate,
    c.company_org_number,
    c.adress AS foretagsadress,
    c.has_f_skatt
FROM 
    Utbildare u
JOIN 
    Company c ON u.company_id = c.company_id
WHERE 
    u.is_consult = TRUE;


SELECT 
    k.klass_id,
    p.program_name,
    COUNT(s.student_id) AS antal_studenter
FROM 
    Klass k
JOIN 
    Program p ON k.program_id = p.program_id
LEFT JOIN 
    Student s ON k.klass_id = s.klass_id
GROUP BY 
    k.klass_id, p.program_name;


SELECT 
    k.kurs_name,
    k.creddfis AS credits
FROM 
    Kurs k
LEFT JOIN 
    Program_kurs pk ON k.kurs_id = pk.kurs_id
WHERE 
    pk.program_id IS NULL;


SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    CASE 
        WHEN sp.personal_number IS NULL THEN 'Saknar privat post'
        ELSE 'OK'
    END AS status
FROM 
    Student s
LEFT JOIN 
    Student_private sp ON s.student_id = sp.student_id;


