-- EDA

select *
from layoffs_2;

-- 1. Get the top 5 companies with the highest total layoffs:
select company,sum(total_laid_off) as Total_laid_off
from layoffs_2
group by company
order by total_laid_off desc
limit 5;

-- 2 List all companies in the 'India' country:
select company,country
from layoffs_2
where country = 'India'
order by company asc;

-- 3.Get all layoffs that happened after 1st May 2025:
select total_laid_off,fixed_date
from layoffs_2
where fixed_date>'2025-05-01';

-- 4 Find companies from the 'Healthcare' industry:
select company,industry
from layoffs_2
where industry = "Healthcare";

-- 5 Count how many companies are in each country:
select count(company),country
from layoffs_2
group by country;

-- 6 Get total layoffs per industry:
select sum(total_laid_off),industry
from layoffs_2
group by industry;

-- 7 List companies with more than 200 layoffs and over 20% laid off:
select company,total_laid_off,percentage_laid_off
from layoffs_2
where total_laid_off > 200 and percentage_laid_off > "20%";

-- 8  Get the average percentage of layoffs by industry:
select avg(percentage_laid_off),industry
from layoffs_2
group by industry;

-- 9 List the latest layoff event by each company:
select company,max(fixed_date)
from layoffs_2
group by company;

-- 10 Find companies that are in Series A or Series B stage:
select company,stage 
from layoffs_2
where stage = "Series A" or"Series B";

-- 11 Get a rolling total of layoffs ordered by date (window function):
select company, total_laid_off,fixed_date,
sum(total_laid_off) over(order by fixed_date)
from layoffs_2;

-- 12 Rank companies based on total laid off per country:
select company, total_laid_off,fixed_date,
dense_rank() over (partition by company order by total_laid_off)
from layoffs_2;

-- 13 Find the industry with the highest total layoffs per country:
SELECT country, industry, SUM(total_laid_off) AS total_layoffs
FROM layoffs_2
GROUP BY country, industry
ORDER BY country, total_layoffs DESC;

-- 14 Identify the date with the highest total layoffs:
select fixed_date,total_laid_off
from layoffs_2
order by total_laid_off desc
limit 1;

-- 15 Compare layoffs between post-IPO and other funding stages:
select stage,sum(total_laid_off) as Laid_off
from layoffs_2
group by stage
order by Laid_off desc;

-- 16 Top 5 company with most laid of in year 2023
SELECT company, total_laid_off,year(`fixed_date`),location
from layoffs_2
where year(`fixed_date`)=2023
order by total_laid_off desc
limit 5;

-- 17 Total people laid of by year
select sum(total_laid_off),year(`fixed_date`)
from layoffs_2
group by year(`fixed_date`);

-- 18.  10 industries that had max laid of
select industry,sum(total_laid_off )
from layoffs_2
group by industry
order by sum(total_laid_off) desc
limit 10;

-- 19 Rolling total laid of by months 
with Rolling_total as
(
select sum(total_laid_off) as total_laid,substring(fixed_date,1,7)as months
from layoffs_2
group by months
order by months desc
)
select months ,sum(total_laid) over(order by months) as rolling_total
from Rolling_total;

-- 20 rank companies by total laid of in each year
with company(company,years,total_laid_off) as
(
select company,year(fixed_date),sum(total_laid_off)
from layoffs_2
group by company,year(fixed_date)
order by year(fixed_date) asc
)
select *,dense_rank() over(partition by years order by total_laid_off desc) as Ranking
from company
 order by years asc;
 
 -- 

