#!/bin/bash

# Redirect output of wget to both the file and log
wget https://www2.census.gov/programs-surveys/popest/datasets/2010-2020/cities/SUB-EST2020_ALL.csv -O /root/hive_project/SUB-EST2020_ALL.csv >> /root/hive_project/hivelog.txt 2>&1

# Log download success
echo "CSV file downloaded successfully." >> /root/hive_project/hivelog.txt

# Execute Hive command to create tables, and log output
hive -e "source /root/hive_project/createTables.txt" >> /root/hive_project/hivelog.txt 2>&1

# Log Hive table creation success
echo "Hive tables created successfully." >> /root/hive_project/hivelog.txt

# Prompt user for state value
read -p "Enter state value: " STATE_VALUE

# Set SQL file path
SQL_FILE="/root/hive_project/loadData.txt"

# Load data into Hive, and log output
hive --hiveconf state_value=$STATE_VALUE -f $SQL_FILE >> /root/hive_project/hivelog.txt 2>&1

# Log data insertion success
echo "Data has been inserted into partition table for State $STATE_VALUE." >> /root/hive_project/hivelog.txt
