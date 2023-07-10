ALTER TABLE car
ADD COLUMN is_serviced BOOLEAN;

UPDATE car
set is_serviced = service_history

UPDATE car
SET is_serviced = True
FROM service
WHERE car.car_id = service.service_id and service.service_provided = 'Oil Change' 

SELECT *
from car
ORDER BY car_id


-- Before this update, the service history was as following: T, T, F, F. We then set the service_history to is_serviced as i thought they were esentially the same column.
-- After then running the update and calling service, I found that car 1 and car 3 had old change, so we had to set is_serviced to True for that.  