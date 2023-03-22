-- Total number of users who tracked various fitness parameters

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





-- To view the total row count of all the tables :

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


-- DATA CLEANING 

-- daily_activity table 

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


#2. checking null values

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



-- daily_sleep_data table 

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

-- 3 duplicate records found. Total records = 413.


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


#4. checking null values

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



-- hourly_calories/ hourly_steps/ hourly_intensities tables

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

#2. checking null values

SELECT Id, ActivityHour
FROM `Case_Study_2_Fitabase_Data.hourly_steps`
WHERE 1=1
AND Id IS NULL
AND ActivityHour IS NULL
AND StepTotal IS NULL;

-- no null values found. 





-- DATAFRAME_1 : daily_data

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


-- daily_data_1
#1. Finding outliers : min and max values for all the parameters (steps, intensities, calories, sleep) 

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


#2. Viewing outliers 

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

#3. Checking assumptions for non-usage days (filtered out data) 

SELECT *
FROM `Case_Study_2_Fitabase_Data.daily_data_1`
WHERE 1=1
AND TotalSteps=0 --5+72
OR Calories=0 --4in77
OR SedentaryHours=24 OR SedentaryHours=0 --85+2 total92
ORDER BY 1,2;

-- total rows = 92

#4. Putting filters to remove NON-USAGE days

SELECT *
FROM `Case_Study_2_Fitabase_Data.daily_data_1`
WHERE 1=1
AND TotalSteps<>0 
AND Calories<>0 
AND SedentaryHours<>24 
AND SedentaryHours<>0 
ORDER BY 1,2;

-- total rows = 940-92=848

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


-- DATAFRAME_2 : hourly_data

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
