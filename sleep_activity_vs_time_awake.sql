WITH sleep AS (
  SELECT
    Id,
    DATE(SleepDay) AS sleep_date,
    (TotalTimeInBed - TotalMinutesAsleep) AS awake_minutes
  FROM `daring-precinct-489921-t5.FitBit_Fitness_Tracker.Sleep_Day_4_12_16_to_5_12_16`
),

activity AS (
  SELECT
    Id,
    DATE(ActivityDate) AS activity_date,
    TotalSteps
  FROM `daring-precinct-489921-t5.FitBit_Fitness_Tracker.Daily_Activity_4_12_16_to_5_12_16`
),

combined AS (
  SELECT
    s.Id,
    s.awake_minutes,
    a.TotalSteps
  FROM sleep s
  JOIN activity a
    ON s.Id = a.Id
    AND s.sleep_date = a.activity_date
)

SELECT
  CASE
    WHEN awake_minutes < 5 THEN '0-5 min'
    WHEN awake_minutes < 15 THEN '5-15 min'
    WHEN awake_minutes < 30 THEN '16-30 min'
    ELSE '30+ min'
  END AS awake_bucket,

  ROUND(AVG(TotalSteps), 2) AS avg_steps,
  COUNT(*) AS days_count

FROM combined

GROUP BY awake_bucket

ORDER BY
  CASE
    WHEN awake_bucket = '0-5 min' THEN 1
    WHEN awake_bucket = '5-15 min' THEN 2
    WHEN awake_bucket = '16-30 min' THEN 3
    ELSE 4
  END;