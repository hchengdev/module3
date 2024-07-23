create database QuanLyVatTu;
use QuanLyVatTu;

create table PhieuXuat
(
    sopx         int auto_increment primary key,
    ngayXuat     datetime,
    tenKhachHang varchar(255)
);

create table VatTu
(
    idVatTu   int auto_increment primary key,
    tenVatTu  varchar(255),
    donViTinh varchar(255),
    phanTram  int
);

create table ChiTietPhieuXuat
(
    sopx    int,
    idVatTu int,
    soLuong int,
    donGia  int,
    foreign key (sopx) references PhieuXuat (sopx),
    foreign key (idVatTu) references VatTu (idVatTu)
);

create table TonKho
(
    idVatTu         int,
    soLuong         int,
    soLuongDau      double,
    tongSoLuongNhap double,
    tongSoLuongXuat double,
    primary key (idVatTu),
    foreign key (idVatTu) references VatTu (idVatTu)
);

create table NhaCungCap
(
    idNhaCungCap  int auto_increment primary key,
    maNhaCungCap  int,
    tenNhaCungCap varchar(255),
    diaChi        varchar(255),
    soDienThoai   varchar(255)
);

create table DonDatHang
(
    idDonDatHang  int auto_increment primary key,
    maDon         double,
    ngayDat       datetime,
    nhaCungCap_id int,
    foreign key (nhaCungCap_id) references NhaCungCap (idNhaCungCap)
);

create table ChiTietDonDatHang
(
    idChiTietDonDatHang int auto_increment primary key,
    idDonDatHang        int,
    idVatTu             int,
    soLuong             int,
    foreign key (idDonDatHang) references DonDatHang (idDonDatHang),
    foreign key (idVatTu) references VatTu (idVatTu)
);

create table phieuNhap
(
    idPhieuNhap   int auto_increment primary key,
    maPhieuNhap   int,
    ngayNhap      datetime,
    donDatHang_id int,
    foreign key (donDatHang_id) references DonDatHang (idDonDatHang)
);

create table ChiTietPhieuNhap
(
    idChiTietPhieuNhap int auto_increment primary key,
    idPhieuNhap        int,
    idVatTu            int,
    donGia             int,
    ghiChu             varchar(255),
    foreign key (idPhieuNhap) references PhieuNhap (idPhieuNhap),
    foreign key (idVatTu) references VatTu (idVatTu)
);

-- Insert data into VatTu first
INSERT INTO VatTu (tenVatTu, donViTinh, phanTram)
VALUES ('VatTu1', 'kg', 10),
       ('VatTu2', 'kg', 15),
       ('VatTu3', 'kg', 20),
       ('VatTu4', 'kg', 25),
       ('VatTu5', 'kg', 30),
       ('VatTu6', 'lit', 5),
       ('VatTu7', 'lit', 10),
       ('VatTu8', 'lit', 15),
       ('VatTu9', 'lit', 20),
       ('VatTu10', 'lit', 25);

-- Insert data into TonKho
INSERT INTO TonKho (idVatTu, soLuong, soLuongDau, tongSoLuongNhap, tongSoLuongXuat)
VALUES (1, 100, 100, 50, 30),
       (2, 200, 200, 70, 60),
       (3, 300, 300, 90, 80),
       (4, 400, 400, 110, 100),
       (5, 500, 500, 130, 120);

-- Insert data into NhaCungCap
INSERT INTO NhaCungCap (maNhaCungCap, tenNhaCungCap, diaChi, soDienThoai)
VALUES (1, 'NCC1', 'Address1', '123456789'),
       (2, 'NCC2', 'Address2', '987654321'),
       (3, 'NCC3', 'Address3', '456123789');

-- Insert data into DonDatHang
INSERT INTO DonDatHang (maDon, ngayDat, nhaCungCap_id)
VALUES (1, '2024-07-20 10:00:00', 1),
       (2, '2024-07-21 11:00:00', 2),
       (3, '2024-07-22 12:00:00', 3);

-- Insert data into PhieuNhap
INSERT INTO PhieuNhap (maPhieuNhap, ngayNhap, donDatHang_id)
VALUES (1, '2024-07-23 13:00:00', 1),
       (2, '2024-07-24 14:00:00', 2),
       (3, '2024-07-25 15:00:00', 3);

