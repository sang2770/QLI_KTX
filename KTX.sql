create database QLI_KTX
go
use QLI_KTX
go

GO
--TAO BANG NHA
CREATE TABLE TB_KHU_NHA
(
	MA_NHA NVARCHAR(20) 
			CONSTRAINT PK_KHUNHA_MANHA PRIMARY KEY,
	TEN_NHA NVARCHAR(20) NULL,
);
GO
--TAO BANG PHONG
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
--TAO BANG THIET BI
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
go
--Tạo bảng nhân viên
CREATE TABLE TB_NHANVIEN
(
	MANV			NVARCHAR(20) CONSTRAINT MANV PRIMARY KEY,
	Tennhanvien		NVARCHAR(30) NUll,
	Ngaysinh		DATETIME     NULL,
	Quequan			NVARCHAR(30) NUll,
	Gioitinh		NVARCHAR(20) NUll,
	Sodienthoai		NVARCHAR(11) NUll,
	Luong			MONEY		 NULL,
	Chucvu			NVARCHAR(20) NULL, 
)
--TAO BANG TAI KHOAN
GO
CREATE TABLE TB_TAI_KHOAN
(
	MA_TK NVARCHAR(20) 
		CONSTRAINT PK_TAIKHOAN_NHANVIEN PRIMARY KEY,
	TEN_DANG_NHAP NVARCHAR(50) NULL,
	MAT_KHAU NVARCHAR(50) NULL,
	MANV           NVARCHAR(20) NULL
					CONSTRAINT FK_NHANVIEN_TAIKHOAN
					FOREIGN KEY (MANV)
					REFERENCES TB_NHANVIEN(MANV),
)
go
-- Tạo bảng Khoa
create table TB_KHOA
(
	MaKhoa	nvarchar(20)	CONSTRAINT MAKHOA PRIMARY KEY,
    TenKhoa	nvarchar(30)	not null,
)

go

-- Tạo bảng Lớp
create table TB_LOP
(
	MaLop	nvarchar(20)	CONSTRAINT MALOP PRIMARY KEY,
    TenLop	nvarchar(30)	not null,
	MaKhoa  nvarchar(20)	not null,
	CONSTRAINT FK_ML_MK FOREIGN KEY(MaKhoa)
	REFERENCES TB_KHOA(MaKhoa)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
)

--TAO BẢNG SV
go
create table TB_SINHVIEN
(
	MaSV		nvarchar(20)	CONSTRAINT MASV PRIMARY KEY,
    TenSinhVien	nvarchar(30)	not null,
	SoDienThoai nvarchar(11)    not null,
	NgaySinh    datetime		not null,
	QueQuan		nvarchar(30)	not null,
	GioiTinh	nvarchar(20)	not null,
	MaLop		nvarchar(20)	not null,
	CONSTRAINT FK_SV_ML FOREIGN KEY(MaLop)
	REFERENCES TB_LOP(MaLop)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO
-- Tạo bảng hợp đồng
 create table TB_HOPDONG
(
	MaHopDong	nvarchar(20)	CONSTRAINT MAHOPDONG PRIMARY KEY,
	NgayLap    datetime		not null,
	ThoiHan		int			not null,
	Ma_Phong		nvarchar(20)	not null,
	MANV	nvarchar(20)	not null,
	MaSV		nvarchar(20) not null,
	CONSTRAINT FK_HD_MP FOREIGN KEY(Ma_Phong)
	REFERENCES TB_PHONG(Ma_Phong)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT FK_HD_NV FOREIGN KEY(MANV)
	REFERENCES TB_NHANVIEN(MANV)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT FK_HD_SV FOREIGN KEY(MaSV)
	REFERENCES TB_SINHVIEN(MaSV)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

)


GO
--Tạo bảng trả phòng
CREATE TABLE TB_TRA_PHONG
(	MA_TRAPHONG		NVARCHAR(20) CONSTRAINT MA_TRAPHONG PRIMARY KEY,
	Ngaytraphong	DATETIME	 NULL,
	MASV			NVARCHAR(20) NULL,
		CONSTRAINT FK_TP_SV FOREIGN KEY(MASV)
		REFERENCES TB_SINHVIEN(MASV),
)
GO
--Tạo bảng chi phí
CREATE TABLE TB_CHIPHI
(	MA_CHIPHI		NVARCHAR(20) CONSTRAINT MA_CHIPHI PRIMARY KEY,
	MA_PHONG		NVARCHAR(20) NULL,
		CONSTRAINT FK_CP_MP FOREIGN KEY(MA_PHONG)
		REFERENCES TB_Phong(MA_PHONG)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	Tiendien		INT			 NULL,
	Tiennuoc		INT			 NULL,
	Tienvesinh		INT			 NULL,
	Ngaydong		DATETIME	 NULL,
	Ngayhethan		DATETIME	 NULL,
	MANV			NVARCHAR(20) NULL,
		CONSTRAINT FK_CP_NV FOREIGN KEY(MANV)
		REFERENCES TB_NHANVIEN(MANV)
		ON DELETE CASCADE
		ON UPDATE CASCADE,

)