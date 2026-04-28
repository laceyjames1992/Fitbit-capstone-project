WITH sleep_1 AS (
  SELECT
    Id,
    DATE(date) AS sleep_date,
    COUNTIF(value = 1) AS TotalMinutesAsleep
  FROM `daring-precinct-489921-t5.FitBit_Fitness_Tracker.Minute_Sleep_3_12_16_to_4_11_16`
  GROUP BY Id, sleep_date
),

sleep_2 AS (
  SELECT
    Id,
    DATE(SleepDay) AS sleep_date,
    TotalMinutesAsleep
  FROM `daring-precinct-489921-t5.FitBit_Fitness_Tracker.Sleep_Day_4_12_16_to_5_12_16`
),

sleep AS (
  SELECT * FROM sleep_1
  UNION ALL
  SELECT * FROM sleep_2
),

activity AS (
  SELECT
    Id,
    DATE(ActivityDate) AS activity_date,
    Calories
  FROM `daring-precinct-489921-t5.FitBit_Fitness_Tracker.Daily_Activity_3_12_16_to_4_11_16`

  UNION ALL

  SELECT
    Id,
    DATE(ActivityDate) AS activity_date,
    Calories
  FROM `daring-precinct-489921-t5.FitBit_Fitness_Tracker.Daily_Activity_4_12_16_to_5_12_16`
),

combined AS (
  SELECT
    s.Id,
    s.sleep_date,
    s.TotalMinutesAsleep,
    a.Calories
  FROM sleep s
  JOIN activity a
    ON s.Id = a.Id
    AND s.sleep_date = a.activity_date
)

SELECT
  CASE
    WHEN TotalMinutesAsleep / 60 < 4 THEN '0-4 hrs'
    WHEN TotalMinutesAsleep / 60 < 6 THEN '4-6 hrs'
    WHEN TotalMinutesAsleep / 60 < 8 THEN '6-8 hrs'
    ELSE '8+ hrs'
  END AS sleep_bucket,

  ROUND(AVG(Calories), 2) AS avg_calories_burned,
  COUNT(*) AS days_count

FROM combined

GROUP BY sleep_bucket

ORDER BY
  CASE
    WHEN sleep_bucket = '0-4 hrs' THEN 1
    WHEN sleep_bucket = '4-6 hrs' THEN 2
    WHEN sleep_bucket = '6-8 hrs' THEN 3
    ELSE 4
  END;