# Fitbit-capstone-project

## Business Objective 
The business objective is to use the Fitbit Fitness tracker data to find trends and patterns between 30 users data. 

## Dataset 
- Source: Kaggler Fitbit Fitness Tracker Data
- Dataset: Daily Activity
- Dataset: Sleep Activity
- Dataset: Weight Log 
- Dataset: Daily Steps 

## Tools Used 
- SQL (BigQuery) - Data transformation and analysis
- Spreadsheets (Excel): Data cleaning and validation
- Tableau: Data visualization and dashboard creation
    
## Key Questions
- Is there a relationship between calories burned and sleep levels?
- Is there a relationship between steps and sleep?
- Does time spent in bed after waking affect activity levels?
- Is there a relationship between sleep and calories burned?

## Analysis Process
- Used the Google Analytics analysis proccess.
- Ask
- Prepare
- Process
- Analyze
- Act

## Key Insights 
- Users who sleep 4–6 hours take 9.2% more daily steps than users who sleep 6–8 hours, although the 6–8 hour group has a larger sample size, indicating more consistent behavior.
- Peak daily activity occurs when users remain in bed for 5–15 minutes after waking, with this group averaging the highest step counts (9.4K steps).
- Users who stay in bed longer than 30 minutes after waking show lower activity levels, suggesting prolonged inactivity may reduce daily movement.

## Recommendations - Creating a alarm system in the FitBit device, or a seperate alarm system connected via bluetooth that wakes you after 6-8 hours of sleep. 
- Introduce behavior-based nudges (e.g., morning activity reminders) to reduce prolonged inactivity after waking.
- Encourage users to maintain consistent sleep patterns, with a focus on optimizing sleep quality rather than just duration.

## Files in this Repository 
- [Sleep vs Steps](sleep_vs_steps.sql)
- [Sleep vs Calories](sleep_vs_calories.sql)
- [Sleep vs Awake Time](sleep_activity_vs_time_awake.sql)

## Tableu Dashboard
View the interactive dashboard here.
[FitBit activity dashboard](https://public.tableau.com/app/profile/lacey.james4273/viz/FitbitSleepActivityAnalysisDashboard/Dashboard1#1)