-- Insert data into PhieuXuat
INSERT INTO PhieuXuat (ngayXuat, tenKhachHang)
VALUES ('2024-07-26 16:00:00', 'Customer1'),
       ('2024-07-27 17:00:00', 'Customer2'),
       ('2024-07-28 18:00:00', 'Customer3');

-- Insert data into ChiTietDonDatHang
INSERT INTO ChiTietDonDatHang (idDonDatHang, idVatTu, soLuong)
VALUES (1, 1, 10),
       (1, 2, 20),
       (2, 3, 30),
       (2, 4, 40),
       (3, 5, 50),
       (3, 6, 60);

-- Insert data into ChiTietPhieuNhap
INSERT INTO ChiTietPhieuNhap (idPhieuNhap, idVatTu, donGia, ghiChu)
VALUES (1, 1, 1000, 'Note1'),
       (1, 2, 2000, 'Note2'),
       (2, 3, 3000, 'Note3'),
       (2, 4, 4000, 'Note4'),
       (3, 5, 5000, 'Note5'),
       (3, 6, 6000, 'Note6');

-- Insert data into ChiTietPhieuXuat
INSERT INTO ChiTietPhieuXuat (sopx, idVatTu, soLuong, donGia)
VALUES (1, 1, 5, 100),
       (1, 2, 10, 200),
       (2, 3, 15, 300),
       (2, 4, 20, 400),
       (3, 5, 25, 500),
       (3, 6, 30, 600);

UPDATE VatTu
SET maVatTu = 1
WHERE idVatTu = 1;
UPDATE VatTu
SET maVatTu = 2
WHERE idVatTu = 2;
UPDATE VatTu
SET maVatTu = 3
WHERE idVatTu = 3;
UPDATE VatTu
SET maVatTu = 4
WHERE idVatTu = 4;
UPDATE VatTu
SET maVatTu = 5
WHERE idVatTu = 5;
UPDATE VatTu
SET maVatTu = 6
WHERE idVatTu = 6;
UPDATE VatTu
SET maVatTu = 7
WHERE idVatTu = 7;
UPDATE VatTu
SET maVatTu = 8
WHERE idVatTu = 8;
UPDATE VatTu
SET maVatTu = 9
WHERE idVatTu = 9;
UPDATE VatTu
SET maVatTu = 10
WHERE idVatTu = 10;

CREATE VIEW vw_CTPNHAP AS
SELECT pn.maPhieuNhap, ctpn.idVatTu, ctpn.soLuong, ctpn.donGia, (ctpn.soLuong * ctpn.donGia) AS thanhTien
FROM ChiTietPhieuNhap ctpn
         JOIN PhieuNhap pn ON ctpn.idPhieuNhap = pn.idPhieuNhap;

CREATE VIEW vw_CTPNHAP_VT AS
SELECT pn.maPhieuNhap, ctpn.idVatTu, vt.tenVatTu, ctpn.soLuong, ctpn.donGia, (ctpn.soLuong * ctpn.donGia) AS thanhTien
FROM ChiTietPhieuNhap ctpn
         JOIN PhieuNhap pn ON ctpn.idPhieuNhap = pn.idPhieuNhap
         JOIN VatTu vt ON ctpn.idVatTu = vt.idVatTu;

CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT pn.maPhieuNhap, pn.ngayNhap, ddh.maDon, ctpn.idVatTu, vt.tenVatTu, ctpn.soLuong, ctpn.donGia, (ctpn.soLuong * ctpn.donGia) AS thanhTien
FROM ChiTietPhieuNhap ctpn
         JOIN PhieuNhap pn ON ctpn.idPhieuNhap = pn.idPhieuNhap
         JOIN DonDatHang ddh ON pn.donDatHang_id = ddh.idDonDatHang
         JOIN VatTu vt ON ctpn.idVatTu = vt.idVatTu;

CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
SELECT pn.maPhieuNhap, pn.ngayNhap, ddh.maDon, ncc.maNhaCungCap, ctpn.idVatTu, vt.tenVatTu, ctpn.soLuong, ctpn.donGia, (ctpn.soLuong * ctpn.donGia) AS thanhTien
FROM ChiTietPhieuNhap ctpn
         JOIN PhieuNhap pn ON ctpn.idPhieuNhap = pn.idPhieuNhap
         JOIN DonDatHang ddh ON pn.donDatHang_id = ddh.idDonDatHang
         JOIN NhaCungCap ncc ON ddh.nhaCungCap_id = ncc.idNhaCungCap
         JOIN VatTu vt ON ctpn.idVatTu = vt.idVatTu;

