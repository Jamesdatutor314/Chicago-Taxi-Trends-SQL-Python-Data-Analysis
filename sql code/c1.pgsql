SELECT 
    cabs.company_name, 
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN 
    trips ON cabs.cab_id = trips.cab_id
WHERE 
    CAST(trips.start_ts AS date) IN ('2017-11-15', '2017-11-16')
GROUP BY 
    cabs.company_name
ORDER BY 
    trips_amount DESC;