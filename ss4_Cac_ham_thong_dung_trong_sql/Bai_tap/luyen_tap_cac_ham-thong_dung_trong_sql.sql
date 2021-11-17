
use bai3_quanlysinhvien;
SELECT 
    sub_id,
    sub_name,
    `status`,
    MAX(credit) AS max_credit
FROM
    `subject`;
-- Hiển thị thông tin môn học có điểm lớn nhất
SELECT 
    s.sub_id,
    s.sub_name,
    s.credit,
    s.`status`,
    MAX(m.mark) AS max_mark
FROM
    `subject` s
        JOIN
    mark m ON s.sub_id = m.sub_id
GROUP BY m.sub_id
HAVING MAX(m.mark) >= ALL (SELECT 
        MAX(m.mark)
    FROM
        mark m
    GROUP BY m.sub_id);
    
    -- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
    SELECT 
    s.student_id,
    s.student_name,
    s.address,
    s.phone,
    s.`status`,
    s.class_id,
    AVG(m.mark) AS avg_mark
FROM
    student s
        JOIN
    mark m ON m.student_id = s.student_id
GROUP BY m.student_id
ORDER BY AVG(m.mark) DESC;