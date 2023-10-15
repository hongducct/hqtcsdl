USE [PhanQuyen]
GO


CREATE TABLE [dbo].[HT_RoleUser](
	[MaRole] [tinyint] NOT NULL,
	[TenDangNhap] [varchar](20) NOT NULL,
 CONSTRAINT [PK_HT_RoleUser] PRIMARY KEY CLUSTERED 
(
	[MaRole] ASC,
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[HT_User](
	[TenDangNhap] [varchar](20) NOT NULL,
	[MaDonVi] [varchar](10) NOT NULL,
	[HangDKV] [char](1) NULL,
	[MaDKV] [varchar](20) NULL,
	[MatKhau] [varchar](150) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](20) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SoCMT] [varchar](15) NULL,
 CONSTRAINT [PK_HT_User] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HT_Role](
	[MaRole] [tinyint] NOT NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[Mota] [nvarchar](500) NULL
 CONSTRAINT [PK_HT_Role] PRIMARY KEY CLUSTERED 
(
	[MaRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* ----------------- */

--tạo user login

use master
go

create login hdct with password = 'hdct'
grant alter any login to hdct
--GRANT BACKUP DATABASE TO hdct;
--GRANT BACKUP LOG TO hdct;

create login hongduc with password = '123'
create user hongduc for login hongduc 
grant alter any login to hongduc
GRANT BACKUP DATABASE TO hongduc;
GRANT BACKUP LOG TO hongduc;
GRANT CREATE ANY DATABASE TO hongduc


--create user SINHVIEN2 cua WINDOWS
create login [DESKTOP-9P0CCC4\A42571] from windows
create user A42571 for login [DESKTOP-9P0CCC4\A42571]


-----------------
use PhanQuyen
create user hongduc for login hongduc 
grant insert, select, update, delete on HT_RoleUser to hongduc
grant insert, select, update, delete on HT_User to hongduc


create user A42571 for login [DESKTOP-9P0CCC4\A42571]
grant select on HT_User to A42571
grant select, insert, update, delete on HT_RoleUser to A42571
grant select, insert, update, delete on HT_Role to A42571


--cau2
use master
go

-- Tạo login UserA và UserB
CREATE LOGIN UserA WITH PASSWORD = '123'
CREATE LOGIN UserB WITH PASSWORD = '123'
drop login UserA
drop login UserB
drop user UserA
drop user UserB
CREATE USER UserA for LOGIN UserA
CREATE USER UserB for LOGIN UserB
-- Cấp quyền cho UserA
GRANT CREATE ANY DATABASE TO UserA
GRANT CREATE TABLE TO UserA
-- Cấp quyền cho UserB
GRANT CREATE TABLE TO UserB
-- UserA cấp quyền cho UserB
use PhanQuyen
GRANT SELECT, INSERT ON dbo.HT_Role TO UserB

REVOKE CREATE TABLE TO UserA
REVOKE CREATE TABLE TO UserB

grant alter any login to hongduc with grant option
GRANT CREATE DATABASE TO UserA;
