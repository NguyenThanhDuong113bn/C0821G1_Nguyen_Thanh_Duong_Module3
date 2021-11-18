use casestudy_database;
/* Task 7: Hiển thị thông tin maDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ 
đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng trong năm 2019.
*/

SELECT DISTINCT
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        JOIN
    hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE
    dv.ma_dich_vu IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2018)
        AND dv.ma_dich_vu NOT IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2019);
            
            
                        /*
Task 8: Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoTenKhachHang không trùng nhau. 
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
*/
-- Cách 1: Sử dụng DISTINCT
SELECT DISTINCT
    ho_ten
FROM
    khach_hang;

-- Cách 2: Sử dụng UNION
SELECT 
    ho_ten
FROM
    khach_hang 
UNION SELECT 
    ho_ten
FROM
    khach_hang;

-- Cách 3: Sử dụng GROUP BY
SELECT 
    ho_ten
FROM
    khach_hang
GROUP BY ho_ten;