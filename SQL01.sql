create table Projects
(
  Task_ID int,
  Start_Date date,
  End_Date date
 );
 
 insert into Projects (Task_ID,Start_Date,End_date)
 values
 (1,'2015-10-1','2015-10-2'),
 (2,'2015-10-2','2015-10-3'),
 (2,'2015-10-3','2015-10-4'),
 (1,'2015-10-13','2015-10-14'),
 (1,'2015-10-28','2015-10-29'),
 (1,'2015-10-30','2015-10-31');
 
WITH CTE AS (
    SELECT
        Start_Date,
        End_Date,
        DATEADD(day, - ROW_NUMBER() OVER(ORDER BY Start_Date), Start_Date) [Grouping]
    FROM Projects
)
SELECT 
    MIN(Start_Date) [Start_Date],
    MAX(End_Date) [End_Date]
FROM CTE
GROUP BY Grouping
ORDER BY DATEDIFF(day, MIN(Start_Date), MAX(End_Date)), MIN(Start_Date)