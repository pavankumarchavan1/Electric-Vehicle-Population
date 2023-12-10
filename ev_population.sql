-- 1. Find the number of cities in each county.

SELECT DISTINCT(County), COUNT(DISTINCT(City)) AS no_of_cities
FROM e_vehicles
GROUP BY County
ORDER BY no_of_cities DESC;


-- 2. List the different electric vehicle models present in the database.

SELECT DISTINCT(Model), Make
FROM e_vehicles
GROUP BY Model
ORDER BY Make;


-- 3. What is the total number of electric cars by make?

SELECT DISTINCT(Make), COUNT(Model) AS Total_Cars
FROM e_vehicles
GROUP BY Make
ORDER BY Total_Cars DESC;


-- 4. What is the total number of unique models of electric cars by make?

SELECT DISTINCT(Make), COUNT(DISTINCT(Model)) AS model_count
FROM e_vehicles
GROUP BY Make
ORDER BY model_count DESC, Make;


-- 5. 10 Most common electric vehicle models

SELECT Make, Model, COUNT(Model) AS Model_count
FROM e_vehicles
GROUP BY Model
ORDER BY Model_count DESC
LIMIT 10;


-- 6. Which electric vehicle type is commonly sold?

SELECT DISTINCT(Electric_Vehicle_Type), COUNT(Electric_Vehicle_Type) AS EV_Type
FROM e_vehicles
GROUP BY Electric_Vehicle_Type
ORDER BY EV_Type DESC;


-- 7. Identify the top ten cities with the highest electric vehicle population.

SELECT DISTINCT(City), County, COUNT(VIN) AS Total_cars_by_city
FROM e_vehicles
GROUP BY City
ORDER BY Total_cars_by_city DESC
LIMIT 10;


-- 8. Which year has sold themost number of electric cars?

SELECT Model_Year, COUNT(Model_Year) AS Cars_sold_per_year
FROM e_vehicles
GROUP BY Model_Year
ORDER BY Cars_sold_per_year DESC
LIMIT 5;


-- 9. Count the number of charging slots available for electric vehicles.

SELECT Electric_Utility, COUNT(Electric_Utility) AS Charging_slots
FROM e_vehicles
GROUP BY Electric_Utility
ORDER BY Charging_slots DESC;


-- 10. Find the cities with the highest density of charging slots.

SELECT City, Electric_Utility, COUNT(Electric_Utility) AS Num_Charging_slots
FROM e_vehicles
GROUP BY City
ORDER BY Num_Charging_slots DESC;


-- 11. Determine the Average range of electric vehicles by make.

SELECT Make, AVG(Electric_Range) AS avg_range
FROM e_vehicles
WHERE Electric_Range <> 0
GROUP BY Make
ORDER BY avg_range DESC;


-- 12. Determine the percentage distribution of each electric vehicle make.

SELECT Make, COUNT(Make), ROUND(COUNT(Make) * 100 / (SELECT COUNT(*) FROM e_vehicles), 4) AS percent_dist
FROM e_vehicles
GROUP BY Make
ORDER BY percent_dist DESC;


-- 13. Determine the percentage distribution of each electric vehicle model.

SELECT Make, Model, COUNT(Model), ROUND(COUNT(Model) * 100 / (SELECT COUNT(*) FROM e_vehicles), 4) AS percent_dist
FROM e_vehicles
GROUP BY Model
ORDER BY percent_dist DESC;


-- 14. What is the total number of cars manufactured by Make according to Electric vehicle type?

SELECT DISTINCT (Electric_Vehicle_Type), Make, COUNT(Electric_Vehicle_Type) AS EV_Type
FROM e_vehicles
GROUP BY Make , Electric_Vehicle_Type
ORDER BY Make , Electric_Vehicle_Type;


-- 15. What is the total number of models manufactured by Make according to Electric vehicle type?

SELECT DISTINCT(Electric_Vehicle_Type), Make, Model, COUNT(Electric_Vehicle_Type) AS Cnt_EV
FROM e_vehicles
GROUP BY Make, Model, Electric_Vehicle_Type
ORDER BY Make, Model, Electric_Vehicle_Type, Cnt_EV DESC;


-- 16. Determine the percentage of Eligibility of vehicles for Clean Alternative Fuel Vehicle Eligibility

SELECT Clean_Alternative_Fuel_Vehicle_Eligibility, COUNT(Clean_Alternative_Fuel_Vehicle_Eligibility) AS Count_Fuel_Eligibility,
	CASE
		WHEN Clean_Alternative_Fuel_Vehicle_Eligibility = 'Clean Alternative Fuel Vehicle Eligible' THEN 'Eligible'
		WHEN Clean_Alternative_Fuel_Vehicle_Eligibility = 'Not eligible due to low battery range' THEN 'Not Eligible'
		ELSE 'Unknown'
	END AS Eligibility,
	ROUND(COUNT(Clean_Alternative_Fuel_Vehicle_Eligibility) * 100 / (SELECT COUNT(*) FROM e_vehicles), 2) AS Percent_eligible
FROM e_vehicles
GROUP BY Clean_Alternative_Fuel_Vehicle_Eligibility
ORDER BY Count_Fuel_Eligibility DESC;


-- 17. Which Models of vehicles are eligible to qualify as Clean Alternative Fuel Vehicle

SELECT Make, Model, Clean_Alternative_Fuel_Vehicle_Eligibility
FROM e_vehicles
WHERE Clean_Alternative_Fuel_Vehicle_Eligibility = 'Clean Alternative Fuel Vehicle Eligible'
GROUP BY Model
ORDER BY Make;


-- 18. What is the average range of electric vehicles?

SELECT AVG(Electric_Range) AS Avg_range
FROM e_vehicles
WHERE Electric_Range <> 0;


-- 19. What is the average range of electric vehicles which qualify for Clean Alternative Fuel Vehicle?

SELECT AVG(Electric_Range) AS Eligible_avg
FROM e_vehicles
WHERE Clean_Alternative_Fuel_Vehicle_Eligibility = 'Clean Alternative Fuel Vehicle Eligible';


-- 20. What is the average range of electric vehicles which are not eligible due to low battery range?

SELECT AVG(Electric_Range) AS Not_eligible_avg
FROM e_vehicles
WHERE Clean_Alternative_Fuel_Vehicle_Eligibility = 'Not eligible due to low battery range';
