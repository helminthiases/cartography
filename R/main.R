# Title     : main.R
# Objective : Main
# Created by: greyhypotheses
# Created on: 29/06/2022


# functions
source(file = 'R/features/SewerPipes.R')


# list of experiments
hub <- dirname(getwd())
source <- file.path(hub, 'infections', 'warehouse', 'data', 'ESPEN', 'experiments', 'equivalent')
files <- base::list.files(path = source, pattern = '.csv')
