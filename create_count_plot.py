#!/usr/bin/python
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import pandas as pd
import psycopg2 as sql
# from psycopg2 import Error
import configparser
import datetime

config = configparser.ConfigParser()
config.read('config.ini')

db_host = config['DEFAULT']['host']
db_port = config['DEFAULT']['port']
db_name = config['DEFAULT']['db_name']
db_user = config['DEFAULT']['db_user']
db_password = config['DEFAULT']['db_password']


def create_plot_sql(counts=[], meds=[], display_range=False, scale_data=True, display_baseline=False, outfile='chart',
                    outfile_type='png'):

    db_connection = sql.connect("dbname='" + db_name + "' user='" + db_user + "' host='" + db_host + "' password='" + db_password + "'")

    date_range_sql = """
        select 
            * 
        from cancer_sucks.v_event_date_range;
    """

    count_sql = """
        select
            date_start,
            wbc,
            hgb,
            plt,
            gran_percent,
            anc
        from cancer_sucks.v_event_cbc
        order by date_start;
    """

    chemo_sql = """
        select
            person_id,
            date_start,
            "Cisplatin",
            "Doxorubicin",
            "Methotrexate",
            "Neulasta"
        from cancer_sucks.v_event_medication_chemo
        order by date_start;
    """

    plot_config_sql = """
        select * from cancer_sucks.plot_config;
    """

    count_data = pd.read_sql(count_sql, con=db_connection)
    chemo_data = pd.read_sql(chemo_sql, con=db_connection)
    plot_config_data = pd.read_sql(plot_config_sql, con=db_connection)
    plot_config_data.set_index('name', inplace=True)
    # date_data = pd.read_sql(xaxis_sql, con=db_connection)
    date_range_data = pd.read_sql(date_range_sql, con=db_connection)

    f = plt.figure(figsize=(16, 9))

    # Remove the plot frame lines. They are unnecessary chartjunk.
    ax = plt.subplot(111)
    ax.spines["top"].set_visible(False)
    ax.spines["bottom"].set_visible(True)
    ax.spines["right"].set_visible(False)
    ax.spines["left"].set_visible(True)

    # Ensure that the axis ticks only show up on the bottom and left of the plot.
    # Ticks on the right and top of the plot are generally unnecessary chart junk.
    ax.get_xaxis().tick_bottom()
    ax.get_yaxis().tick_left()

    # Limit the range of the plot to only where the data is.
    # Avoid unnecessary whitespace.
    # plt.xlim(count_data[b'date_start'].values[0], count_data[b'date_start'].values[-1] + pd.DateOffset(days=1))
    # plt.xlim(date_data["min_date"].values[0], date_data["max_date"].values[0])
    plt.xlim(date_range_data["event_date"].values[0], date_range_data["event_date"].values[-1] + pd.DateOffset(days=2))

    # Make sure your axis ticks are large enough to be easily read.
    # You don't want your viewers squinting to read your plot.
    # plt.yticks(range(0, 91, 10), [str(x) + "%" for x in range(0, 91, 10)], fontsize=14)
    plt.xticks(fontsize=10, rotation='vertical')

    # counts = ['WBC (K/mm3)', 'HGB (g/dL)', 'PLT (k/mm3)', 'GRAN%', 'AGC']
    legend_handles = []

    # Plot CBC count data
    # Cycle through list of counts passed in to function
    for rank, column in enumerate(counts):

        # Get color from "Ranges" data
        # Then convert to decimal as needed by pyplot
        plot_color = (plot_config_data.loc[column]['r'],
                      plot_config_data.loc[column]['g'],
                      plot_config_data.loc[column]['b'])
        r, g, b = plot_color
        plot_color = (r / 255., g / 255., b / 255.)

        # Plot data to true scale
        if not scale_data:
            plt.plot(count_data['date_start'].values, count_data[column].values,
                     lw=2.5, color=plot_color)
            legend_handles.append(mpatches.Patch(color=plot_color,
                                                 label=plot_config_data.loc[column]['legend_name']))
        # Plot data to scale indicated in "Ranges" data with "Div By" column
        # This allows all data to be displayed on the same Y axis
        elif scale_data:
            plt.plot(count_data['date_start'].values,
                     (count_data[column].values / plot_config_data.loc[column]['div_by']),
                     lw=2.5,
                     color=plot_color)
            legend_handles.append(mpatches.Patch(color=plot_color,
                                                 label=plot_config_data.loc[column]['legend_name'] + ' X '
                                                 + str(plot_config_data.loc[column]['div_by'])))

        # Display normal range data (max / min) line
        if display_range:
            # Plot range lines not to scale
            if not scale_data:
                plt.plot(date_range_data['event_date'].values, [plot_config_data.loc[column]['low']]
                         * len(date_range_data['event_date'].values), "-",
                         lw=0.5,
                         color="red",
                         alpha=0.75)

                # Plot min text. Need to convert last date value to datetime to add one day using DateOffset
                # so text appears off right hand edge of graph.
                plt.text(pd.to_datetime(date_range_data['event_date'].values[-1]) + pd.DateOffset(days=1),
                         plot_config_data.loc[column]['low'],
                         str(plot_config_data.loc[column]['low']),
                         fontsize=8,
                         color='red',
                         verticalalignment='center')

                # Plot max line
                plt.plot(date_range_data['event_date'].values, [plot_config_data.loc[column]['high']]
                         * len(date_range_data['event_date'].values), "-",
                         lw=0.5,
                         color="red",
                         alpha=0.75)

                # Plot max text. Need to convert last date value to datetime to add one day using
                # DateOffset so text appears off right hand edge of graph.
                plt.text(pd.to_datetime(date_range_data['event_date'].values[-1]) + pd.DateOffset(days=1),
                         plot_config_data.loc[column]['high'],
                         str(plot_config_data.loc[column]['high']),
                         fontsize=8,
                         color='red',
                         verticalalignment='center')
            
            # Plot range lines to scale
            elif scale_data:
                # Plot min line to scale
                plt.plot(date_range_data['event_date'].values,
                         [plot_config_data.loc[column]['low'] / plot_config_data.loc[column]['div_by']]
                         * len(date_range_data['event_date'].values),
                         "-",
                         lw=0.5,
                         color="red",
                         alpha=0.75)

                # Plot min text. Need to convert last date value to datetime to add one day using DateOffset
                # so text appears off right hand edge of graph.
                plt.text(pd.to_datetime(date_range_data['event_date'].values[-1]) + pd.DateOffset(days=1),
                         plot_config_data.loc[column]['low'] / plot_config_data.loc[column]['div_by'],
                         str(plot_config_data.loc[column]['low'] / plot_config_data.loc[column]['div_by']),
                         fontsize=8,
                         color='red',
                         verticalalignment='center')

                # Plot max line to scale
                plt.plot(date_range_data['event_date'].values,
                         [plot_config_data.loc[column]['high'] / plot_config_data.loc[column]['div_by']]
                         * len(date_range_data['event_date'].values), "-",
                         lw=0.5,
                         color="red",
                         alpha=0.75)

                # Plot max text. Need to convert last date value to datetime to add one day using
                # DateOffset so text appears off right hand edge of graph.
                plt.text(pd.to_datetime(date_range_data['event_date'].values[-1]) + pd.DateOffset(days=1),
                         plot_config_data.loc[column]['high'] / plot_config_data.loc[column]['div_by'],
                         str(plot_config_data.loc[column]['high'] / plot_config_data.loc[column]['div_by']),
                         fontsize=8,
                         color='red',
                         verticalalignment='center')

        # Display first measurement of count as a "base line" measurement
        if display_baseline:
            if not scale_data:
                plt.plot(date_range_data['event_date'].values,
                         [count_data[column].values[0]] * len(date_range_data['event_date'].values),
                         "-",
                         lw=0.5,
                         color=plot_color,
                         alpha=0.90)
            elif scale_data:
                plt.plot(date_range_data['event_date'].values,
                         [count_data[column].values[0] / plot_config_data.loc[column]['div_by']]
                         * len(date_range_data['event_date'].values),
                         "-",
                         lw=0.5,
                         color=plot_color,
                         alpha=0.90)

    ymin, ymax = plt.ylim()

    for rank, column in enumerate(meds):
        bar_color = (plot_config_data.loc[column]['r'],
                     plot_config_data.loc[column]['g'],
                     plot_config_data.loc[column]['b'])

        r, g, b = bar_color
        bar_color = (r / 255., g / 255., b / 255.)

        plt.bar(chemo_data['date_start'].values,
                (int(ymax) / len(meds)) * chemo_data[column],
                0.75,
                color=bar_color,
                align='center',
                alpha=0.75,
                bottom=(int(ymax) / len(meds)) * rank)
        legend_handles.append(mpatches.Patch(color=bar_color,
                                             label=plot_config_data.loc[column]['legend_name'],
                                             alpha=0.75))

    # Place events
    # circle1 = plt.Circle((chemo_data[b'date_start'][0],0), 2, color='red')
    ax.plot([datetime.date(2017, 10, 17)] * len(range(0, int(ymax))), range(0, int(ymax)),
            '-',
            color='red')
    # ax.add_artist(circle1)

    # Place legend
    plt.legend(handles=legend_handles, bbox_to_anchor=(0, 1), loc=2)

    # print(count_data[b'date_start'].values + count_data['date_end'].values)

    # Draw grid lines
    for y in ax.get_yticks():
        # need to revise this to use min start date and max end date
        plt.plot(date_range_data['event_date'].values, [y] * len(date_range_data['event_date'].values),
                 "--",
                 lw=0.5,
                 color="black",
                 alpha=0.3)

    # plt.savefig(outfile, bbox_inches="tight")
    # Save file
    f.savefig(outfile + outfile_type, bbox_inches="tight")

    db_connection.close()
