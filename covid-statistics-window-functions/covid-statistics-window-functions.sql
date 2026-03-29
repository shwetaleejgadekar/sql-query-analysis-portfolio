/*Q1.Compute new cases for each day. */
select 
    date, 
    state, 
    total_cases, 
    coalesce(total_cases - lag(total_cases) over (partition by state order by date), 1) as new_cases
from statistics;



/*Q2.To account for "administrative weekends" with fewer reports or missing data,
compute the smoothed rolling average between two preceding days and two following
days. */
select 
    date, 
    state, 
    total_cases,
    avg(total_cases) over (
        partition by state 
        order by date 
        rows between 2 preceding and 2 following
    ) as smoothed_avg_cases
from statistics;



/*Q3. Fetch latest available per state data from statistics. Note that states may
have different latest submission dates. (hint: ROW_NUMBER())*/
select date, state, total_cases, total_deaths
from (
    select 
        date, 
        state, 
        total_cases, 
        total_deaths,
        row_number() over (partition by state order by date desc) as rn
    from statistics
) as latest_data
where rn = 1;



/*Q4.Use the "latest data" derived from the above query and demographic information
to compute the mortality per 100,000 population.*/
select 
    s.state, 
    s.total_deaths, 
    d.population, 
    (s.total_deaths * 100000.0) / d.population AS mortality_rate_per_100k
from (
    select date, state, total_deaths
    from statistics
    where (state, date) in (
        select state, MAX(date) as latest_date
        from statistics
        group by state
    )
) as s
join `demographics-1` as d on s.state = d.state;



/*Q5.Find the biggest spike in new deaths per state. Sort them by the most recent
date, then by the count of new deaths. (hint: RANK())*/
select date, state, new_deaths 
from (
    select 
        date,
        state,
        new_deaths,
        rank() over (partition by state order by new_deaths desc, date desc) as death_rank
    from (
        select 
            date,
            state,
            total_deaths - coalesce(lag(total_deaths) over (partition by state order by date), 0) as new_deaths
        from statistics
    ) as DailyDeaths
) as RankedDeaths
where death_rank = 1
order by date desc, new_deaths desc;