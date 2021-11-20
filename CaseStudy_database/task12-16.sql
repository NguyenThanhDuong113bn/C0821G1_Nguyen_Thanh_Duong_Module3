    use casestudy_database;
              
 /* Task 12: Hiển thị thông tin maHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
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
    
   /* Task 15: Hiển thi thông tin của tất cả nhân viên bao gồm maNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
*/
SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.trinh_do,
    bp.ten_bo_phan,
    nv.SDT,
    nv.dia_chi,
    COUNT(hd.ma_hop_dong) AS so_luong_lap_hop_dong
FROM
    nhan_vien nv
        JOIN
    hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
        JOIN
    trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
        JOIN
    bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
WHERE
    YEAR(hd.ngay_lam_hop_dong) BETWEEN 2018 AND 2019
GROUP BY nv.ma_nhan_vien
HAVING COUNT(hd.ma_hop_dong) <= 3;

/* Task 16: Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
*/
SET SQL_SAFE_UPDATES=0;
DELETE FROM nhan_vien 
WHERE
    ma_nhan_vien NOT IN (SELECT 
        ma_nhan_vien
    FROM
        (SELECT 
            nv.ma_nhan_vien
        FROM
            nhan_vien nv
        JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
        
        WHERE
            YEAR(hd.ngay_lam_hop_dong) BETWEEN 2017 AND 2019
        GROUP BY nv.ma_nhan_vien
        HAVING COUNT(hd.ma_hop_dong) > 0) AS t);
SET SQL_SAFE_UPDATES=1;

SELECT * FROM nhan_vien;