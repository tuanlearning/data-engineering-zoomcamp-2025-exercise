select 
case
	when trip_distance <= 1 then '< 1'
	when trip_distance <= 3 then 'from 1 to 3'
	when trip_distance <= 7 then 'from 3 to 7'
	when trip_distance <= 10 then 'from 7 to 10'
	else '>10'
end distance_group,
count(1) volume
from public.green_taxi_data
where 1 = 1
and (lpep_pickup_datetime >= '2019-10-01' and date(lpep_pickup_datetime) < '2019-11-01')
or (lpep_dropoff_datetime >= '2019-10-01' and date(lpep_dropoff_datetime) < '2019-11-01')
group by 1;

select date(lpep_pickup_datetime),
max(trip_distance)
from public.green_taxi_data
where date(lpep_pickup_datetime) in ('2019-10-11','2019-10-24','2019-10-26','2019-10-31')
group by 1;

select b.zone, sum(a.total_amount) total_amount
from public.green_taxi_data a
left join public.zone b
on a.pulocationid = b.locationid
where date(a.lpep_pickup_datetime) = '2019-10-18'
group by b.zone
having sum(a.total_amount) > 13000;

select b.zone pickup_zone,
c.zone dropoff_zone,
a.tip_amount
from public.green_taxi_data a
left join public.zone b
on a.pulocationid = b.locationid
left join public.zone c
on a.dolocationid = c.locationid
where date(a.lpep_pickup_datetime) >= '2019-10-01'
and date(a.lpep_pickup_datetime) <= '2019-10-31'
and b.zone = 'East Harlem North'
order by a.tip_amount desc;