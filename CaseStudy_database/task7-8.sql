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

/*
Task 9: Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì 
sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
*/
SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS thang,
    SUM(dv.chi_phi_thue + dvdk.gia * dvdk.don_vi) AS doanh_thu,
    COUNT(hd.ma_khach_hang) AS so_luong_khach_hang
FROM
    hop_dong hd
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2019
GROUP BY MONTH(hd.ngay_lam_hop_dong)
ORDER BY MONTH(hd.ngay_lam_hop_dong);


/*
Task 10: Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
Kết quả hiển thị bao gồm maHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
(được tính dựa trên việc count các IDHopDongChiTiet).
*/
SELECT 
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    COUNT(hdct.ma_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hdct.ma_hop_dong
ORDER BY hd.ma_hop_dong;

/* Task 11: Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và 
có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
*/
SELECT 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    dvdk.gia,
    dvdk.don_vi
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE
    lk.ten_loai_khach = 'Diamond'
        AND (kh.dia_chi = 'Vinh'
        OR kh.dia_chi = 'Quảng Ngãi');
        
        
               /*
Task 12: Hiển thị thông tin maHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
(được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 
nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
*/
SELECT 
    hd.ma_hop_dong,
    dv.ma_dich_vu,
    hd.ngay_lam_hop_dong,
    nv.ho_ten,
    kh.ho_ten,
    kh.SDT,
    COUNT(hdct.ma_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
FROM
    dich_vu dv
        JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
        JOIN
    khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        JOIN
    nhan_vien nv ON nv.ma_nhan_vien = hd.ma_nhan_vien
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
WHERE
    dv.ma_dich_vu IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
        WHERE
            (QUARTER(hd.ngay_lam_hop_dong) = 4)
                AND (YEAR(hd.ngay_lam_hop_dong) = 2019))
        AND dv.ma_dich_vu NOT IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
        WHERE
            (QUARTER(hd.ngay_lam_hop_dong) = 1
                OR QUARTER(hd.ngay_lam_hop_dong) = 2)
                AND (YEAR(hd.ngay_lam_hop_dong) = 2019))
GROUP BY hdct.ma_hop_dong
HAVING YEAR(hd.ngay_lam_hop_dong) = 2019;
/*
Task 13: Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
(Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
*/

SELECT 
    hdct.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
FROM
    hop_dong_chi_tiet hdct
        JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
HAVING COUNT(hdct.ma_dich_vu_di_kem) >= ALL (SELECT 
        COUNT(hdct.ma_dich_vu_di_kem)
    FROM
        hop_dong_chi_tiet hdct
    GROUP BY hdct.ma_dich_vu_di_kem);
    
    
        /*
Task 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
Thông tin hiển thị bao gồm maHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
*/
SELECT 
    hd.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    hop_dong hd
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        JOIN
    loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING COUNT(hdct.ma_dich_vu_di_kem) = 1;
    