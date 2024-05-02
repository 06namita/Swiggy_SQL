Select * from swiggy; 

-- 1.HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
Select count(distinct restaurant_name) as high_rated_restaurants 
from swiggy Where rating > 4.5;

-- 2.WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
Select city,count(distinct restaurant_name) as restaurant_count
from swiggy
group by city
order by restaurant_count desc
limit 1;

-- 3.HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
Select count(distinct restaurant_name) AS  pizza_restaurants
from swiggy where restaurant_name like '%PIZZA%';

-- 4.WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
Select CUISINE,count(*) AS CUISINE_Count
from swiggy
group by CUISINE
order by CUISINE_Count desc
limit 1;

-- 5.WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
Select city,avg(rating) AS AVG_Rating
from swiggy 
group by city;

-- 6.WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
Select distinct restaurant_name, menu_category,max(price) as highest_price  
from swiggy
where menu_category='Recommended'
group by restaurant_name,menu_category
order by highest_price desc;

-- 7.Find the top 5 Most Expensive RESTAURANTS THAT OFFER CUISINE OTHER THAN Indian CUISINE
Select distinct restaurant_name,cost_per_person from swiggy
where cuisine<>'Indian'
order by cost_per_person desc
limit 5;

-- 8.FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.
Select distinct restaurant_name,cost_per_person 
from swiggy 
where cost_per_person > (Select avg(cost_per_person) from swiggy);

-- 9.RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES.
Select distinct t1.restaurant_name,t1.city,t2.city 
from swiggy t1 join swiggy t2
ON t1.restaurant_name=t2.restaurant_name 
and t1.city != t2.city;

-- 10.WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
Select distinct restaurant_name,menu_category ,Count(item) as no_of_items 
from swiggy
where menu_category = 'Main Course' 
group by restaurant_name,menu_category
order by no_of_items desc
limit 1;

-- 11.LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN
-- ALPHABETICAL ORDER OF RESTAURANT NAME.
Select distinct restaurant_name ,
(count(case when veg_or_nonveg='Veg' then 1 end )*100/count(*)) as vegetarian_percetage
from swiggy
group by restaurant_name
having  vegetarian_percetage = 100.00
order by  restaurant_name;

-- 12. WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS? 
Select distinct restaurant_name,avg(price) as average_price
from swiggy group by restaurant_name
order by average_price limit 1;

-- 13.WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
Select distinct restaurant_name,
count(distinct menu_category) as no_of_categories
from swiggy 
group by restaurant_name
order by no_of_categories desc
limit 5;

-- 14 .WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
Select distinct restaurant_name ,
(count(case when veg_or_nonveg='Non-veg' then 1 end )*100/count(*)) as nonvegetarian_percentage
from swiggy
group by restaurant_name
order by nonvegetarian_percentage desc limit 1;