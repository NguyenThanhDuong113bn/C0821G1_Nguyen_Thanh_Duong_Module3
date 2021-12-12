drop database if exists tcomplex;

create database tcomplex;

use tcomplex;

create table mat_bang (
ma_mat_bang varchar(20) not null unique primary key,
trang_thai varchar(15) not null,
dien_tich double not null,
so_tang int(11) not null,
loai_mat_bang varchar(50) not null,
gia_the varchar(50) not null,
ngay_bat_dau date not null,
ngay_ket_thuc date not null);

insert mat_bang 
values
('xxx-xx-','trong',30,1,'van phong',10,'2021-01-01','2021-01-01'),
('xxx-yx','trong',30,1,'van phong',10,'2021-01-01','2021-01-01'),
('xxx-zx','trong',30,1,'van phong',10,'2021-01-01','2021-01-01'),
('xxx-g','trong',30,1,'van phong',10,'2021-01-01','2021-01-01'),
('xxx-sx','trong',30,1,'van phong',10,'2021-01-01','2021-01-01');
-- insert mat_bang 
-- values
-- (?,?,?,?,?,?,?,?);

select *
from mat_bang
order by dien_tich;

-- delete from mat_bang
-- where ma_mat_bang = ?;


-- select *
-- from mat_bang
-- where loai_mat_bang = ? and gia_the = ? and so_tang = ?;





