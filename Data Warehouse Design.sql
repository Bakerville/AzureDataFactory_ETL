create database HCMUE

drop table if exists dbo.dim_MonHoc

drop table if exists dbo.dim_MonHoc

create table dbo.dim_MonHoc
(
    ID INT IDENTITY(1,1) NOT NULL,
    MaHP char(20)  NOT NULL,
    TenHP nvarchar(MAX) NOT NULL,
    TinChi INT,
    LoaiMH nvarchar(50)
)

GO

create table dbo.subdim_NienKhoa
(
    ID INT IDENTITY(1,1),
    NienKhoa nvarchar(50),
    NamHoc INT
)

GO

create table dbo.subdim_Khoa
(
    ID INT IDENTITY(1,1) NOT NULL,
    TenKhoa nvarchar(50)
)

GO

create table dbo.dim_MonHoc
(
    ID INT IDENTITY(1,1) NOT NULL,
    MaHP char(20) NOT NULL,
    TenHP nvarchar(50) NOT NULL,
    TinChi INT,
    LoaiMH nvarchar(50)

)

GO

create table dbo.fact_DiemSo
(
    ID INT IDENTITY(1,1) NOT NULL,
    ID_SinhVien INT,
    ID_HocPhan INT,
    Diem Float,
    DiemChu char(5)
)

drop table if exists dbo.dim_SinhVien
go
create table dbo.dim_SinhVien
(
    ID INT IDENTITY(1,1),
    MaSV char(20) NOT NULL,
    HoTenLot nvarchar(50) NOT NULL,
    Ten nvarchar(50),
    NgaySinh Datetime,
    Tuoi INT,
    TenLop nvarchar(50),
    ID_NienKhoa INT,
    ID_Khoa INT
)

select * from subdim_NienKhoa
insert into subdim_Khoa values(N'Khoa Công nghệ Thông tin')

                                               

select count(*) from dim_SinhVien

select * from dim_SinhVien where MaSV = '40.01.101.001'

select * from dim_MonHoc where trim(TenHP) = N'Đại số tuyến tính 1'
select count(*) from dim_MonHoc

select * from fact_DiemSo


update dim_SinhVien set HoTenLot = UPPER(HoTenLot) 
update dim_SinhVien set Ten = UPPER(Ten)


