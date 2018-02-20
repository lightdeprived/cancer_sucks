#!/usr/bin/python
import create_count_plot
import os
import mysql.connector as sql
from mysql.connector import Error
import pandas as pd
import datetime
import configparser

config = configparser.ConfigParser()
config.read('config.ini')

db_host = config['DEFAULT']['host']
db_port = config['DEFAULT']['port']
db_name = config['DEFAULT']['db_name']
db_user = config['DEFAULT']['db_user']
db_password = config['DEFAULT']['db_password']


def clear():
    os.system('cls')


def add_cbc_record():
    try:

        print("""You are here to add a CBC record!
Please enter information below...
        """)

        currdt = datetime.datetime.now()

        cbc_date = input('Enter date (yyyy-mm-dd) [today]: ') or currdt.strftime('%Y-%m-%d')
        cbc_time = input('Enter time [now]: ') or currdt.strftime('%X')
        wbc = float(input('Enter WBC (K/mm3): ') or 0.00)
        hgb = float(input('Enter HGB (g/dL): ') or 0.00)
        plt = float(input('Enter PLT (k/mm3): ') or 0.00)
        gran = float(input('Enter Gran %: ') or 0.00)
        anc = float(input('Enter AGC/ANC: ') or 0.00)
        comment = input('Enter comment: ') or 'N/A'

        db_connection = sql.connect(host=db_host, database=db_name, user=db_user, password=db_password)
        cursor = db_connection.cursor()

        args = (9, 1, comment, cbc_date, cbc_date, None, None, wbc, hgb, plt, gran, anc, '')
        result = cursor.callproc('sp_add_event_cbc', args)
        print(result)

        db_connection.commit()

    except Error as e:
        print(e)

    finally:
        cursor.close()
        db_connection.close()


def add_medication_record():
    try:
        db_connection = sql.connect(host=db_host, database=db_name, user=db_user, password=db_password)
        cursor = db_connection.cursor()

        currdt = datetime.datetime.now()

        print("""You are here to add a medication record!
Please enter information below...
        """)
        med_start_date = input('Enter start date (yyyy-mm-dd) [today]: ') or currdt.strftime('%Y-%m-%d')
        med_start_time = input('Enter start time [now]: ') or currdt.strftime('%X')
        med_end_date = input('Enter end date (yyyy-mm-dd) [today]: ') or currdt.strftime('%Y-%m-%d')
        med_end_time = input('Enter end time [now]: ') or currdt.strftime('%X')

        df = pd.read_sql('SELECT medication_id, name_common, name FROM medication', db_connection)
        df.set_index('medication_id', inplace=True)
        print(df)

        med_id = input('Enter medication ID: ') or None
        dose = input('Enter dose amount: ') or None
        dose_um = input('Enter dose unit of measure: ') or None
        comment = input('Enter a comment: ') or 'Blank'

        args = (14, 1, comment, med_start_date, med_end_date, med_start_time, med_end_time, med_id,
                dose, dose_um, '')
        result = cursor.callproc('sp_add_event_medication', args)
        print(result)

        db_connection.commit()

    except Error as e:
        print(e)

    finally:
        cursor.close()
        db_connection.close()


def add_vitals_record():
    try:
        db_connection = sql.connect(host=db_host, database=db_name, user=db_user, password=db_password)
        cursor = db_connection.cursor()

        currdt = datetime.datetime.now()

        print("""You are here to add a vitals record!
Please enter information below...
        """)

        vital_start_date = input('Enter start date (yyyy-mm-dd) [today]: ') or currdt.strftime('%Y-%m-%d')
        vital_start_time = input('Enter start time [now]: ') or currdt.strftime('%X')
        vital_end_date = input('Enter end date (yyyy-mm-dd) [today]: ') or currdt.strftime('%Y-%m-%d')
        vital_end_time = input('Enter end time [now]: ') or currdt.strftime('%X')
        vital_height = input('Enter height (m): ')
        vital_weight = input('Enter weight (kg): ')
        vital_bmi = input('Enter BMI [auto]: ') or float(vital_weight) / (float(vital_height) ** 2)
        vital_temp = input('Enter temperature (F): ')
        vital_bp_s = input('Enter systolic pressure: ')
        vital_bp_d = input('Enter diastolic pressure: ')
        vital_comment = input('Enter comment: ')

        args = (16, 1, vital_comment, vital_start_date, vital_end_date, vital_start_time, vital_end_time,
                vital_height, vital_weight, vital_bmi, vital_temp, vital_bp_s, vital_bp_d, '')

        result = cursor.callproc('sp_add_event_vitals', args)
        print(result)

        db_connection.commit()

    except Error as e:
        print(e)

    finally:
        cursor.close()
        db_connection.close()


