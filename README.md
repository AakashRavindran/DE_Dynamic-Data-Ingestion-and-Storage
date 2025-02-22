# DE_Dynamic-Data-Ingestion-and-Storage
**US States Population Projection Analysis with Hive**
**Overview**
The goal of this project is to obtain US States population projection data between 2010 and 2022 and perform analysis using Apache Hive. We automate the process of downloading the required dataset, creating necessary Hive tables, and performing state-based analysis using partitions for improved performance.

**Key Features:**
Data Import: We import the required population projection dataset from the US Census Bureau.
Hive Table Creation: The data is loaded into Hive tables (either from the local system or HDFS) that are pre-created.
Partitioned Tables: To optimize query performance, we create partitioned tables by state.
Data Insertion: Data for specific states is inserted into the partitioned tables, allowing efficient querying on a state-by-state basis.
Automation: The entire process, from downloading the dataset to performing queries, is automated using a Bash script (hiveAutomateCreate.sh).

**Project Setup
Prerequisites**
Before you can run the script, ensure that the following are installed and configured:

Apache Hive: The data will be loaded and queried in Hive.
Apache Hadoop (HDFS): Required if you're working with HDFS for data storage.
wget: Used to download the CSV data from the Census Bureau’s site.
Bash: The automation script is written in Bash, and you'll need to execute it in a Unix-like environment (e.g., Linux or macOS).

**Dataset**
The dataset used for this project can be downloaded from the US Census Bureau's website: Population Estimates Data
https://www2.census.gov/programs-surveys/popest/datasets/2010-2020

Specifically, the data includes population projections from 2010 to 2020 and beyond for various geographic levels, including states and cities.

**How to Use**
Step 1: Download the Dataset
The dataset is automatically downloaded using the wget command in the Bash script.

Step 2: Modify the Script
The script hiveAutomateCreate.sh contains the logic to:

Download the dataset.
Create tables in Hive (both regular and partitioned).
Load data into the tables.
Insert data for a specific state into the partitioned table.
You can modify the script to suit your needs, such as changing the state partition or the dataset path.

Step 3: Run the Bash Script
Make the script executable:

chmod +x hiveAutomateCreate.sh

Run the script:
./hiveAutomateCreate.sh

Step 4: Analyzing Data
Once the data is loaded into the partitioned table, you can execute Hive queries on the specific state partition, which provides optimized query performance.

For example, you can query population estimates for STATE=17 (Illinois) or any other state for the years 2010-2022.

Step 5: Querying in Hive
Sample query to retrieve population estimates for a specific state (e.g., STATE=17):


SELECT * FROM partitioned_pop_estimate_us_2010_2020
WHERE STATE = 17;

This query will retrieve data for Illinois (state code 17), benefiting from the partitioned table's improved performance.

