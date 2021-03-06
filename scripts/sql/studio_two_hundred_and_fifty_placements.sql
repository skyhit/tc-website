SELECT m.user_id, CURRENT AS earned_date
FROM table(multiset(
SELECT ri.value::INTEGER AS user_id, rev.create_date as earned_date
FROM 
    resource_info ri
    JOIN upload AS up ON up.resource_id = ri.resource_id
    JOIN submission AS s ON s.upload_id = up.upload_id
	JOIN project AS p ON up.project_id = p.project_id
    JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
    JOIN prize AS pz ON s.prize_id = pz.prize_id
    JOIN review AS rev ON rev.submission_id = s.submission_id
WHERE 
    ri.resource_info_type_id = 1 AND
    up.upload_status_id = 1 AND
    pz.prize_type_id = 15 AND
	s.submission_type_id = 1 AND
	pc.project_type_id = 3 AND
	pz.place >= 1 AND
	p.project_status_id = 7
)) as m group by m.user_id
HAVING COUNT(*) >= 250
