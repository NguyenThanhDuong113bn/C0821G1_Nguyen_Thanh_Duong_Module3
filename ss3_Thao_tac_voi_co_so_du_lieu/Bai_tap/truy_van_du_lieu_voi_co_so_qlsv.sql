use QuanLySinhVien;
INSERT INTO class
VALUES 
(1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1);

INSERT INTO student (student_name, address, phone, `status`, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, `status`, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, `status`, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO `subject`
VALUES 
(1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);
INSERT INTO mark (subject_id, student_id, mark, exam_times)
VALUES 
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);
-- Truy vấn dữ liệu
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student
where student_name like "H%";
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class
where month(start_date) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from `subject`
where credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student
set class_id = 2
where student_name = "Hung";
/* Hiển thị các thông tin: StudentName, SubName, Mark. 
Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. 
nếu trùng sắp theo tên tăng dần.*/
select student_name, subject_name, mark
from student
inner join mark on student.student_id = mark.student_id
inner join `subject` on mark.subject_id = `subject`.subject_id
order by mark.mark desc, student.student_name asc;