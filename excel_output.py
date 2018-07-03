import pandas as pd
import mysql.connector as sql
import xlsxwriter as xl
import configparser

config = configparser.ConfigParser()
config.read('config.ini')

db_host = config['DEFAULT']['host']
db_port = config['DEFAULT']['port']
db_name = config['DEFAULT']['db_name']
db_user = config['DEFAULT']['db_user']
db_password = config['DEFAULT']['db_password']

print(db_host)
print(db_name)
print(db_user)
print(db_password)

db_connection = sql.connect(host=db_host, database=db_name, user=db_user, password=db_password)

event_sql = """
        select 
            -- concat(p.person_last_name, ', ', p.person_first_name) `name`,
            e.date_start,
            ec.wbc,
            ec.hgb,
            ec.plt,
            ec.gran_percent,
            ec.anc
        from `event` e
        inner join event_cbc ec on e.event_id = ec.event_id
        -- inner join person p on e.person_id = p.person_id
        order by e.date_start;
    """

event_data = pd.read_sql(event_sql, con=db_connection)
event_data.columns = ['Date', 'WBC', 'HGB', 'PLT', 'Gran %', 'ANC']
event_data.set_index('Date', inplace=True)

writer = pd.ExcelWriter('cbc_history.xlsx', engine='xlsxwriter')

event_data.to_excel(writer, 'CBC_History')

writer.save()

mtx_levels_sql  = """
        select
        e.date_start as `HDMTX_Date`,
        -- e.time_start as `HDMTX_Time`,
        eml.level_date as `Level_Date`,
        eml.hour as `Hour`,
        eml.`level` as `Level`,
        coalesce(eml.description, '') as `Description`
    from `event_methotrexate_levels` as eml
    left join `event_medication` as em
        on eml.event_medication_id = em.event_medication_id
    left join `event` as e
        on em.event_id = e.event_id
    order by e.date_start, eml.level_date, eml.hour;
"""

levels_data = pd.read_sql(mtx_levels_sql, con=db_connection)
levels_data.columns = ['HDMTX Date', 'Level Data', 'Hour Mark', 'Level', 'Description']
levels_data.set_index('HDMTX Date', inplace=True)

writer = pd.ExcelWriter('hdmtx_level_history.xlsx', engine='xlsxwriter')

levels_data.to_excel(writer, 'HDMTX_Levels')

writer.save()

db_connection.close()