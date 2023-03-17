# Bellabeat Data Analytics Case Study - How Can a Wellness Technology Company Play It Smart?

Created By: Simar Bhatt
Created On: 16th March 2023
Tools Used: Google Cloud Console - Bigquery, Sheets, Looker Studio, Github

### Scenario 
This is a Capstone project of Google Data Analytics Professional Certificate Course. 

For this case study, I am a junior data analyst working on the marketing analyst team at Bellabeat, a high-tech manufacturer of health-focused products for women. To answer the key business questions, I will follow the steps of the data analysis process: ask, prepare, process, analyze, share, and act.

Bellabeat is a successful small company, but they have the potential to become a larger player in the global smart device market. The cofounder and CCO of Bellabeat believes that analyzing smart device fitness data could help unlock new growth opportunities for the company. I have been asked to analyze other comopany's smart device data to gain insight into how consumers are using their smart devices and focus the findings on one of Bellabeat’s own products, to help guide marketing strategy for the company. I have to present my analysis and recommendations to the Bellabeat executive team. For more information, [check here](https://github.com/simarbhatt/Portfolio_Projects/files/10991301/Case-Study-2-_-How-can-a-wellness-technology-company-play-it-smart.pdf). 


### About the Company

[Bellabeat Inc.](https://bellabeat.com/) is a Silicon Valley company building tech-powered wellness products for women. It is a go-to wellness brand of health-focused smart jewelry-products and services for women. It was founded by Urška Sršen and Sando Mur in 213, with the vision to inspire and inform wowen around the world using beuatifully designed technology. Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women. Bellabeat collect data on **activity (steps, distance, calories, physical activities), sleep, stress, and reproductive health** through its wearables and accompanying products. This helps women better understand how their bodies work and make healthier choices. Since 2016, Bellabeat is revolutionizing the FemTech space with its innovate smart jewelry products. 

**Products:**
  1. **Leaf (Urban & Chakra)** - Health-tracking jewelry; Can be worn as a bracelet, necklace or clip; Connects to Bellabeat app to track daily wellness. ***USP- Asthetically pleasing, no screen display and upto 6 months of battery backup (No charging required!).*** 
  2. **Time** - Classic wellness tracker in the form of an analog watch; Connects to the Bellabeat app. 
  3. **Spring** - A smart water bottle powered by AI that tracks daily water intake. Connects to the Bellabeat app to track the hydration levels.  
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
  1. To analyze FitBit Fitness Tracker Data from thirty eligible users, in order to gain insights into how consumers use non-Bellabeat smart devices.  
  2. To focus on one of Bellabeat's product to apply these insights and guide marketing strategies and new growth opportunities for the company.
  
*For this case study, I will focus on marketing for the membership portion of the bellabeat product line in order to:*
  1. *Get new customer*
  2. *Increase customer retention*
  3. *Increase in company sales and profits (based on above two goals)*



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
3. **Metadata** - Data is available in the form of [18 .CSV files] (https://docs.google.com/spreadsheets/d/1FPTn2nm8lWLAFDUlbRtW91OB5bUqDKDyCT6997yA-4I/edit?usp=sharing). However, the tables found relevant to analysis were only 5 - daily_activity, hourly_calories, hourly_steps, hourly_intensities and daily_sleep. Reason for the elimination of other tables is given under the Section 2.3.  
4. **Preparation**  - Downloaded the datasets using the Kaggle link given above. 
                    - Previewed and renamed in Google Sheets. 
                    - Uploaded in Bigquery platform. 

**2.2 Dataset Credibility (ROCCC)**  
1. **Reliability** - Open-access dataset made available through Kaggle, with verified source. 
2. **Originality** - [Third party dataset](https://zenodo.org/record/53894#.X9oeh3Uzaao). Data was generated by respondents to a distributed survey via Amazon Mechanical Turk, and uploaded on Kaggle by Mobius. 
3. **Comprehensive** - 33 Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring for 31 days. 
4. **Current** - Not recent but not outdated as well since it's not older than 10 years. Survey was conducted between 03rd Dec 2016 and 05th Dec 2016 and the data records were collected for 12th June 2016 to 12th July 2016. 
5. **Cited** - CC0: Public domain. Open access crowd-sourced Fitbit datasets (https://zenodo.org/record/53894#.X9oeh3Uzaao) 

**2.3 Dataset Limitations**
1. **Small sample size** 
  - Data of 33 users is not representative of the target audience size of more than 20 million users as of 2016. (Source: Published by 
Federica Laricchia in Sep 6, 2022 at [Statista website]) (https://www.statista.com/statistics/472600/fitbit-active-users/#statisticContainer) Therefore, any relationship established from this dataset will have a low confidence level. 
2.  **Insufficient data**
   - The time period for data collection was relatively short (only 31 days). A longer collection time would have been beneficial to avoid a potential sampling bias. This data is most likely not enough to make conclusions on fitness trends, and is therefore, not enough to drive business decisions. 
3. **Incomplete data**
    - Total number of users who tracked various fitness parameters (Activities - Steps, Calories, Physical Activity Minutes, Sleep and Heartrate) 

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

![image](https://user-images.githubusercontent.com/115209534/225827500-8798cbd9-af1c-47f6-8098-a1bfa80028ab.png)

  - **Inconsistent no. of users**: Likely reason for the inconsistent no. of users is the varient of Fitbit used. Not all variants of device collect heartrate and sleep data. 
    
  - **Inconsistency in data tracker for hours per day**: User data for few hours of the day are missing. Reasons for these could be that some users might not have been wearing or reporting their tracking information every day, implying their watches may have been off for some time (as for charging). 
            
4. **Old and outdated data**
    - As the data was recorded in 2016, the analysed and generated insight cannot be reliably extrapolated for today's population. 

5. **Missing demographic details**
    - Information on gender, age, ethnicity and race of the users is missing which causes ambiguity. These limitations will lead to data bias. 

*However, the data is still usable to start seeing trends in users' days that could help to improve bellabeat's user experience.*

**NOTE:** For this analysis, the CSV files tracking information by the minute were not utilized as that level of detail is not necessary for the bigger picture analysis. Additionally, the MET (Metabolic equivalent of task) data was not used as this information is useful only for comparison at individual user level. MET data shows a user their level of exertion from a baseline but cannot really be used as a comparison in-between users. Therefore, this data is not necessary for analysis. Heartrate data is also eliminated from the analysis because the recorded data does not give information of the resting heartrates of the users which is necessary for comparison and also due to the limited no. of users (14 users). Moreover, the weight log data is irreleavent for the purpose of analysis due to limited no. of total users (7 users). 


## 3. PROCESS
**3.1 Tools used for analysis**
Spreadsheets and SQL was used for data analyse on **Google Cloud Console - 
  - For Data Transformation & Basic Visualization: **Google Sheets
  - For Data Manipulation, Exploration, & Analysis: **SQL Bigquery**. New project was named "Google Analytics Project" and dataset was named - "Case_Study_2_Fitabase_Data". Each table uploaded from the original dataset was renamed as mentioned under the header 2.3.
  - For Data Visualization: **Google Data Studio/Looker Studio 
  - For Data Presentation: **Github**

**3.2 Data Integrity**
To ensure data integrity, original files of the datasets were kept. 

There were multiple cases where user data was unusable or incomplete due to the tracking data being missing. For example, by adding the activity minutes in daily_activity, it was observed that most users did not wear their watches for the full day (or the data was not submitted). Additonally, some record showed that TotalSteps and TotalActivityMinutes of the day were zero and SedenatryMinutes were 1440 (Total minutes in 24 hours = 1440). This is not possible if the device was used. In such cases, the data was assumed to be unreliable and inaccurate and needed to be removed from the dataset. Detail information of the deleted records can be found in ----.  

Samples size, margin of error, confidence rate

**3.3 Data Manipulation**
  1. **Data Transformation** - Both Sheets and SQL was used to convert the data types. 
      - ActivityDate was already in correct DATE format. 
      - ActivityHour had inconsistent datetime format and hence was convered into YYYY-MM-DD HH:MM:SS in Sheets. While uploading the table on Bigquery, this column data type was recognised in TIMESTAMP format. 
      - SleepDay was convered into YYYY-MM-DD HH:MM:SS in Sheets. While uploading the table on Bigquery, this column data type was recognised in TIMESTAMP format. 
      - All other columns of the tables were consistent in their data types when uploaded on the Bigquery. Therefore, they did not require any data type transformations. 

  2. **Table Information** 
Basic information of the tables (No. of rows and schema) was viewed before data manipulation to get the overview of the type of data to be analysed. 

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

![image](https://user-images.githubusercontent.com/115209534/225868505-32983764-27d8-4537-8d86-50b2c43e1f01.png)

  3. **Data Cleaning** 

**- daily_activity table **

```
#1. checking duplicates

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
#2. checking null values

SELECT Id, ActivityDate
FROM Case_Study_2_Fitabase_Data.daily_activity
WHERE 1=1
AND Id IS NULL
AND ActivityDate IS NULL;
-- no null values found. 
```

**- hourly_calories/ hourly_steps/ hourly_intensities tables** (Same data cleaning steps were followed for all three tables. Code and example shown only for hourly_steps table)

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
AND ActivityHour IS NULL;
-- no null values found. 
```

**- daily_sleep_data table **

```
#1. checking duplicates

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
-- 3 duplicate entries found. Total entries = 413.
```

![image](https://user-images.githubusercontent.com/115209534/225863905-56d0c0a6-3a78-4a50-9d51-6629a8e89a6d.png)

```
-- Find the duplicates  
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
-- Filter out these entries from the table. 
-- After filtering, table obtained is 
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
-- Total entries after removing duplicates = 410. 

# After removing the duplicate entries, Table is store as daily_sleep_cleaned. (Table View)
```

![image](https://user-images.githubusercontent.com/115209534/225864684-17aa858c-0795-40cc-a24e-958eaab46af5.png)

```
#2. checking null values

SELECT Id, SleepDay
FROM `Case_Study_2_Fitabase_Data.daily_sleep_data`
WHERE 1=1
AND Id IS NULL
AND SleepDay IS NULL;
-- no null values found. 
```


**3.4 Change Log** 
  - All the changes made in the dataset to the tables were logged in this Github file. 
  - Cleaned data of daily_sleep_data table was stored in a new table view named "daily_sleep_cleaned".


## 4. ANALYZE
**4.1 Data Exploration** - correlations, hypothesis

**- daily_activity table **

```
# Finding outliers : min and max values for all the parameters (steps, intensities & calories) 

SELECT
  min(TotalSteps) as min_steps,
  max(TotalSteps) as max_steps,
  min(VeryActiveMinutes) as min_very_active_mins, --vigorous_intensity
  max(VeryActiveMinutes) as max_very_active_mins, 
  min(FairlyActiveMinutes) as min_moderately_active_mins,--moderate_intensity
  max(FairlyActiveMinutes) as max_moderately_active_mins,
  min(LightlyActiveMinutes) as min_lightly_active_mins, --light_intensity
  max(LightlyActiveMinutes) as max_lightly_active_mins,
  min(SedentaryMinutes) as min_sedentary_mins, --resting_intensity
  max(SedentaryMinutes) as max_sedentary_mins,
  min(Calories) as min_cals_burnt,
  max(Calories) as max_cals_burnt,
FROM Case_Study_2_Fitabase_Data.daily_activity;
```

![image](https://user-images.githubusercontent.com/115209534/225888340-71d67440-1042-42f5-a535-380638b10deb.png)

**OBSERVATIONS** 
1. Minimum values for all the parameters were zero. This was not possible if a Fitbit device was used at all in a day. 
2. Even if a user was considered bed-ridden, their body would spend calories. According to a [healthline](https://www.healthline.com/health/calories-burned-sleeping#Determining-how-many-calories-you-burn) article, average person of 56 kg, burns 38 calories per hour sleeping. Therefore, minimum calories spent by a user if resting/sleeping all day (24 hours) would be atleast more than 24 x 38 = 912 calories. 
3. SedenatryMinutes is the time spent in minutes while not moving at all for more than 10 minutes consecutively. This includes the time spent sitting and sleeping (for devices which do not track sleep data). Therefore, even if a user is very active for 12 hours of the day, they do rest for some minutes. Hence, SedentaryMinutes cannot be 0. 
4. All the maximum values like TotalSteps=36019 and Calories=4900 indicate an outlier with a very active lifestyle, mostly indicating an athelete or someone who might have run a marathon. 

**NOTE:** SedentaryMinutes and Calories are measured the entire day even when the device is not worn. Therefore, according to the [fitabase.com](https://community.fitbit.com/t5/Other-Charge-Trackers/sedentary-minutes/td-p/3372621) default SedentaryMinutes are 1440 for every Fitbit device. 

**INFERENCES**
1. Minimum values are inconsistent with usage of smart device and it might be possibe that user did not wear the device on these days or removed the device too soon. 
To cross check the non-usability of device, filtered the daily_activities table for TotalSteps=0 OR Calories=0 OR SedentaryMinutes=0 OR SedentaryMinutes=1440. 

```
#Identifying potential outliers which may skew the data 

SELECT 
  Id,
  ActivityDate, 
  TotalSteps, 
  VeryActiveMinutes, 
  FairlyActiveMinutes, 
  LightlyActiveMinutes, 
  SedentaryMinutes, 
  SedentaryMinutes/60 AS SedentaryHours,
  CASE 
    WHEN (VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes + SedentaryMinutes)=1440 AND SedentaryMinutes<>1440 THEN "TRUE"
    ELSE "false" 
  END AS ActivityFLAG, ---Flag is created for user who might have done some physical activity even if otherwise sedentary (assumption: any patient)
  Calories, 
FROM `Case_Study_2_Fitabase_Data.daily_activity`
WHERE 1=1
AND TotalSteps=0
OR Calories<912
OR SedentaryMinutes=0
OR SedentaryMinutes=1440
ORDER BY 1,2;

--- Total rows returend = 88.
```

![image](https://user-images.githubusercontent.com/115209534/225909590-252f573e-b2b2-4c77-b86a-e021793b97cf.png)

2. Above records were manually checked and many discrepancies were observed. For example, some users had SedentaryMinutes=1440 and TotalSteps>3000. 
3. All these rows were removed except for the one row where the ActivityFLAG = TRUE. 

```
SELECT 
  Id,
  ActivityDate, 
  TotalSteps, 
  VeryActiveMinutes, 
  FairlyActiveMinutes, 
  LightlyActiveMinutes, 
  SedentaryMinutes, 
  ROUND(SedentaryMinutes/60) AS SedentaryHours,
  Calories, 
FROM `Case_Study_2_Fitabase_Data.daily_activity`

EXCEPT DISTINCT

SELECT 
  Id,
  ActivityDate, 
  TotalSteps, 
  VeryActiveMinutes, 
  FairlyActiveMinutes, 
  LightlyActiveMinutes, 
  SedentaryMinutes, 
  ROUND(SedentaryMinutes/60) AS SedentaryHours,
  Calories, 
FROM `Case_Study_2_Fitabase_Data.daily_activity`
WHERE 1=1
AND TotalSteps=0
OR Calories<912
OR SedentaryMinutes=0
OR SedentaryMinutes=1440

EXCEPT DISTINCT

SELECT 
  Id,
  ActivityDate, 
  TotalSteps, 
  VeryActiveMinutes, 
  FairlyActiveMinutes, 
  LightlyActiveMinutes, 
  SedentaryMinutes, 
  ROUND(SedentaryMinutes/60) AS SedentaryHours,
  Calories, 
FROM `Case_Study_2_Fitabase_Data.daily_activity`
WHERE 1=1
AND Id=6290855005
AND ActivityDate='2016-04-23'
ORDER BY 1,2;
```

```
# TotalSteps=0
SELECT *
FROM `Case_Study_2_Fitabase_Data.daily_activity`
WHERE 1=1
AND TotalSteps=0;
-- 77 entries 

#4.4
SELECT *
FROM `Case_Study_2_Fitabase_Data.daily_activity`
WHERE SedentaryMinutes = 1400; 
-- Out of 100 entries, 77 overlap with TotalSteps=0 query. 
-- For 7 entries, total steps > 3000 and sedenatry minute = 1440. This is weird and some technical error because it is impossible. 
----- RESULT: We can conclude based on common sense and fitbit info availability that, TotalSteps=0 and SedentaryMinutes=1440 cannot be possible. Therefore, to remove the non-usage days from daily_activity table, filter is applied for TotalSteps<>0 AND SedentaryMinutes<>1440 for further analysis. And this Table is called as daily_activity_cleaned.(View)

#daily_activity_cleaned (table view)

SELECT *
FROM `Case_Study_2_Fitabase_Data.daily_activity`
--940 rows

EXCEPT DISTINCT 

SELECT *
FROM `Case_Study_2_Fitabase_Data.daily_activity`
WHERE 1=1
AND SedentaryMinutes=1440
AND TotalSteps=0;
--72 rows

# rows in new table = 868
```

**- hourly_calories/ hourly_steps/ hourly_intensities tables**

```
-- IDENTIFY OUTLIERS 
SELECT 
  Hour,
  MIN(StepTotal),
  MAX(StepTotal),
  MIN(Calories),
  MAX(Calories),
  MIN(TotalIntensity),
  MAX(TotalIntensity)
FROM `Case_Study_2_Fitabase_Data.hourly_data`
GROUP BY 1

ORDER BY 1
#4. Removing days when device was not worn but the data got collected
/*TotalSteps=0 And TotalIntensity=0 not possible if the deivce was used. 

SELECT
  User,
  Date,
  SUM(StepTotal) AS TotalSteps,
  SUM(Calories) AS Calories,
  SUM(TotalIntensity) AS TotalIntensity
FROM `Case_Study_2_Fitabase_Data.hourly_data`
GROUP BY 1,2
HAVING 1=1
AND TotalSteps=0
AND TotalIntensity=0
ORDER BY 1,2

---- HOURLY_DATA table view

SELECT 
  step.Id AS User,
  EXTRACT(DATE FROM step.ActivityHour) AS Date,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM step.ActivityHour)=1 THEN "(7) Sunday"
    WHEN EXTRACT(DAYOFWEEK FROM step.ActivityHour)=2 THEN "(1) Monday"
    WHEN EXTRACT(DAYOFWEEK FROM step.ActivityHour)=3 THEN "(2) Tuesday"
    WHEN EXTRACT(DAYOFWEEK FROM step.ActivityHour)=4 THEN "(3) Wednesday"
    WHEN EXTRACT(DAYOFWEEK FROM step.ActivityHour)=5 THEN "(4) Thursday"
    WHEN EXTRACT(DAYOFWEEK FROM step.ActivityHour)=6 THEN "(5) Friday"
    WHEN EXTRACT(DAYOFWEEK FROM step.ActivityHour)=7 THEN "(6) Saturday"
    ELSE NULL 
  END AS WeekDay,
  EXTRACT(TIME FROM step.ActivityHour) AS Hour,
  step.StepTotal,
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
ORDER BY 1,2,4;
*/

-- TABLE PREVIEW

SELECT *
FROM `Case_Study_2_Fitabase_Data.hourly_data`
WHERE Calories>300
ORDER BY 5 DESC

----


select *, 
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=1 THEN "(7) Sunday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=2 THEN "(1) Monday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=3 THEN "(2) Tuesday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=4 THEN "(3) Wednesday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=5 THEN "(4) Thursday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=6 THEN "(5) Friday"
    WHEN EXTRACT(DAYOFWEEK FROM ActivityDate)=7 THEN "(6) Saturday"
    ELSE NULL 
  END AS WeekDay,
from `Case_Study_2_Fitabase_Data.daily_data` a
left join `Case_Study_2_Fitabase_Data.hourly_data` b
  ON a.Id=b.User
  AND a.ActivityDate=b.Date
ORDER BY User, Date, Hour;


----


SELECT
  User,
  Date,
  SUM(StepTotal) AS TotalSteps,
  SUM(Calories) AS Calories,
  SUM(TotalIntensity) AS TotalIntensity
FROM `Case_Study_2_Fitabase_Data.hourly_data`
GROUP BY 1,2
EXCEPT DISTINCT

SELECT
  User,
  Date,
  SUM(StepTotal) AS TotalSteps,
  SUM(Calories) AS Calories,
  SUM(TotalIntensity) AS TotalIntensity
FROM `Case_Study_2_Fitabase_Data.hourly_data`
GROUP BY 1,2
HAVING 1=1
AND TotalSteps=0
AND TotalIntensity=0
ORDER BY 1,2


```


**- daily_sleep_data table **

```
#4. finding outliers : min and max values for all the users for all 3 features (steps, intensities & calories) 

SELECT
  Id,
  ROUND ((min(TotalMinutesAsleep))/60, 2) as min_hr_sleep,
  ROUND ((max(TotalMinutesAsleep))/60, 2) as max_hr_sleep,
  ROUND ((min(TotalTimeInBed))/60, 2) as min_hr_in_bed,
  ROUND ((max(TotalTimeInBed))/60, 2) as max_hr_in_bed, 
  min(TotalSleepRecords) as min_sleep_records,
  max(TotalSleepRecords) as max_sleep_records,
  COUNT(*)
FROM `Case_Study_2_Fitabase_Data.daily_sleep_data`
GROUP BY 1
ORDER BY 1;
# INFERENCES : Nothing out of place values found. Everything looks good. 

```



**4.2 Data Wrangling** - working data sets

**4.3 Data Aggregating**


## 5. SHARE
**5.1 Data Visualization**

## 6. ACT
