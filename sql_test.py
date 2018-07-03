import pandas as pd
import mysql.connector as sql

db_connection = sql.connect(host='192.168.0.5', port='3306', database='cancer_sucks', user='cs_user',
                            password='cancersucks')

counts_data = pd.read_sql("""
    select 
        concat(p.person_last_name, ', ', p.person_first_name) `name`,
        e.date_start,
        ec.wbc,
        ec.hgb,
        ec.plt,
        ec.gran_percent,
        ec.anc
    from `event` e
    inner join event_cbc ec on e.event_id = ec.event_id
    inner join person p on e.person_id = p.person_id;
""", con=db_connection)

chemo_data = pd.read_sql("""
    select
        concat(p.person_last_name, ', ', p.person_first_name) `name`,
        e.date_start,
        sum(m.name = 'Cisplatin') As `Cisplatin`,
        sum(m.name = 'Doxorubicin') As `Doxorubicin`,
        sum(m.name = 'Methotrexate') As `Methotrexate`
    from `event` e
    inner join `event_medication` em on e.event_id = em.event_id
    inner join `medication` m on em.medication_id = m.medication_id
    inner join `medication_type` mt on m.medication_type_id = mt.medication_type_id
    inner join `person` p on e.person_id = p.person_id
    where mt.description = 'Chemotherapy'
    group by concat(p.person_last_name, ', ', p.person_first_name),
        e.date_start
    order by e.date_start;
""", con=db_connection)

neulasta_data = pd.read_sql("""
    select
        concat(p.person_last_name, ', ', p.person_first_name) `name`,
        e.date_start,
        m.name,
        em.dose,
        em.dose_um
    from `event` e
    inner join `event_medication` em on e.event_id = em.event_id
    inner join `medication` m on em.medication_id = m.medication_id
    inner join `medication_type` mt on m.medication_type_id = mt.medication_type_id
    inner join `person` p on e.person_id = p.person_id
    where mt.description = 'Injection'
    and m.name = 'Neulasta'
    order by e.date_start;
""", con=db_connection)

print(counts_data)
print(chemo_data)
print(neulasta_data)