-- Data Cleaning
-- 1. Remove Duplicates 
-- 2. Standardises Data
-- 3. Null Values or blank values
-- 4. Remove any columns 

show tables;

select * from layoffs;

-- -----------------------------

create table layoffs_staging
like layoffs;

insert layoffs_staging 
select * from layoffs;

-- -------------------------------------
-- 1. Remove Duplicates 

with duplicate_cte as
(
select * , 
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging
)
delete
from duplicate_cte
where row_num  >1;

-- --------------------------------------

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs_staging2
select * , 
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;


select * from layoffs_staging2
where row_num >1;

delete 
from layoffs_staging2
where row_num > 1;



-- -------------------------------------
-- 2. Standardises Data

select company,trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company); 

select * 
from layoffs_staging2
where industry like 'Crypto%';

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct country , trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like  'United States%';

select `date` , 
str_to_date(`date`, '%m/%d/%Y')
from layoffs_staging2;

-- -----------------------------
-- 3. Null Values or blank values

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;

select * from layoffs_staging2
where total_laid_off is NULL
AND percentage_laid_off is null;


select * from layoffs_staging2
where industry is null
or industry = ' ';

select * 
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
where (t1.industry is null or t1.industry = ' ') 
and t2.industry is not null;


select * from layoffs_staging2;


-- -----------------------------------
-- 4. Remove any columns 

select * from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is  null;

delete from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is  null;

select * from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;