CREATE VIEW vw_CTPNHAP_loc AS
SELECT pn.maPhieuNhap, ctpn.idVatTu, ctpn.soLuong, ctpn.donGia, (ctpn.soLuong * ctpn.donGia) AS thanhTien
FROM ChiTietPhieuNhap ctpn
         JOIN PhieuNhap pn ON ctpn.idPhieuNhap = pn.idPhieuNhap
WHERE ctpn.soLuong > 5;

CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT pn.maPhieuNhap, ctpn.idVatTu, vt.tenVatTu, ctpn.soLuong, ctpn.donGia, (ctpn.soLuong * ctpn.donGia) AS thanhTien
FROM ChiTietPhieuNhap ctpn
         JOIN PhieuNhap pn ON ctpn.idPhieuNhap = pn.idPhieuNhap
         JOIN VatTu vt ON ctpn.idVatTu = vt.idVatTu
WHERE vt.donViTinh = 'Bộ';

CREATE VIEW vw_CTPXUAT AS
SELECT px.sopx, ctx.idVatTu, ctx.soLuong, ctx.donGia, (ctx.soLuong * ctx.donGia) AS thanhTien
FROM ChiTietPhieuXuat ctx
         JOIN PhieuXuat px ON ctx.sopx = px.sopx;

CREATE VIEW vw_CTPXUAT_VT AS
SELECT px.sopx, ctx.idVatTu, vt.tenVatTu, ctx.soLuong, ctx.donGia, (ctx.soLuong * ctx.donGia) AS thanhTien
FROM ChiTietPhieuXuat ctx
         JOIN PhieuXuat px ON ctx.sopx = px.sopx
         JOIN VatTu vt ON ctx.idVatTu = vt.idVatTu;

CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT px.sopx, px.tenKhachHang, ctx.idVatTu, vt.tenVatTu, ctx.soLuong, ctx.donGia, (ctx.soLuong * ctx.donGia) AS thanhTien
FROM ChiTietPhieuXuat ctx
         JOIN PhieuXuat px ON ctx.sopx = px.sopx
         JOIN VatTu vt ON ctx.idVatTu = vt.idVatTu;

CREATE PROCEDURE sp_TongSoLuongCuoi(IN p_maVatTu INT)
BEGIN
SELECT soLuong
FROM TonKho
WHERE idVatTu = p_maVatTu;
END;

CREATE PROCEDURE sp_TongTienXuat(IN p_maVatTu INT)
BEGIN
SELECT SUM(ctx.soLuong * ctx.donGia) AS tongTienXuat
FROM ChiTietPhieuXuat ctx
WHERE ctx.idVatTu = p_maVatTu;
END;

CREATE PROCEDURE sp_TongSoLuongDat(IN p_maDon INT)
BEGIN
SELECT SUM(ctddh.soLuong) AS tongSoLuongDat
FROM ChiTietDonDatHang ctddh
         JOIN DonDatHang ddh ON ctddh.idDonDatHang = ddh.idDonDatHang
WHERE ddh.maDon = p_maDon;
END;

CREATE PROCEDURE sp_ThemDonDatHang(
    IN p_maDon DOUBLE,
    IN p_ngayDat DATETIME,
    IN p_nhaCungCap_id INT
)
BEGIN
INSERT INTO DonDatHang (maDon, ngayDat, nhaCungCap_id)
VALUES (p_maDon, p_ngayDat, p_nhaCungCap_id);
END;

CREATE PROCEDURE sp_ThemChiTietDonDatHang(
    IN p_idDonDatHang INT,
    IN p_idVatTu INT,
    IN p_soLuong INT
)
BEGIN
INSERT INTO ChiTietDonDatHang (idDonDatHang, idVatTu, soLuong)
VALUES (p_idDonDatHang, p_idVatTu, p_soLuong);
END;

CREATE PROCEDURE sp_XoaNhaCungCap(IN p_idNhaCungCap INT)
BEGIN
UPDATE DonDatHang
SET nhaCungCap_id = NULL
WHERE nhaCungCap_id = p_idNhaCungCap;

DELETE FROM NhaCungCap
WHERE idNhaCungCap = p_idNhaCungCap;
END;


