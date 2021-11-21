    use casestudy_database;
/*
Task 17: Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng 
đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
*/
SET SQL_SAFE_UPDATES = 0;
UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_khach_hang IN (SELECT 
            ma_khach_hang
        FROM
            (SELECT 
                kh.ma_khach_hang
            FROM
                khach_hang kh
            JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
            JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
            JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
            JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
            JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            WHERE
                (lk.ten_loai_khach = 'Platinium')
                    AND (YEAR(hd.ngay_lam_hop_dong) = 2019)
            GROUP BY hd.ma_khach_hang
            HAVING SUM(dv.chi_phi_thue + dvdk.gia * dvdk.don_vi) > 10000000) AS t);
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM khach_hang;


/*
Task 18: Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).
*/
SET SQL_SAFE_UPDATES = 0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        ma_khach_hang
    FROM (
        SELECT 
        kh.ma_khach_hang
    FROM
        khach_hang kh
            JOIN
        hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
    
    WHERE
        YEAR(hd.ngay_lam_hop_dong) < 2016) AS t);
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM khach_hang;

/*
Task 19: Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
*/
SET SQL_SAFE_UPDATES = 0;
UPDATE dich_vu_di_kem
SET 
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem IN (SELECT 
            ma_dich_vu_di_kem
        FROM (
            SELECT 
            dvdk.ma_dich_vu_di_kem
        FROM
            dich_vu_di_kem dvdk
                JOIN
            hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
                JOIN
            hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2019
        GROUP BY dvdk.ma_dich_vu_di_kem
        HAVING COUNT(hdct.ma_dich_vu_di_kem) > 10) AS t);
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM dich_vu_di_kem;

        
/*
Task 20: Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
*/

SELECT 
    ma_nhan_vien AS id,
    ho_ten AS ho_ten,
    email,
   SDT,
    ngay_sinh,
    dia_chi
FROM
    nhan_vien 
UNION ALL SELECT 
    ma_khach_hang AS id,
    ho_ten,
    email,
    SDT,
    ngay_sinh,
    dia_chi
FROM
    khach_hang;