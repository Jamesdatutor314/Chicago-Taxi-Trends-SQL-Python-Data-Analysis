SELECT 
    trips.start_ts,
    CASE 
        WHEN weather_records.description LIKE '%rain%' OR weather_records.description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions,
    trips.duration_seconds
FROM 
    trips
INNER JOIN 
    weather_records ON trips.start_ts = weather_records.ts
WHERE 
    trips.pickup_location_id = 50 
    AND trips.dropoff_location_id = 63
    AND EXTRACT(DOW FROM trips.start_ts) = 6
ORDER BY 
    trips.trip_id;