def add_surgery_record():
    try:
        db_connection = sql.connect(host=db_host, database=db_name, user=db_user, password=db_password)
        cursor = db_connection.cursor()

        currdt = datetime.datetime.now()

        print("""You are here to add a surgery record!
Please enter information below...
        """)

        surgery_start_date = input('Enter start date (yyyy-mm-dd) [today]: ') or currdt.strftime('%Y-%m-%d')
        surgery_start_time = input('Enter start time [now]: ') or currdt.strftime('%X')
        surgery_end_date = input('Enter end date (yyyy-mm-dd) [today]: ') or currdt.strftime('%Y-%m-%d')
        surgery_end_time = input('Enter end time [now]: ') or currdt.strftime('%X')
        surgery_comment = input('Enter comment: ')
        surgery_description = input('Enter surgery description: ')

        args = (17, 1, surgery_comment, surgery_start_date, surgery_end_date, surgery_start_time, surgery_end_time,
                surgery_description, '')

        result = cursor.callproc('sp_add_event_surgery', args)
        print(result)

        db_connection.commit()

    except Error as e:
        print(e)

    finally:
        cursor.close()
        db_connection.close()


def add_menu():

    menu = {}
    menu['1'] = 'Add CBC'
    menu['2'] = 'Add Medication'
    menu['3'] = 'Add Vitals'
    menu['4'] = 'Add Surgery'
    menu['X'] = 'Return'

    while True:
        options = menu.keys()

        for entry in options:
            print(entry, menu[entry])

        selection=input('Please Select: ')
        if selection == '1':
            add_cbc_record()
        elif selection == '2':
            add_medication_record()
        elif selection == '3':
            add_vitals_record()
        elif selection == '4':
            add_surgery_record()
        elif selection.upper() == 'X':
            print('Returning')
            break
        else:
            print("Unknown Option Selected!")


def plot_menu():

    menu = {}
    menu['1'] = "Create overview plot."
    menu['2'] = "Create WBC plot."
    menu['3'] = "Create AGC plot."
    menu['4'] = "Create GRAN % plot."
    menu['5'] = "Create HGB plot."
    menu['6'] = "Create PLT plot."
    menu['7'] = "Create all plots."
    menu['X'] = "Return."

    outfile_type = '.png'

    while True:
        options = menu.keys()

        for entry in options:
            print(entry, menu[entry])

        selection = input("Please Select: ")
        if selection == '1':
            print('Creating overview plot...')

            create_count_plot.create_plot_sql(['wbc', 'hgb', 'plt', 'gran_percent', 'anc'],
                                              ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                              False, True, False, 'charts/overview-plot', outfile_type)
            print('Finished creating overview plot!')
        elif selection == '2':
            print('Creating WBC plot...')

            create_count_plot.create_plot_sql(['wbc'],
                                          ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                          True, False, True, 'charts/wbc-data', outfile_type)
            print('Finished creating WBC plot!')
        elif selection == '3':
            print('Creating ANC plot...')

            create_count_plot.create_plot_sql(['anc'],
                                          ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                          True, False, True, 'charts/agc-data', outfile_type)
            print('Finished creating overview plot!')
        elif selection == '4':
            print('Creating GRAN % plot...')

            create_count_plot.create_plot_sql(['gran_percent'],
                                          ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                          True, False, True, 'charts/gran-data', outfile_type)
            print('Finished creating GRAN % plot!')
        elif selection == '5':
            print('Creating HGB plot...')

            create_count_plot.create_plot_sql(['hgb'],
                                          ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                          True, False, True, 'charts/hgb-data', outfile_type)
            print('Finished creating HGB plot!')
        elif selection == '6':
            print('Creating PLT plot...')

            create_count_plot.create_plot_sql(['plt'],
                                          ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                          True, False, True, 'charts/plt-data', outfile_type)
            print('Finished creating PLT plot!')
        elif selection == '7':
            print('Creating all plots...')

            create_count_plot.create_plot_sql(['wbc', 'hgb', 'plt', 'gran_percent', 'anc'],
                                          ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                          False, True, False, 'charts/overview-plot', outfile_type)

            create_count_plot.create_plot_sql(['wbc'],
                                              ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                              True, False, True, 'charts/wbc-data', outfile_type)

            create_count_plot.create_plot_sql(['anc'],
                                              ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                              True, False, True, 'charts/agc-data', outfile_type)

            create_count_plot.create_plot_sql(['gran_percent'],
                                              ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                              True, False, True, 'charts/gran-data', outfile_type)

            create_count_plot.create_plot_sql(['hgb'],
                                              ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                              True, False, True, 'charts/hgb-data', outfile_type)

            create_count_plot.create_plot_sql(['plt'],
                                              ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                              True, False, True, 'charts/plt-data', outfile_type)
            print('Finished creating all plots!')
        elif selection.upper() == 'X':
            break
        else:
            print("Unknown Option Selected!")


def main():
    menu = {}
    menu['1'] = 'Add Items.'
    menu['2'] = 'Plot.'
    menu['X'] = 'Exit.'

    while True:
        options = menu.keys()

        for entry in options:
            print(entry, menu[entry])

        selection = input("Please Select: ")
        if selection == '1':
            add_menu()
        elif selection == '2':
            plot_menu()
        elif selection.upper() == 'X':
            break
        else:
            print('Unknown Option Selected!')


if __name__=="__main__":
    main()
