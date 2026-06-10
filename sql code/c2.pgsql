SELECT 
    cabs.company_name, 
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN 
    trips ON cabs.cab_id = trips.cab_id
WHERE 
    (cabs.company_name LIKE '%Yellow%' OR cabs.company_name LIKE '%Blue%')
    AND CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY 
    cabs.company_name;