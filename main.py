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

# Read config values from config.ini
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

        args = (9, 1, comment, cbc_date, cbc_date, cbc_time, cbc_time, wbc, hgb, plt, gran, anc, '')
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


def show_menu(menu):
    options = menu.keys()

    for entry in options:
        print(entry, menu[entry])


def menu_selection(menu):
    selection = input("Please Select: ").upper()

    if selection not in menu:
        selection = 'E'

    return selection


def add_menu():
    error_text = "Invalid Selection"

    menu_items_add = {}
    menu_items_add['1'] = 'Add CBC'
    menu_items_add['2'] = 'Add Medication'
    menu_items_add['3'] = 'Add Vitals'
    menu_items_add['4'] = 'Add Surgery'
    menu_items_add['X'] = 'Return'

    add_menu_choices = {'1': add_cbc_record,
                        '2': add_medication_record,
                        '3': add_vitals_record,
                        '4': add_surgery_record,
                        'E': (lambda: print(error_text))}

    show_menu(menu_items_add)
    selection = menu_selection(menu_items_add)

    while selection != 'X':
        add_menu_choices[selection]()
        show_menu(menu_items_add)
        selection = menu_selection(menu_items_add)


def create_overview_plot():
    outfile_type = '.png'
    print('Creating overview plot...')

    create_count_plot.create_plot_sql(['wbc', 'hgb', 'plt', 'gran_percent', 'anc'],
                                      ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                      False, True, False, 'charts/overview-plot', outfile_type)
    print('Finished creating overview plot!')


def create_wbc_plot():
    outfile_type = '.png'
    print('Creating WBC plot...')

    create_count_plot.create_plot_sql(['wbc'],
                                      ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                      True, False, True, 'charts/wbc-data', outfile_type)
    print('Finished creating WBC plot!')


def create_anc_plot():
    outfile_type = '.png'
    print('Creating ANC plot...')

    create_count_plot.create_plot_sql(['anc'],
                                      ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                      True, False, True, 'charts/agc-data', outfile_type)
    print('Finished creating overview plot!')


def create_gran_plot():
    outfile_type = '.png'
    print('Creating GRAN % plot...')

    create_count_plot.create_plot_sql(['gran_percent'],
                                      ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                      True, False, True, 'charts/gran-data', outfile_type)
    print('Finished creating GRAN % plot!')


def create_hgb_plot():
    outfile_type = '.png'
    print('Creating HGB plot...')

    create_count_plot.create_plot_sql(['hgb'],
                                      ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                      True, False, True, 'charts/hgb-data', outfile_type)
    print('Finished creating HGB plot!')


def create_plt_plot():
    outfile_type = '.png'
    print('Creating PLT plot...')

    create_count_plot.create_plot_sql(['plt'],
                                      ['Doxorubicin', 'Cisplatin', 'Methotrexate', 'Neulasta'],
                                      True, False, True, 'charts/plt-data', outfile_type)
    print('Finished creating PLT plot!')


def create_all_plot():
    print('Creating all plots...')

    create_overview_plot()
    create_wbc_plot()
    create_anc_plot()
    create_gran_plot()
    create_hgb_plot()
    create_plt_plot()

    print('Finished creating all plots!')


def plot_menu():
    error_text = "Invalid Selection"

    menu_items_plot = {}
    menu_items_plot['1'] = "Create overview plot."
    menu_items_plot['2'] = "Create WBC plot."
    menu_items_plot['3'] = "Create AGC plot."
    menu_items_plot['4'] = "Create GRAN % plot."
    menu_items_plot['5'] = "Create HGB plot."
    menu_items_plot['6'] = "Create PLT plot."
    menu_items_plot['7'] = "Create all plots."
    menu_items_plot['X'] = "Return."

    plot_menu_choices = {'1': create_overview_plot,
                         '2': create_wbc_plot,
                         '3': create_anc_plot,
                         '4': create_gran_plot,
                         '5': create_hgb_plot,
                         '6': create_plt_plot,
                         '7': create_all_plot,
                         'E': (lambda: print(error_text))}

    show_menu(menu_items_plot)
    selection = menu_selection(menu_items_plot)

    while selection.upper() != 'X':
        plot_menu_choices[selection]()
        show_menu(menu_items_plot)
        selection = menu_selection(menu_items_plot)


def main():
    menu_items_main = {}
    menu_items_main['1'] = 'Add Items.'
    menu_items_main['2'] = 'Plot.'
    menu_items_main['X'] = 'Exit.'

    main_menu_choices = {'1': add_menu,
                         '2': plot_menu,
                         'E': (lambda: print("Unknown Option Selected!"))}

    show_menu(menu_items_main)
    selection = menu_selection(menu_items_main)

    while selection.upper() != 'X':
        main_menu_choices[selection]()
        show_menu(menu_items_main)
        selection = menu_selection(menu_items_main)


if __name__ == "__main__":
    main()
