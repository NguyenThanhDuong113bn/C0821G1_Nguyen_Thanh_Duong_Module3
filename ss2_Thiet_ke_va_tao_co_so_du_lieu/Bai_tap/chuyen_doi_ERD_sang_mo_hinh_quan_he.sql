CREATE DATABASE quan_ly_don_hang;

USE quan_ly_don_hang;

CREATE TABLE phieu_xuat (
    so_phieu_xuat INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ngay_xuat DATE
);

CREATE TABLE vat_tu (
    ma_vat_tu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_vat_tu VARCHAR(255) NOT NULL
);

CREATE TABLE chi_tiet_phieu_xuat (
    so_phieu_xuat INT,
    ma_vat_tu INT,
    PRIMARY KEY (so_phieu_xuat , ma_vat_tu),
    don_gia_xuat DOUBLE NOT NULL,
    so_luong_xuat INT NOT NULL,
    FOREIGN KEY (so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_nhap (
    so_phieu_nhap INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_phieu_nhap (
    so_phieu_nhap INT,
    ma_vat_tu INT,
    PRIMARY KEY (so_phieu_nhap , ma_vat_tu),
    don_gia_nhap DOUBLE NOT NULL,
    so_luong_nhap INT NOT NULL,
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_nha_cung_cap VARCHAR(255) NOT NULL,
    dia_chi VARCHAR(255) NOT NULL,
    so_dien_thoai INT NOT NULL
);

CREATE TABLE don_dat_hang (
    so_don_hang INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ngay_don_hang DATE,
    ma_nha_cung_cap INT NOT NULL,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);

CREATE TABLE chi_tiet_don_dat_hang (
    ma_vat_tu INT,
    so_don_hang INT,
    PRIMARY KEY (ma_vat_tu , so_don_hang),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_don_hang)
        REFERENCES don_dat_hang (so_don_hang)
);