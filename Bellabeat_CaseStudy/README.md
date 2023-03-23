![BellabeatLogo](https://user-images.githubusercontent.com/115209534/226958053-0e822444-2b52-4b56-aa2d-5f94bda66985.png)
# Bellabeat Data Analytics Case Study - How Can a Wellness Technology Company Play It Smart?

***Created By:*** **Simar Bhatt**

***Created On:*** **16th March 2023**

***Tools Used:*** **Google Cloud Console - BigQuery, Sheets, Looker Studio, GitHub**

## Scenario 
This is a Capstone project of Google Data Analytics Professional Certificate Course. 

For this case study, I am a junior data analyst working on the marketing analyst team at Bellabeat, a high-tech manufacturer of health-focused products for women. To answer the key business questions, I will follow the steps of the data analysis process: ask, prepare, process, analyze, share, and act.

Bellabeat is a successful small company, but they have the potential to become a larger player in the global smart device market. The cofounder and CCO of Bellabeat believes that analyzing smart device fitness data could help unlock new growth opportunities for the company. I have been asked to analyze other company's smart device data to gain insight into how consumers are using their smart devices and focus the findings on one of Bellabeat’s own products, to help guide marketing strategy for the company. I have to present my analysis and recommendations to the Bellabeat executive team. For more information, [check here](https://github.com/simarbhatt/Portfolio_Projects/files/10991301/Case-Study-2-_-How-can-a-wellness-technology-company-play-it-smart.pdf). 


## About the Company

[Bellabeat Inc.](https://bellabeat.com/) is a Silicon Valley company building tech-powered wellness products for women. It is a go-to wellness brand of health-focused smart jewelry-products and services for women. It was founded by **Urška Sršen** and **Sando Mur** in **2013**, with the vision to inspire and inform wowen around the world using beuatifully designed technology. Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women. Bellabeat collect data on **activity (steps, distance, calories, physical activities), sleep, stress, and reproductive health** through its wearables and accompanying products. It  helps women better understand how their bodies work and make healthier choices. Since 2016, Bellabeat is revolutionizing the FemTech space with its innovate smart jewelry products. 

**Products:**
  1. **Leaf (Urban & Chakra)** - Health-tracking jewelry; Can be worn as a bracelet, necklace or clip; Connects to Bellabeat app to track daily wellness. ***USP- Asthetically pleasing, no screen display and upto 6 months of battery backup (No charging required!).*** 
  2. **Time** - Classic wellness tracker in the form of an analog watch; Connects to the Bellabeat app. 
  3. **Spring** - A smart water bottle powered by AI that tracks daily water intake; Connects to the Bellabeat app to track the hydration levels.  
  4. **Bellabeat app** - The Bellabeat app provides users with health data related to their activity, sleep, stress, menstrual cycle, and mindfulness habits. The Bellabeat app connects to their line of smart wellness products.
  5. **Bellabeat membership**: Bellabeat also offers a subscription-based membership program for users. Membership gives users 24/7 access to fully personalized guidance on nutrition, activity, sleep, health and beauty, and mindfulness based on their lifestyle and goals.

**Revenue Model:** One-Time

**Business Model:** DTC

**Selling platforms:**
  1. Online retailers like Amazon, Ebay, Shopify
  2. Own webstore

**Marketing platforms:**
  1. **ATL** - Radio, TV, Print, OOH (Billboards)
  2. **BTL** - Video ads on Youtube & Google Display Network
  3. **TTl** - Digital Marketing Platforms - Google Search, Facebook, Instagram & Twitter


## 1. ASK 
**1.1 Business Tasks**  
  1. To analyze Fitbit Fitness Tracker Data from thirty eligible users, in order to gain insights into how consumers use non-Bellabeat smart devices.  
  2. To focus on one of Bellabeat's product to apply these insights and guide marketing strategies and new growth opportunities for the company.
  
*For this case study, I will focus on marketing for the Bellabeat app and membership portion of the bellabeat product line in order to:*
  1. *Help get new customer*
  2. *Help increase customer retention by improving user experience*
  3. *Overall, help increase in company sales and profits*



**1.2 Stakeholders**  
  1. **Bellabeat Executive Team**:
      1. **Urška Sršen**: Co-founder & Chief Creative Officer
      2. **Sando Mur**: Co-founder & Mathematician
  2. **Bellabeat Marketing Analytics Team**: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Bellabeat’s marketing strategy.
  3. **Consumer**: Everyone who uses Bellabeat’s products & services.


## 2. PREPARE
**2.1 Dataset Information**  

1. **Data link** - https://www.kaggle.com/datasets/arashnic/fitbit
2. **Data source** - Preprocessed and shared on Kaggle platform by Mobius. It contains personal fitness tracker data from over thirty FitBit users who have given consent to use their data.
3. **Metadata:**  - [Metadata](https://docs.google.com/spreadsheets/d/1FPTn2nm8lWLAFDUlbRtW91OB5bUqDKDyCT6997yA-4I/edit?usp=sharing) is available in the form of 18 .CSV files. However, the tables found relevant to analysis were only 5 - daily_activity, hourly_calories, hourly_steps, hourly_intensities and daily_sleep. Reason for the elimination of other tables is given under the Section 2.3.  
4. **Preparation** - Downloaded the datasets using the Kaggle link given above --> Previewed and renamed in Google Sheets --> Uploaded the dataset in Bigquery. 

**2.2 Dataset Credibility (ROCCC)**  
1. **Reliability** - Open-access dataset made available through Kaggle, with verified source. 
2. **Originality** - [Third party dataset](https://zenodo.org/record/53894#.X9oeh3Uzaao). Data was generated by respondents to a distributed survey via Amazon Mechanical Turk, and uploaded on Kaggle by Mobius. 
3. **Comprehensive** - 33 Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring for 31 days. 
4. **Current** - Not recent but not outdated as well since it's not older than 10 years. Survey was conducted between 03rd Dec 2016 and 05th Dec 2016 and the data records were collected for 12th June 2016 to 12th July 2016. 
5. **Cited** - CC0: Public domain. Open access crowd-sourced Fitbit datasets.

**2.3 Dataset Limitations**
1. **Small sample size** 
    - Data of 33 users is not representative of the target audience size of more than 20 million users as of 2016. It was published by 
Federica Laricchia in Sep 6, 2022 at [Statista website](https://www.statista.com/statistics/472600/fitbit-active-users/#statisticContainer). Therefore, any relationship established from this dataset will have a low confidence level. 
2.  **Insufficient data**
    - The time period for data collection was relatively short (only 31 days). A longer collection time would have been beneficial to avoid a potential sampling bias. This data is most likely not enough to make conclusions on fitness trends, and is therefore, not enough to drive business decisions. 
3. **Incomplete data**
    - **Inconsistent no. of users**: Likely reason for the inconsistent no. of users is the varient of Fitbit used. Not all variants of device collect heartrate and sleep data. (As shown in the code and output below)
    - **Inconsistency in data tracker for hours per day**: User data for few hours of the day are missing. Reasons for these could be that some users might not have been wearing or reporting their tracking information every day, implying their watches may have been off for some time (like for charging!). 
    - It was hard to normalize the data because of the lack of information about fitness values calculations and also due to the fact that, fitness devices assumed the baseline values like Calories and Sedentary Minutes even when not in use. Therefore, the analysis was performed on raw data.
<!--
 ```
# daily_activity table to count of total no. of users who tracked their STEPS, CALORIES and PHYSICAL ACTIVITY (PA) MINUTES. 

SELECT 
  'activity_users(steps/calories/PA)' as total_no_of,
  count(distinct Id) as count
FROM `Case_Study_2_Fitabase_Data.daily_activity`

UNION ALL

# daily_sleep_data table to count the total no. of users who tracked their SLEEP DATA.

SELECT 
  'sleep_users',
  count(distinct Id)
FROM `Case_Study_2_Fitabase_Data.daily_sleep_data`

UNION ALL

# heartrate_seconds table to count the total no. of users who tracked their HEART RATES.

SELECT 
  'heartrate_users',
  count(distinct Id)
FROM `Case_Study_2_Fitabase_Data.heartrate_seconds`

UNION ALL

# daily_weight_log table to count of total no. of users who logged their WEIGHT, BMI and other related information. 

SELECT 
  'weight/BMI_users',
  count(distinct Id)
FROM `Case_Study_2_Fitabase_Data.daily_weight_log`
ORDER BY 2 DESC;
```
-->
![image](https://user-images.githubusercontent.com/115209534/225827500-8798cbd9-af1c-47f6-8098-a1bfa80028ab.png)

Total number of users who tracked various fitness parameters (Activities - Steps, Calories, Physical Activity Minutes, Sleep and Heartrate) 
            
4. **Old and outdated data**
    - As the data was recorded in 2016, the analysed and generated insight cannot be reliably extrapolated for today's population. 

5. **Missing demographic details**
    - Information on gender, age, ethnicity and race of the users is missing which causes ambiguity. These limitations will lead to data bias. 

***However, the data is still usable to start seeing trends in users' days that could help to improve bellabeat's user experience.***

**NOTE:** For this analysis, the CSV files tracking information by the minute were not utilized as that level of detail is not necessary for the bigger picture analysis. Additionally, the MET (Metabolic equivalent of task) data was not used as this information is useful only for comparison at individual user level. MET data shows a user their level of exertion from a baseline but cannot really be used as a comparison in-between users. Therefore, this data is not necessary for analysis. Heartrate data is also eliminated from the analysis because the recorded data does not give information of the resting heartrates of the users which is necessary for comparison and also due to the limited no. of users (14 users). Moreover, the weight log data is irreleavent for the purpose of analysis due to limited no. of total users (7 users). 


## 3. PROCESS
### 3.1 Tools used for analysis

Spreadsheets and SQL was used for data analyse on **Google Cloud Console** 
  - For Data Transformation & Basic Visualization: **Google Sheets**
  - For Data Manipulation, Exploration, & Analysis: **SQL BigQuery**. New project was named "Google Analytics Project" and dataset was named - "Case_Study_2_Fitabase_Data". Each table uploaded from the original dataset was renamed as mentioned under the header 2.3.
  - For Data Visualization: **Google Data Studio/Looker Studio** 
  - For Data Presentation: **GitHub & Kaggle** 

<!-- **3.2 Data Integrity**
To ensure data integrity, original files of the datasets were kept. Copies of .csv files were uploaded on Sheets and Bigquery. 

There were multiple cases where user data was unusable or incomplete due to the tracking data being missing. For example, by adding the activity minutes in daily_activity, it was observed that most users did not wear their watches for the full day (or the data was not submitted). Additonally, some record showed that TotalSteps and TotalActivityMinutes of the day were zero and SedenatryMinutes were 1440 (Total minutes in 24 hours = 1440). This is not possible if the device was used. In such cases, the data was assumed to be unreliable and inaccurate and needed to be removed from the dataset. Detail information of the deleted records can be found in ----.  

Samples size, margin of error, confidence rate-->

### 3.2 Data Manipulation
  1. **Data Transformation** - Both Sheets and SQL was used to convert the data types. 
      - ActivityDate was already in correct DATE format. 
      - ActivityHour had inconsistent datetime format and hence was convered into YYYY-MM-DD HH:MM:SS in Sheets. While uploading the table on Bigquery, this column data type was recognised in TIMESTAMP format. 
      - SleepDay was convered into YYYY-MM-DD HH:MM:SS in Sheets. While uploading the table on Bigquery, this column data type was recognised in TIMESTAMP format. 
      - All other columns of the tables were consistent in their data types when uploaded on the Bigquery. Therefore, they did not require any data type transformations. 

  2. **Table Information** 
Basic information of the tables (No. of rows and schema) was viewed before data manipulation to get the overview of the type of data to be analysed. 
<!--
![image](https://user-images.githubusercontent.com/115209534/225866343-651ad021-81b1-4dae-8a7a-951b678c6e57.png)
![image](https://user-images.githubusercontent.com/115209534/225866423-55ada3a3-b21d-4495-a5dd-a8ea53202a52.png)

To view the total row count of all the tables : 

```
SELECT 
  '1' as Sr_No,
  'daily_activity' as table_name, 
  COUNT(*) as total_rows
FROM `Case_Study_2_Fitabase_Data.daily_activity`

UNION ALL

SELECT 
  '2' as Sr_No,
  'daily_sleep_data' as table_name, 
  COUNT(*) as total_rows
FROM `Case_Study_2_Fitabase_Data.daily_sleep_data`

UNION ALL

SELECT 
  '3' as Sr_No,
  'hourly_calories' as table_name, 
  COUNT(*) as total_rows
FROM `Case_Study_2_Fitabase_Data.hourly_calories`

UNION ALL

SELECT 
  '4' as Sr_No,
  'hourly_intensitites' as table_name, 
  COUNT(*) as total_rows
FROM `Case_Study_2_Fitabase_Data.hourly_intensities`

UNION ALL

SELECT 
  '5' as Sr_No,
  'hourly_steps' as table_name, 
  COUNT(*) as total_rows
FROM `Case_Study_2_Fitabase_Data.hourly_steps`
ORDER BY Sr_No
```
-->
![image](https://user-images.githubusercontent.com/115209534/225868505-32983764-27d8-4537-8d86-50b2c43e1f01.png)

  3. **Data Cleaning** 

#### daily_activity table

```
#1. Checking duplicates

-- table is unique at Id and ActivityDate
WITH cte AS 
(
  SELECT 
    Id, 
    COUNT(distinct ActivityDate) AS cnt_dsnt, 
    COUNT(ActivityDate) AS cnt_all, 
  FROM `Case_Study_2_Fitabase_Data.daily_activity`
  GROUP BY 1
)

SELECT 
  SUM
    (CASE
      WHEN cnt_dsnt=cnt_all THEN 0
      ELSE 1
    END) AS total_duplicates_found
FROM cte;

-- zero duplicate entries found. 
```

![image](https://user-images.githubusercontent.com/115209534/225858684-dd2ca55f-35d2-4fbd-a91e-668a6e56c4c1.png)

```
#2. Checking null values

SELECT Id, ActivityDate
FROM Case_Study_2_Fitabase_Data.daily_activity
WHERE 1=1
AND Id IS NULL
AND ActivityDate IS NULL
AND TotalSteps IS NULL
AND VeryActiveMinutes IS NULL
AND FairlyActiveMinutes IS NULL
AND LightlyActiveMinutes IS NULL
AND SedentaryMinutes IS NULL
AND Calories IS NULL

-- no null values found. 
```

#### daily_sleep_data table

```
#1. Checking duplicates

-- table is unique at Id and SleepDay
WITH cte AS 
(
  SELECT 
    Id, 
    COUNT(distinct SleepDay) AS cnt_dsnt, 
    COUNT(SleepDay) AS cnt_all, 
  FROM `Case_Study_2_Fitabase_Data.daily_sleep_data`
  GROUP BY 1
)

SELECT 
  SUM
    (CASE
      WHEN cnt_dsnt=cnt_all THEN 0
      ELSE 1
    END) AS total_duplicates_found
FROM cte;

-- 3 duplicate records found. Total records = 413.
```

![image](https://user-images.githubusercontent.com/115209534/225863905-56d0c0a6-3a78-4a50-9d51-6629a8e89a6d.png)

```
#2. Viewing duplicates  
WITH cte AS
(
  SELECT 
  *, 
  ROW_NUMBER() OVER (PARTITION BY Id, SleepDay ORDER BY SleepDay) AS rnk
  FROM `Case_Study_2_Fitabase_Data.daily_sleep_data`
)

SELECT Id, SleepDay, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed, COUNT(rnk) as duplicates
FROM cte
GROUP BY 1,2,3,4,5
HAVING COUNT(rnk)>1
ORDER BY 1,2;
```

![image](https://user-images.githubusercontent.com/115209534/225864220-1902c1b2-883c-4fbf-b0db-b07af7207dd4.png)

```
#3. Removing duplicates
WITH cte AS
(
  SELECT 
  *, 
  ROW_NUMBER() OVER (PARTITION BY Id, SleepDay ORDER BY SleepDay) AS rnk
  FROM `Case_Study_2_Fitabase_Data.daily_sleep_data`
)

SELECT Id, SleepDay, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed
FROM cte
WHERE rnk=1
ORDER BY 1,2;

-- Total records after removing duplicates = 410. 
```

![image](https://user-images.githubusercontent.com/115209534/225864684-17aa858c-0795-40cc-a24e-958eaab46af5.png)

```
#4. Checking null values

SELECT Id, SleepDay
FROM `Case_Study_2_Fitabase_Data.daily_sleep_cleaned`
WHERE 1=1
AND Id IS NULL
AND SleepDay IS NULL
AND TotalSleepRecords IS NULL
AND TotalMinutesAsleep IS NULL
AND TotalTimeInBed IS NULL

-- no null values found. 
-- New table is stored as "daily_sleep_data_cleaned"
```


#### hourly_calories/ hourly_steps/ hourly_intensities tables

(Same data cleaning steps were followed for all three tables. Code and example shown only for hourly_steps table)

```
#1. checking duplicates

-- table is unique at Id and ActivityHour
WITH cte AS 
(
  SELECT 
    Id, 
    COUNT(distinct ActivityHour) AS cnt_dsnt, 
    COUNT(ActivityHour) AS cnt_all, 
  FROM `Case_Study_2_Fitabase_Data.hourly_steps`
  GROUP BY 1
)

SELECT 
  SUM
    (CASE
      WHEN cnt_dsnt=cnt_all THEN 0
      ELSE 1
    END) AS total_duplicates_found
FROM cte;

-- zero duplicate entries found. 
```

![image](https://user-images.githubusercontent.com/115209534/225861717-f69045c4-e58d-4202-8a00-dfd10748f316.png)

```
#2. checking null values

SELECT Id, ActivityHour
FROM `Case_Study_2_Fitabase_Data.hourly_steps`
WHERE 1=1
AND Id IS NULL
AND ActivityHour IS NULL
AND StepTotal IS NULL;

-- no null values found. 
```

**3.3 Change Log** 
  - All the changes made in the dataset to the tables were logged in this Github file. 
  - Cleaned data of daily_sleep_data table was stored in a new table view named "daily_sleep_data_cleaned".


## 4. ANALYZE

### DATAFRAME_1 : daily_data

- Before exploring the data, tables daily_sleep_cleaned and daily_activity were merged and a single table with daily data was generated. 
- Columns selected from daily_activity - Id, ActivityDate, TotalSteps, VeryActiveMintes, FailryActiveMinutes, LightlyActiveMinutes, SedentaryMinutes, Calories;
- Columns selected from daily_sleep_data - Id, TotalMinutesAsleep, TotalTimeInBed. 

```
SELECT 
  da.Id, 
  da.ActivityDate, 
  da.TotalSteps, 
  da.Calories,
  da.VeryActiveMinutes, 
  da.FairlyActiveMinutes, 
  da.LightlyActiveMinutes, 
  da.SedentaryMinutes, 
  ROUND(SedentaryMinutes/60,1) AS SedentaryHours, 
  DATE(ds.SleepDay) AS SleepDate,
  ds.TotalMinutesAsleep,
  ROUND(ds.TotalMinutesAsleep/60,1) AS TotalHoursAsleep,
    ds.TotalTimeInBed,
  ROUND(ds.TotalTimeInBed/60,1) AS TotalHoursInBed
FROM `Case_Study_2_Fitabase_Data.daily_activity` da
LEFT JOIN `Case_Study_2_Fitabase_Data.daily_sleep_data_cleaned` ds
  ON da.Id=ds.Id
  AND da.ActivityDate=EXTRACT(DATE FROM ds.SleepDay)
ORDER BY 1,2

-- total rows = 940
-- merged table is saved as "daily_data_1"
```

```
# Finding outliers : min and max values for all the parameters (steps, intensities, calories, sleep) 

SELECT
  MIN(TotalSteps) as min_steps,
  MAX(TotalSteps) as max_steps,
  MIN(VeryActiveMinutes) as min_very_active_mins, --vigorous_intensity
  MAX(VeryActiveMinutes) as max_very_active_mins, 
  MIN(FairlyActiveMinutes) as min_moderately_active_mins,--moderate_intensity
  MAX(FairlyActiveMinutes) as max_moderately_active_mins,
  MIN(LightlyActiveMinutes) as min_lightly_active_mins, --light_intensity
  MAX(LightlyActiveMinutes) as max_lightly_active_mins,
  MIN(SedentaryHours) as min_sedentary_hrs, --resting_intensity
  MAX(SedentaryHours) as max_sedentary_hrs,
  MIN(Calories) as min_cals_burnt,
  MAX(Calories) as max_cals_burnt,
  MIN(TotalHoursAsleep) as min_sleep_time,
  MAX(TotalHoursAsleep) as max_sleep_time,
FROM Case_Study_2_Fitabase_Data.daily_data_1
```

![image](https://user-images.githubusercontent.com/115209534/226356571-045c9be5-e619-487c-9ac1-931478f86588.png)

```
# Viewing outliers 

SELECT *
FROM Case_Study_2_Fitabase_Data.daily_data_1
WHERE 1=1
  AND TotalSteps=0
  OR TotalSteps=36019
  OR VeryActiveMinutes =210
  OR FairlyActiveMinutes=143
  OR LightlyActiveMinutes=518
  OR SedentaryHours =0
  OR SedentaryHours=24
  OR Calories=0
  OR Calories=4900
  OR TotalHoursAsleep=1
  OR TotalHoursAsleep=13.3
ORDER BY 1,2
```

![image](https://user-images.githubusercontent.com/115209534/226365276-1901e137-3179-4237-b966-3133d2c76003.png)

**OBSERVATIONS & INFERENCES** 

**NOTE:** SedentaryMinutes and Calories are measured the entire day even when the device is not worn. According to the [fitabase.com](https://community.fitbit.com/t5/Other-Charge-Trackers/sedentary-minutes/td-p/3372621), default SedentaryMinutes are 1440 per day for every Fitbit device. 

1. Minimum values are inconsistent with usage of smart device. It is possibe that either users did not wear the Fitbit on some days or removed it too soon.
2. TotalSteps CANNOT be zero if the device was used AND the user was capable of walking (eliminating extreme scenarios for the purpose of analysis). (**TotalSteps<>0**)
3. Even if a user was sedentary entire day, their body would spend Calories and count Sedentary minutes. According to a [healthline](https://www.healthline.com/health/calories-burned-sleeping#Determining-how-many-calories-you-burn) article, average person of 56 kg, burns 38 calories per hour sleeping. Therefore, minimum calories spent by a user if resting/sleeping all day (24 hours) would be atleast be approximately 24 x 38 = 912 calories. **(Calories<>0)**
4. To filter out these inconsistencies, outlier data was manually checked and a pattern was observed. Rows in which either TotalSteps=0 OR SedentaryHours=24 OR SedentaryHours=0, the other parameters like VeryActive/Fairly/Light ActiveMinutes were also 0. 

```
# Checking assumptions for non-usage days (filtered out data) 

SELECT *
FROM `Case_Study_2_Fitabase_Data.daily_data_1`
WHERE 1=1
AND TotalSteps=0 --5+72
OR Calories=0 --4in77
OR SedentaryHours=24 OR SedentaryHours=0 --85+2 total92
ORDER BY 1,2;

-- total rows = 92
```

![image](https://user-images.githubusercontent.com/115209534/226498417-b11f5c9b-a9d5-4dfa-b212-bd1f0c0ffd82.png)

_Based on this oberservation, it was assumed that the Fitbit was not worn if TotalSteps=0 OR SedentaryHours=24 OR SedentaryHours=0, Calories=0._ 

5. All the maximum values like TotalSteps=36019 and Calories=4900 indicated an outlier with a very active lifestyle, like an athelete. Therefore, these were included in the analysis to prevent potential bias. 

To eliminate the days when Fitbit was NOT USED but left SWITCHED ON (data was automatically synced), daily_data_1 table was filtered for **TotalSteps<>0** AND **Calories<>0** AND **SedentaryHours <>0** AND **SedentaryHours<>24**. 

```
# Putting filters to remove NON-USAGE days

SELECT *
FROM `Case_Study_2_Fitabase_Data.daily_data_1`
WHERE 1=1
AND TotalSteps<>0 
AND Calories<>0 
AND SedentaryHours<>24 
AND SedentaryHours<>0 
ORDER BY 1,2;

-- total rows = 940-92=848
```

![image](https://user-images.githubusercontent.com/115209534/226499778-26839e0c-32c7-40e1-afc6-ce8c59f20923.png)

<!-- **CATEGORISATION OF THE USERS**
 - Before saving the new version of the table, a few more columns were added to help in analysis. 
 - "**Weekday**", **PAMinutes**, **UserType_DaysReported**, **UserType_Steps**, **UserType_PA** columns were added. (PA = Physical Activity)
 - PAMinutes = VeryActiveMinutes + FairlyActiveMinutes. (LightlyActiveMinutes are not added because in Fitbit, these minutes account for non-intense activity minutes whereas we want to check categorise users based on moderate-intense active minutes threshold of 150 minutes per week). This weekly metric was given by [CDC guidlines](https://www.10000steps.org.au/articles/healthy-lifestyles/counting-steps/#:~:text=Low%20active%20is%205%2C000%20to,active%20is%20more%20than%2012%2C500;https://karencollinsnutrition.com/10000-step-goal-5-key-questions/).
 - All the users were categorised based on total days the Fitbit used, average of total steps taken every day and, average of minutes spent exercising every day. 
 - **NOTE_1:** For all parameters, average values were calculated as against to the total sum because users were inconsistent with the data submission. 
 
```
WITH cte AS (
  SELECT *,
  (VeryActiveMinutes + FairlyActiveMinutes) AS PAMinutes, 
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=1 THEN "(7) Sunday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=2 THEN "(1) Monday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=3 THEN "(2) Tuesday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=4 THEN "(3) Wednesday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=5 THEN "(4) Thursday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=6 THEN "(5) Friday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=7 THEN "(6) Saturday"
    ELSE NULL 
  END AS Weekday,
  FROM `Case_Study_2_Fitabase_Data.daily_data_1`
  WHERE 1=1
  AND TotalSteps<>0 
  AND Calories<>0 
  AND SedentaryHours<>24 AND SedentaryHours<>0 --total 92
  ORDER BY 1,2
)

SELECT 
  *,
  COUNT(DISTINCT ActivityDate) OVER (PARTITION BY Id) AS days_device_used,
  CASE 
    WHEN COUNT(DISTINCT ActivityDate) OVER (PARTITION BY ID) BETWEEN 0 AND 13 THEN "inconsistent_user"
    WHEN COUNT(DISTINCT ActivityDate) OVER (PARTITION BY ID) BETWEEN 14 AND 28 THEN "moderately_consistent_user"
    WHEN COUNT(DISTINCT ActivityDate) OVER (PARTITION BY ID) >=28 THEN "consistent_user" 
    ELSE NULL
  END AS UserType_DaysReported , 

  AVG(TotalSteps) OVER (PARTITION BY Id) AS avg_daily_steps,
  CASE 
    WHEN AVG(TotalSteps) OVER (PARTITION BY ID) <5000 THEN "inactive"
    WHEN AVG(TotalSteps) OVER (PARTITION BY ID) BETWEEN 5000 AND 7499 THEN "less_active"
    WHEN AVG(TotalSteps) OVER (PARTITION BY ID) BETWEEN 7499 AND 9999 THEN "moderately_active" 
    WHEN AVG(TotalSteps) OVER (PARTITION BY ID) BETWEEN 9999 AND 12499 THEN "active"
    WHEN AVG(TotalSteps) OVER (PARTITION BY ID) >=12500 THEN "highly_active"
    ELSE NULL
  END AS UserType_Steps,
    
  AVG(PAMinutes) OVER (PARTITION BY Id) AS avg_daily_PAMinutes,   
  CASE 
    WHEN AVG(PAMinutes) OVER (PARTITION BY Id) < 20 THEN "physically_inactive"
    WHEN AVG(PAMinutes) OVER (PARTITION BY Id) BETWEEN 20 AND 30 THEN "physically_active"  
    WHEN AVG(PAMinutes) OVER (PARTITION BY Id) > 30 THEN "physically_very_active"
    ELSE NULL
  END AS UserType_PA,
FROM cte
ORDER BY 1,2;  

-- total rows = 848
-- new table saved as "daily_data"
```

![image](https://user-images.githubusercontent.com/115209534/226549941-4e340f4a-4672-4a5a-9305-7031acc35392.png)
-->

The new version of table was saved as "**daily_data**". This was the first dataframe for our analysis. 


### DATAFRAME_2 : hourly_data

- Before exploring the data, tables hourly_calories, hourly_steps and hourly_intensities were merged and a single table with hourly data was generated. 
- Records in hourly tables are the extensions of daily activities data. So, to main the consistency of NON-USAGE days which were filtered out in daily_data_1, ActivityDate from daily_data is JOINED with hourly_data. 
- Columns selected were - Id, ActivityHour, StepTotal/Calories/TotalIntensity.
- New columes added were - Date, Weekday, Hour. 
<!--
```
WITH hourly_data_1 AS(
  SELECT 
    step.Id,
    step.ActivityHour,
    step.StepTotal as TotalSteps,
    cal.Calories,
    int.TotalIntensity,
    int.AverageIntensity
  FROM `Case_Study_2_Fitabase_Data.hourly_steps` AS step
  LEFT JOIN `Case_Study_2_Fitabase_Data.hourly_calories` AS cal
    ON step.Id=cal.Id
    AND step.ActivityHour=cal.ActivityHour
  LEFT JOIN `Case_Study_2_Fitabase_Data.hourly_intensities` AS int
    ON step.Id=int.Id
    AND step.ActivityHour=int.ActivityHour

-- total rows = 22099
), 

filtered_dates AS (
  SELECT Id, ActivityDate
  FROM `Case_Study_2_Fitabase_Data.daily_data_1`
  WHERE 1=1
  AND TotalSteps<>0
  AND Calories<>0
  AND SedentaryHours<>24
  AND SedentaryHours<>0

-- total rows = 848
)

SELECT 
  fd.id,
  fd.ActivityDate,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM hd.ActivityHour)=1 THEN "(7) Sunday"
    WHEN EXTRACT(DAYOFWEEK FROM hd.ActivityHour)=2 THEN "(1) Monday"
    WHEN EXTRACT(DAYOFWEEK FROM hd.ActivityHour)=3 THEN "(2) Tuesday"
    WHEN EXTRACT(DAYOFWEEK FROM hd.ActivityHour)=4 THEN "(3) Wednesday"
    WHEN EXTRACT(DAYOFWEEK FROM hd.ActivityHour)=5 THEN "(4) Thursday"
    WHEN EXTRACT(DAYOFWEEK FROM hd.ActivityHour)=6 THEN "(5) Friday"
    WHEN EXTRACT(DAYOFWEEK FROM hd.ActivityHour)=7 THEN "(6) Saturday"
    ELSE NULL 
  END AS Weekday,
  EXTRACT(HOUR FROM hd.ActivityHour) AS Hour, 
  hd.TotalSteps, 
  hd.Calories, 
  hd.TotalIntensity, 
  hd.AverageIntensity
FROM filtered_dates fd
JOIN hourly_data_1 hd
  ON fd.Id=hd.Id
  AND fd.ActivityDate=EXTRACT(DATE FROM hd.ActivityHour)
ORDER BY 1,2,4;

-- total rows = 20093
-- new table saved as "hourly_data"
```
-->
![image](https://user-images.githubusercontent.com/115209534/226540038-0400030d-8858-4d35-9ef6-a76543849199.png)

The new version of table was saved as "**hourly_data**". This was the second dataframe for our analysis. 


## 5. SHARE (Data Visualization)

### 1. Device Usage

Users were categorised based on the number of days Fitbit was used - This information was important to draw conclusions from the fitness data.  
 
1. 0 to 13 days (less than 2 weeks) = inconsistent_user
2. 14 to 28 days (2 to 4 weeks) = moderately_consistent_user
3. 28 days and above (more than 4 weeks) = consistent_user

### 2. Activity Minutes

**[WHO](https://www.who.int/news-room/fact-sheets/detail/physical-activity)** recommends that people complete atleast 150 minutes of moderate activity a week.** This averages to ~20 minutes of moderate activity/day. Users were categorised based on Physical Activity Minutes metric. Very Active Minutes and Fairly Active Minutes were added to Physical Activity Minutes (PA Minutes), to determine each user's daily average of Physically Active Minutes. If PAMinutes >= 20 minutes/day, users were considered to have met this metric. If it was <20 minutes/day, they were consider not meeting the CDC guidelines. 

1. less than 20 mins = physically_inactive
2. 20 to 30 mins = physically_active
3. more than 30 mins = physically_very_active

### 3. Steps

[Studies](https://www.nih.gov/news-events/nih-research-matters/number-steps-day-more-important-step-intensity) show that **higher daily step counts link to better health**, even more than the Physically Active Minutes. Contrary to popular belief that 10,000 steps are the benchmark, [studies](https://karencollinsnutrition.com/10000-step-goal-5-key-questions/) discuss that health benefits of step count varies according to age and users' health. Therefore, based on Daily Total Steps, users were categorised as:   
  
1. less than 5000 steps = inactive
2. 5000 to 7499 steps = less_active 
3. 7500 to 9999 steps = moderately_active 
4. 10000 to 12499 steps = active 
5. more than 12500 steps = very_active

![image](https://user-images.githubusercontent.com/115209534/226658765-08b7c426-4b1a-4620-ae22-803d88ac4c10.png)

**INSIGHTS GENERATED**

1. **97% users used the Fitbit Smart Device for more than 2 weeks**. Upon breakout, about 57% users were consistent with the Fitbit use for more than 4 weeks. 
2. On the whole, **~65% users met the CDC metric of atleast 150 PA Mintes/week** or 20 minutes per day. Out of that, approximately **54% users were physically very active** and they overachieved the CDC recommended metric by spending > 30min per day on physical activities. However, approximately **35% users were physically inactive** and did not meet the physical activitiy metric.  
3. Approximately **25% users met the 10000 daily average steps mark**, but only 9% users walked more than 12000 steps on average every day and hence were considered to be very active. However, there were still many users who did not reach 10000 steps/day. **57% of the users were moderately active** by walking > 7500 steps everyday and **~21% of the users were completely inactive**, taking less than 5000 steps. 

### 4. Calories

User grouping based on calories burned was difficult without additionaly information on user's height, weight, health goals and other details. Additonally, **calories are burned even during sleep/resting.** According to a [healthline](https://www.healthline.com/health/calories-burned-sleeping#Determining-how-many-calories-you-burn) article, average person of 56 kg, burns 38 calories per hour sleeping. Therefore, minimum calories spent by an average user per day (24 hours) would be atleast be approximately 24 x 38 = 912 calories. 

### 5. Sleep

Hours of sleep varies for each person based on multiple factors like day of the week, amount of work done/energy spent in the day and user health among many more. **Adults are recommended to get between 7-9 hours of sleep a day on average** as per the [National Sleep Foundation's guidelines](https://pubmed.ncbi.nlm.nih.gov/29073398/#:~:text=Seven%20to%209%20hours%20is,is%20recommended%20for%20older%20adults.). 

**NOTE:** Sleep and Calories analysis are discussed in the later part of the report. 

**NOTE:** Total Minutes of the day, Missing Minutes of the day and Total Time In Bed were not calculated and/or considered for this analysis because there were data discrepencies for users who also tracked sleep time. 
For instance, (VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes + SedentaryMinutes + TotalMinutesAsleep or TotalTimeInBed) > 1440, which was NOT POSSIBLE (24 h x 60 min = 1440 minutes). Further to the lack of information on how the minutes are calculated in Fitbit and apparent overlap between SedentaryMinutes and TotalTimeInBed, above mentioned parameters were excluded. 


_Based on these initial observations, following hypothesis were made and tested on the data._

**HYPOTHESIS**

1. Users who walked more had active lifestyle as opposed to users who walked less and had sedentary lifestyle.  
2. Users who had sedentary lifestyle slept for longer hours.
3. Users were most active on Monday and least active on Weekends (Saturday & Sunday). 


### 6. Correlation Matrix

![image](https://user-images.githubusercontent.com/115209534/226561103-29cd3607-4393-4224-8ac9-ab668837d837.png)

Sample correlation coefficient **"r" measures the strength and direction of the linear relationship between two variables based on a sample of data**. It is a statistic that ranges from -1 to +1, where values closer to -1 or +1 indicate a stronger linear relationship between the variables, and values closer to 0 indicate a weaker linear relationship or no relationship at all.

Therefore, correlation between various parameters were observed by calculating the r value and then graphing them (Trendline = R<sup>2</sup>). **Negative values between -1 (Red colour) to 0 (Yellow color) show negative correlation and position values from 0 to 1 (Green color) show positive correlation.**

These basic calulcations were performed in [Google Sheets](https://docs.google.com/spreadsheets/d/1z5vwcx0YT5w2KEgtC7SbMa180G8nw5gjy63FEiuymfk/edit?usp=sharing) because BigQuery did not have this feature in free version and although Data Studio can show a best fit trendline, it does not calculate the R<sup>2</sup> value. 

After generating the correlation matrix, scatter plots were visualized for the values in Red and Green color  

**INSIGHTS GENERATED**

#### 6.1 Correlation between Steps and Calories / Physically Active Minutes / Sedentary Minutes
![image](https://user-images.githubusercontent.com/115209534/226588486-a957f2da-4b84-40df-8d15-24d0b536f1bb.png)

  - Steps had a positive correlation with Calories and Total Active Minutes with positive R<sup>2</sup> value, aligning with the first part of the hypothesis #1. **Some users who walked more were also physically active.** **High R<sup>2</sup> value of 0.5 for TotalSteps verses PAMinutes** also indicated that users were more inclined in the physical activities involving steps like running, playing sports and high intensity workouts. 
  - However, there was **no correlation between TotalSteps and SedenatryMinutes**, as against to the second part the hypothesis #1. Graph showed that many users walked more than 10000 and still had higher sedentary hours ranging from 7 to 20 hours. From this, it could be concluded that many users with non-sitting jobs also followed a sedenatry lifestyle. This also showed that most users were involved in walking than higher intensity physical activities. 
  - When compared Calories expenditure versus TotalSteps, R<sup>2</sup> value was 0.3. These were less correlated than otherwise assumed because people often confused correlation with causation. More steps caused more calories expenditure but the statistical association between the two is low.  

#### 6.2 Correlation between Calories and Physically Active Minutes
![image](https://user-images.githubusercontent.com/115209534/226584245-51e0371f-58c9-4c78-b958-3be4f5e59978.png)

  - **Positive correlation between Calories and Physical Activity Minutes** showed that more time spent in physical activities with moderate to high intensity, also incresed the calories burn, whereas **no correlation between Calories and Lightly Active Minutes** showed that more enegry spent in lightly activities did not cause any significant calories burn. 

#### 6.3 Correlation between Sleep Duration and Steps / Sedentary Hours
![image](https://user-images.githubusercontent.com/115209534/226584710-73acf9ec-f1e8-4438-88dc-e6302f402f2a.png)

  - Sleep duration (TotalHoursAsleep) had almost zero correlation with TotalSteps. 
  - By plotting TotalTimeAsleep against SedentaryHours, negative trendline with R<sup>2</sup>= 0.4 was obtained. This showed significant **negative corrleation between sleep duration and sedentary lifestyle**, opposed to hypothesis #2. Users who remained sedentary for most hours slept less time sleeping verses users who slept well and were more active. This disproved the hypothesis #2. 
  - It is commonly misunderstood that Sedentary lifestyle people sleep longer are more lazy. In the era of social media and smart devices, people spend more time on their laptops/devices, leading to less walking and more sitting BUT NOT more sleep time. 

### 7. Daily Trends of Steps, Calories, Activity Minutes and Sleep duration distributed over the Weekdays

Another important factor to look at for the Bellabeat Membership was to observe if there were certain trends during the week. 

![weekday_calories](https://user-images.githubusercontent.com/115209534/226634567-70223b3c-29ad-497c-af0c-498e85356b5d.jpg)

1. Overall there was not much variation in average calories burned between the days. This made sense because people burn the same amount of base calories every day.
2. However, **most calories were burned on Tuesday followed by Saturday**. This could be because users spent time in intenstive activities on these days and were in generally more active. This disproved the initial hypothesis #3. 
3. Least calories were burned on Thursday and Sunday respectively. 
4. Similar to calories pattern, highest average daily steps were achieved on Tuesday, very closly followed by Saturday. 
5. Whereas, **Sunday had, by a large margin, the lowest average value of daily steps**. 
 
![week_mins](https://user-images.githubusercontent.com/115209534/226636339-c2654963-b836-4540-a2cf-4f7ef440ef59.jpg)

1. **Users were more active at the start of the week** i.e. PAMinutes and LightlyActiveMinutes values are higher on Monday & Tuesday. 
2. SedengtaryMinutes decresed from Monday to Thursday indicating busy days for the users. 
3. **LightlyActiveMinutes were maximum on Saturday and minimum on Sunday.** 
4. **PAMinutes > 40 on Monday, Tuesday and Saturday **showing that users were most physically active on these days. 
    
![week_sleep](https://user-images.githubusercontent.com/115209534/226651322-c9d9806d-0098-4afa-8301-f3fb04ae1053.jpg)

1. Sleep trends were also consistent with above observations. **Users slept least on Tuesday and Thursday**. 
2. **Sleed duration increased from Friday and maximized on Sunday**, indicating that users got more sleep during the weekend. 
3. However, on average, **users did not get the [CDC recommended]**(https://www.cdc.gov/sleep/about_sleep/how_much_sleep.html) **hours of sleep (~7 hours)** on 5 out of 7 weekdays. 
4. Surprisingly, users also slept longer on Wednesday. This showed that users recharged mid-week after a rather intensi start of the week.  
5. **Total Hours In Bed were significantly higher on Sunday at 8.39 hours**, followed by Wednesday. This indicated that on other weekdays, users slept faster after getting in bed than on weekends. This could be due to exhaustion on the weekdays. 

### 8. Hourly Trends of Steps, Calories, Activity Minutes (Intensity).

#### Average Total Intensity by Hours of the Day

![hourly_intensity](https://user-images.githubusercontent.com/115209534/226819496-27c92a93-f39c-4f45-ae96-254fa6c37a33.jpg)

1. Total Intensity of the hours were representation of the activity levels spents in the hour (Sedentary, Light, Physically Active). From the graph, it was observed that **more than 90% of the average total intesity of the day was spent from 5PM to 7PM**. 
2. Another relatively **high intensity period was 12 NOON to 2PM**. This might be because users get the most work done in the first half of the day (ie. before lunch).
3. However, a **significant low was observed at 3PM**. This might indicate the resting hour post lunch. These insights were further confirmed by observing the energy spending pattern and total steps data. 


![hourly_trends](https://user-images.githubusercontent.com/115209534/226817668-e3a00067-d37e-4131-83e0-0e3a244f8255.jpg)

1. Similar to Intensity insights, **most calories were burned from 5PM to 7PM**, followed by 12 to 2PM. 
2. Users on average burned **more than 100 calories (Reference Line) from 8AM to 8PM**, indicating these to be the most energy exhaustive hours of the day. 
3. Sudden increase in TotalIntensity from 4AM to 5AM may indicate to the sudden awake from deep sleep (3AM to 4AM) periods of users. 
4. However, users seemed to be sedentary from 4AM to 5AM and then getting up around 6AM. **TotalSteps increased by 4X from 5AM to 6AM.**
5. There was also a consistent dip in the values of all parameters at 3PM.
6. As expected, least calories were burned during early hours of the day as this was when users slept and only body's baseline calories were burned.
 

## 6. ACT

### 6.1 Revisiting Business Task

The business task was to analyse smart device usage data of non-Bellabeat smart device (Fitbit) to gain insight about the fitness device usage trends within the global smart device taregt audience, as well as to discover how to use those insights on Bellabeat products to influence future Bellabeat marketing strategies. This was done by applying the said insights to the Bellabeat App & Membership in order to maximise profits and growth for the company and to capitalize on Bellabeat’s rapidly growing consumer base in the Wellness Tech Industry. 

### 6.2 Insights on Trends

1. The **users were not consistent with logging/tracking their data** each day over the course of the month, and **some users did not even wear their device**.
2. More users preferred tracking their basic wellness features like steps, calories, intensities and activity minutes than other advanced features such as sleep, heartrate or weight. Therefore, the **popularity of features were as : Daily Activity > Sleep Tracking > Heartrate Monitoring > Weight/BMI Logging. **
3. On average, **~65% users were physically active** and met the recommended 20 minutes physical activity per day.
4. **~75% users did NOT meet the 10000 daily average steps** mark. More than 50% of the users had an inactive-sedentary lifestyle. 
5. On most weekday (5 out of 7), **users slept less than the suggested minimum of 7 hours**.
6. **Users were most active on Tuesdays** with maximum activity minutes, steps taken, and most calories burned, very closely followed by Saturday. From this, it can be concluded that **users focused more on their fitness on Saturday** as they got more time.
7. A surprising observation was made for Wednesday. Users seemenly slept longer and spent comparately less time in physical activities. This showed that **users were more active at the start of the week and they reacharged on Wednesday**.
8. Sunday was obviously the most rested and laid back day of the week with least steps, activity minutes and calories burned. 
9. A general trend of **active hours from 8 AM to 8 PM** was observed.  
10. **Users were most active from 5 PM to 7PM** indicating their preferred exercise/ physical activity time. 
11. In the afternoon, **users were least active around 3PM** as the intensity levels, total steps and energy expenditures went down. 

### 6.3 Recommendations

1. Bellabeat could **offer incentives** for consistent tracking, like daily and weeekly challenges, in-app competitions against friends or other users. This would increase motivation and **drive user engagement on the app**. 
2. Bellabeat could **offer Wellness-points when the users achieved the set targets**, which could be redeemed for Bellabeat merchandise, exclusive access and discounts to future products, exclusive in-app features, etc. Additionally, **offer points could be higher for higher intensity workouts**, promoting more physical activities. 
3. Product promotions: Generated insights showed that users are less active between **8PM to 10PM**, shortly before they retire for the night. This could be used at the **ideal time for Bellabeat to schedule their advertising initiatives** for optimal results. This could allow Bellabeat to effectively reach its consumers. 
4. Bellabeat could **increase customer retention by focussing on personalized contents** that offer value to the users. This can include nutritional advice as part of its membership, which get into detail about healthy recipes and managing calories intake. It could also have a list and videos of activities that people can do to **burn some quick calories**. The average user's lifestyle is sedentary and they might lack time and motivation for fitness. This could be a good push to exercise and burn higher calories in short periods of time. 
5. Bellabeat could **create video content and blogs to educate its users** about the negative impacts of sedentary lifestyle and how to better it, using this as an opportunity to **promote its other products like Spring smart-bottle**. 
6. Bellabeat could c**ustom-notify the user of the ideal time to sleep** as per the user’s fitness levels for the day. This could be paired with the bed-time reminders of any medications, sleep music or next day alarms, if the user uses these fetaures.
7. Bellabeat could **design variants of its products** according to user type. Some users look for basic fitness tracking of steps, activity/intensity and calories, whereas some prefer advance features including sleep tracking, heartrate monitoring, oxygen levels etc. 
8. Bellabeat could **accessorise their wellness products (Leaf) with extra comfortable straps** which could be changed before sleep time. Users tend to remove their fitness bands during sleep for comfort reasons and this was user can be consistent with the data tracking. 

### 6.4 Next Steps

1. It is to be noted that this is a third party data collected for another competitive smart fitness device with many limitation. 
2. In order to perform a better analyse fitness trends of for use in Bellabeat products, I would suggest using a more **first-hand data collection** mode like conducting a survey of current consumers and also a survey from global consumer population. 

**REFERENCES:** All the sources and studies are added at the mention of it. 

**ACKNOWLEDGEMENT:** I used Kate Anderson's [Kaggle report](https://www.kaggle.com/code/kander87/bellabeat-case-study-sheets-sql-data-studio) as reference for this data analysis.

**ADDITIONAL DATA:** Links to google sheets are added at the source wherever mentioned and here is a link to [Looker Studio Dashboard](https://lookerstudio.google.com/reporting/92b9d0dd-d18f-43f9-ac39-369bc4b8eff6).

