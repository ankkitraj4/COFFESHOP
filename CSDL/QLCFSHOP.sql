USE MASTER 
CREATE DATABASE QLCFSHOP 
ON PRIMARY 
(   
NAME = QLCFSHOP_Data,  
FILENAME = 'D:\DESKTOP-2VKHG32\QLCFSHOP_Data.mdf',  
SIZE =10,  
MAXSIZE =20,  
FILEGROWTH =10% 
) 
LOG ON 
(  
NAME = QLBH_Log,  
FILENAME = 'D:\DESKTOP-2VKHG32\QLCFSHOP_Log.ldf',  
SIZE =10,  
MAXSIZE =20,  
FILEGROWTH =10% 
) 
GO 
//
USE QLCFSHOP
GO 
CREATE TABLE nhanvien (  
MaNV VARCHAR(10) PRIMARY KEY NOT NULL,  
HoNV NVARCHAR(30) NOT NULL,
TenNV NVARCHAR(10) NOT NULL,
GioiTinh BIT NOT NULL,
SoCMND  INT NOT NULL,
DiaChi  NVARCHAR(50) NOT NULL,   
DienThoai VARCHAR(15) NOT NULL,  
MaCV  VARCHAR(10) NOT NULL,
LuongCoBan NUMERIC(10,2) NOT NULL
)
//
USE QLCFSHOP
GO 
CREATE TABLE nhacungcap (  
MaNCC VARCHAR(10) PRIMARY KEY NOT NULL,  
TenNCC NVARCHAR(30) NOT NULL,
DiaChi  NVARCHAR(50) NOT NULL,   
DienThoai VARCHAR(15) NOT NULL
)
//
USE QLCFSHOP
GO 
CREATE TABLE khachhang (  
MaKH VARCHAR(10) PRIMARY KEY NOT NULL,  
TenKH NVARCHAR(30) NOT NULL,
DiaChi  NVARCHAR(50) NOT NULL,   
DienThoai VARCHAR(15) NOT NULL
)
//
USE QLCFSHOP
GO 
CREATE TABLE sanpham (  
MaSP VARCHAR(10) PRIMARY KEY NOT NULL,  
TenSP NVARCHAR(30) NOT NULL,
MaNCC  NVARCHAR(50) NOT NULL,   
SoLuong VARCHAR(15) NOT NULL,
DonViTinh NVARCHAR(10) NOT NULL,
GiaSanPham NUMERIC(10,2) NOT NULL,
CONSTRAINT FK_sanpham_MaNCC FOREIGN KEY(MaNCC)   
REFERENCES nhacungcap(MaNCC)   
ON DELETE CASCADE 
) 
//
USE QLCFSHOP
GO 
CREATE TABLE chucvu (  
MaCV VARCHAR(10) PRIMARY KEY NOT NULL,  
TenCV NVARCHAR(30) NOT NULL
)  
//
USE QLCFSHOP
GO 
CREATE TABLE hoadon (  
SoHD INT PRIMARY KEY NOT NULL,  
MaNV VARCHAR(10) NOT NULL,
MaKH  VARCHAR(10) NOT NULL,   
NgayGiaoDich DATE NOT NULL
)
//
USE QLCFSHOP
GO 
CREATE TABLE doanhthu (  
SoHD INT NOT NULL,  
MaSP VARCHAR(10) NOT NULL,
GiaBan  NUMERIC(10,2) NOT NULL,   
SoLuong INT NOT NULL,
ChietKhau NUMERIC(10,2) NOT NULL,
ThanhTien NUMERIC(10,2) NOT NULL,
CONSTRAINT  PK_doanhthu_SoHD_MaSP PRIMARY KEY(SoHD,MaSP),    
CONSTRAINT  FK_doanhthu_SoHD FOREIGN KEY(SoHD)   
REFERENCES hoadon(SoHD)   
ON DELETE CASCADE,  
CONSTRAINT  FK_doanhthu_MaSP FOREIGN KEY(MaSP)   
REFERENCES sanpham(MaSP)   
ON DELETE CASCADE
)      