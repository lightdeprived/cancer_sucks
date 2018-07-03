import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.figure import Figure
import pandas as pd

# Read in data
count_data = pd.read_excel('C:\\Users\\212346516\\Desktop\\Zac CBC Record.xlsx', sheetname='Counts')
chemo_data = pd.read_excel('C:\\Users\\212346516\\Desktop\\Zac CBC Record.xlsx', sheetname='Chemo')
range_data = pd.read_excel('C:\\Users\\212346516\\Desktop\\Zac CBC Record.xlsx', sheetname='Ranges')
range_data.set_index('Count Type', inplace=True)

# These are the "Tableau 20" colors as RGB.
tableau20 = [(31, 119, 180), (174, 199, 232), (255, 127, 14), (255, 187, 120),
             (44, 160, 44), (152, 223, 138), (214, 39, 40), (255, 152, 150),
             (148, 103, 189), (197, 176, 213), (140, 86, 75), (196, 156, 148),
             (227, 119, 194), (247, 182, 210), (127, 127, 127), (199, 199, 199),
             (188, 189, 34), (219, 219, 141), (23, 190, 207), (158, 218, 229)]

# Scale the RGB values to the [0, 1] range, which is the format matplotlib accepts.
for i in range(len(tableau20)):
    r, g, b = tableau20[i]
    tableau20[i] = (r / 255., g / 255., b / 255.)

def create_plot(counts=[], meds=[], display_range=False, scale_data=True):
    fig = plt.figure(figsize=(16, 9))

    # Remove the plot frame lines. They are unnecessary chartjunk.
    ax = plt.subplot(111)
    ax.spines["top"].set_visible(False)
    ax.spines["bottom"].set_visible(True)
    ax.spines["right"].set_visible(False)
    ax.spines["left"].set_visible(True)

    # Ensure that the axis ticks only show up on the bottom and left of the plot.
    # Ticks on the right and top of the plot are generally unnecessary chartjunk.
    ax.get_xaxis().tick_bottom()
    ax.get_yaxis().tick_left()

    # Limit the range of the plot to only where the data is.
    # Avoid unnecessary whitespace.
    plt.xlim(count_data['Date'].values[0], count_data['Date'].values[-1])

    # Make sure your axis ticks are large enough to be easily read.
    # You don't want your viewers squinting to read your plot.
    # plt.yticks(range(0, 91, 10), [str(x) + "%" for x in range(0, 91, 10)], fontsize=14)
    plt.xticks(fontsize=10, rotation='vertical')

    # counts = ['WBC (K/mm3)', 'HGB (g/dL)', 'PLT (k/mm3)', 'GRAN%', 'AGC']
    legend_handles = []

    for rank, column in enumerate(counts):
        if not scale_data:
            plt.plot(count_data['Date'].values, count_data[column].values,
                     lw=2.5, color=tableau20[rank])
            legend_handles.append(mpatches.Patch(color=tableau20[rank],
                                                 label=column))
        elif scale_data:
            plt.plot(count_data['Date'].values, (count_data[column].values / range_data.loc[column]['Div By']),
                     lw=2.5, color=tableau20[rank])
            legend_handles.append(mpatches.Patch(color=tableau20[rank],
                                                 label=column + ' X ' + str(range_data.loc[column]['Div By'])))

    if display_range:
        # Plot lines marking normal range min and max
        # Plot text with the min and max values
        for rank, column in enumerate(counts):
            # Plot min line
            if not scale_data:
                plt.plot(count_data['Date'].values, [range_data.loc[column]['Low']]
                         * len(count_data['Date'].values), "-",
                         lw=0.5, color="red", alpha=0.75)

                # Plot min text. Need to convert last date value to datetime to add one day using DateOffset
                # so text appears off right hand edge of graph.
                plt.text(pd.to_datetime(count_data['Date'].values[-1]) + pd.DateOffset(days=1),
                         range_data.loc[column]['Low'],
                         str(range_data.loc[column]['Low']),
                         fontsize=8, color='red', verticalalignment='center')

                # Plot max line
                plt.plot(count_data['Date'].values, [range_data.loc[column]['High']]
                         * len(count_data['Date'].values), "-",
                         lw=0.5, color="red", alpha=0.75)

                # Plot max text. Need to convert last date value to datetime to add one day using
                # DateOffset so text appears off right hand edge of graph.
                plt.text(pd.to_datetime(count_data['Date'].values[-1]) + pd.DateOffset(days=1),
                         range_data.loc[column]['High'],
                         str(range_data.loc[column]['High']),
                         fontsize=8, color='red', verticalalignment='center')
            elif scale_data:
                plt.plot(count_data['Date'].values, [range_data.loc[column]['Low'] / range_data.loc[column]['Div By']]
                         * len(count_data['Date'].values), "-",
                         lw=0.5, color="red", alpha=0.75)

                # Plot min text. Need to convert last date value to datetime to add one day using DateOffset
                # so text appears off right hand edge of graph.
                plt.text(pd.to_datetime(count_data['Date'].values[-1]) + pd.DateOffset(days=1),
                         range_data.loc[column]['Low'] / range_data.loc[column]['Div By'],
                         str(range_data.loc[column]['Low'] / range_data.loc[column]['Div By']),
                         fontsize=8, color='red', verticalalignment='center')

                # Plot max line
                plt.plot(count_data['Date'].values, [range_data.loc[column]['High'] / range_data.loc[column]['Div By']]
                         * len(count_data['Date'].values), "-",
                         lw=0.5, color="red", alpha=0.75)

                # Plot max text. Need to convert last date value to datetime to add one day using
                # DateOffset so text appears off right hand edge of graph.
                plt.text(pd.to_datetime(count_data['Date'].values[-1]) + pd.DateOffset(days=1),
                         range_data.loc[column]['High'] / range_data.loc[column]['Div By'],
                         str(range_data.loc[column]['High'] / range_data.loc[column]['Div By']),
                         fontsize=8, color='red', verticalalignment='center')

    ymin, ymax = plt.ylim()

    for rank, column in enumerate(meds):
        plt.bar(chemo_data['Date'].values, (int(ymax) / len(meds)) * chemo_data[column], 0.75,
                color=tableau20[(rank + len(counts))],
                align='center', alpha=0.40, bottom=(int(ymax) / len(meds)) * rank)
        legend_handles.append(mpatches.Patch(color=tableau20[rank + len(counts)], label=column))

    plt.legend(handles=legend_handles, bbox_to_anchor=(0, 1), loc=2)

    print(ax.get_yticks())

    for y in ax.get_yticks():
        plt.plot(count_data['Date'].values, [y] * len(count_data['Date'].values), "--", lw=0.5,
                 color="black", alpha=0.3)

    return fig