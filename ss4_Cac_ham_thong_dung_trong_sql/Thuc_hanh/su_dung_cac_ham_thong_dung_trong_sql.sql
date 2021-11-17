use bai3_QuanLySinhVien;
SELECT address, COUNT(student_id) AS 'Số lượng học viên'
FROM student
GROUP BY address;
-- Bước 3: Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG

SELECT S.student_id,S.student_name, AVG(Mark)
FROM student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
/* Bước 4: Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15 */
-- Đầu tiên hiển thị điểm trung bình các môn học của mỗi học viên 
HAVING AVG(Mark) > 15;
/* Bước 5: Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
Hiển thị danh sách điểm trung bình của các học viên/*
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.student_id);