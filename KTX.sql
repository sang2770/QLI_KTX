
--Create 

﻿create database QLI_KTX
use QLI_KTX

-- Tạo bảng Lớp
create table TB_LOP
(
	MaLop	nvarchar(20)	CONSTRAINT MALOP PRIMARY KEY,
    TenLop	nvarchar(30)	not null,
)

-- Tạo bảng Khoa
create table TB_KHOA
(
	MaKhoa	nvarchar(20)	CONSTRAINT MAKHOA PRIMARY KEY,
    TenKhoa	nvarchar(30)	not null,
)

-- Tạo bảng sinh viên
create table TB_SINHVIEN
(
	MaSV		nvarchar(20)	CONSTRAINT MASV PRIMARY KEY,
    TenSinhVien	nvarchar(30)	not null,
	SoDienThoai nvarchar(11)    not null,
	NgaySinh    datetime		not null,
	QueQuan		nvarchar(30)	not null,
	GioiTinh	nvarchar(20)	not null,
	MaKhoa		nvarchar(20)	not null,
	MaLop		nvarchar(20)	not null,
	MaHopDong	nvarchar(20)	not null,
	CONSTRAINT FK_SV_ML FOREIGN KEY(MaLop)
	REFERENCES TB_LOP(MaLop)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT FK_SV_MK FOREIGN KEY(MaKhoa)
	REFERENCES TB_KHOA(MaKhoa)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT FK_SV_HD FOREIGN KEY(MaHopDong)
	REFERENCES TB_HOPDONG(MaHopDong)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
)
-- Tạo bảng Khu nhà
GO
CREATE TABLE TB_KHU_NHA
(
	MA_NHA NVARCHAR(20) 
			CONSTRAINT PK_KHUNHA_MANHA PRIMARY KEY,
	TEN_NHA NVARCHAR(20) NULL,
);
-- Tạo bảng phòng
GO
create table TB_Phong
(
	MA_PHONG Nvarchar(20) 
			 CONSTRAINT PK_PHONG_MAPHONG PRIMARY KEY,
	TEN_PHONG NVARCHAR(20) NULL,
	MA_NHA NVARCHAR(20) NULL
			CONSTRAINT FK_PHONG_MANHA
			FOREIGN KEY (MA_NHA)
			REFERENCES TB_KHU_NHA (MA_NHA),
	LOAI_PHONG NVARCHAR(20) NULL,
	SL_NGUOI_MAX INT NULL,
	SL_DANG_O INT NULL,
	TIEN_PHONG MONEY NULL,

);
-- Tạo bảng thiết bị
GO
CREATE TABLE TB_THIET_BI
(
	MA_TB NVARCHAR(20) 
			CONSTRAINT PK_THIETBI_MATB PRIMARY KEY,
	TEN_TB NVARCHAR(20) NULL,
	MA_PHONG NVARCHAR(20)
			CONSTRAINT FK_THIETBI_MAPHONG
			FOREIGN KEY (MA_PHONG)
			REFERENCES TB_PHONG (MA_PHONG),
	TRANG_THAI NVARCHAR(20),
	
);
-- Tạo bảng hợp đồng
 create table TB_HOPDONG
(
	MaHopDong	nvarchar(20)	CONSTRAINT MAHOPDONG PRIMARY KEY,
	NgayLap    datetime		not null,
	ThoiHan		int			not null,
	MaPhong		nvarchar(20)	not null,
	MaNhanVien	nvarchar(20)	not null,
	CONSTRAINT FK_HD_MP FOREIGN KEY(MaPhong)
	REFERENCES TB_PHONG(MaPhong)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT FK_HD_NV FOREIGN KEY(MaNhanVien)
	REFERENCES TB_NHANVIEN(MaNhanVien)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

)