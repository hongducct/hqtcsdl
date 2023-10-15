use hqt_test1
GO


CREATE TABLE [dbo].[DM_DacTinhSP](
	[MaDacTinhSP] [varchar](9) NOT NULL,
	[MaLoaiSP] [varchar](6) NOT NULL,
	[ThuTu] [int] NOT NULL,
	[KieuDacTinh] [tinyint] NOT NULL,
	[KieuDuLieu] [tinyint] NOT NULL,
	[DonViDo] [nvarchar](50) NULL,
	[TenDacTinh_TA] [varchar](250) NOT NULL,
	[TenDacTinh_TV] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DM_DacTinhSP] PRIMARY KEY CLUSTERED 
(
	[MaDacTinhSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --------------- */

CREATE TABLE [dbo].[DM_LoaiSP](
	[MaLoaiSP] [varchar](6) NOT NULL,
	[MaNhomSP] [varchar](3) NOT NULL,
	[ThuTu] [int] NOT NULL,
	[TenLoaiSP_TA] [varchar](250) NOT NULL,
	[TenLoaiSP_TV] [nvarchar](250) NOT NULL,
	[CMA] [tinyint] NOT NULL,
	[CTA] [tinyint] NOT NULL,
	[CDA] [tinyint] NOT NULL,
	[CP] [tinyint] NOT NULL,
	[HienThiSL_CP] [bit] NOT NULL,
 CONSTRAINT [PK_DM_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --------------- */
CREATE TABLE [dbo].[DM_NhomSP](
	[MaNhomSP] [varchar](3) NOT NULL,
	[ThuTu] [int] NOT NULL,
	[TenNhomSP_TA] [varchar](150) NOT NULL,
	[TenNhomSP_TV] [nvarchar](150) NOT NULL,
	[KieuNhomSP] [tinyint] NOT NULL,
 CONSTRAINT [PK_DM_NhomSP] PRIMARY KEY CLUSTERED 
(
	[MaNhomSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/* --------------- */


INSERT INTO [dbo].[DM_NhomSP]
           ([MaNhomSP]
           ,[ThuTu]
           ,[TenNhomSP_TA]
           ,[TenNhomSP_TV]
           ,[KieuNhomSP])
     VALUES
           ('NH1', '1', 'Thực Phẩm', 'Food', '1');

INSERT INTO [dbo].[DM_NhomSP]
           ([MaNhomSP]
           ,[ThuTu]
           ,[TenNhomSP_TA]
           ,[TenNhomSP_TV]
           ,[KieuNhomSP])
     VALUES
           ('NH2', '2', 'Điện Tử', 'Electronics', '2');

INSERT INTO [dbo].[DM_NhomSP]
           ([MaNhomSP]
           ,[ThuTu]
           ,[TenNhomSP_TA]
           ,[TenNhomSP_TV]
           ,[KieuNhomSP])
     VALUES
           ('NH3', '3', 'Thời Trang', 'Fashion', '1');


/* ------------------ */

INSERT INTO [dbo].[DM_LoaiSP]
           ([MaLoaiSP]
           ,[MaNhomSP]
           ,[ThuTu]
           ,[TenLoaiSP_TA]
           ,[TenLoaiSP_TV]
           ,[CMA]
           ,[CTA]
           ,[CDA]
           ,[CP]
           ,[HienThiSL_CP])
     VALUES
           ('LSP01', 'NH1', '1', 'Rau Cải', 'Vegetables', '1', '0', '1','1', '1');


INSERT INTO [dbo].[DM_LoaiSP]
           ([MaLoaiSP]
           ,[MaNhomSP]
           ,[ThuTu]
           ,[TenLoaiSP_TA]
           ,[TenLoaiSP_TV]
           ,[CMA]
           ,[CTA]
           ,[CDA]
           ,[CP]
           ,[HienThiSL_CP])
     VALUES
           ('LSP02', 'NH1', '2', 'Trái Cây', 'Fruits','0', '1', '0','1', '0');

INSERT INTO [dbo].[DM_LoaiSP]
           ([MaLoaiSP]
           ,[MaNhomSP]
           ,[ThuTu]
           ,[TenLoaiSP_TA]
           ,[TenLoaiSP_TV]
           ,[CMA]
           ,[CTA]
           ,[CDA]
           ,[CP]
           ,[HienThiSL_CP])
     VALUES
           ('LSP03', 'NH3', '3', 'Điện Thoại', 'Mobile Phones','1', '1', '1', '0', '1');

/* --------------- */

insert into DM_DacTinhSP(MaDacTinhSP, MaLoaiSP, ThuTu, KieuDacTinh, KieuDuLieu, DonViDo, TenDacTinh_TA, TenDacTinh_TV)
	values ('DT001','LSP01','1', '1','2','mm','Đặc Tính 1','Attribute 1');

INSERT INTO [dbo].[DM_DacTinhSP]
           ([MaDacTinhSP]
           ,[MaLoaiSP]
           ,[ThuTu]
           ,[KieuDacTinh]
           ,[KieuDuLieu]
           ,[DonViDo]
           ,[TenDacTinh_TA]
           ,[TenDacTinh_TV])
     VALUES
           ('DT01', 'LSP01', '1', '1', '2', 'g', 'Khối Lượng', 'Weight');

INSERT INTO [dbo].[DM_DacTinhSP]
           ([MaDacTinhSP]
           ,[MaLoaiSP]
           ,[ThuTu]
           ,[KieuDacTinh]
           ,[KieuDuLieu]
           ,[DonViDo]
           ,[TenDacTinh_TA]
           ,[TenDacTinh_TV])
     VALUES
           ('DT02', 'LSP01', '2', '2', '1', '', 'Màu Sắc', 'Color');

INSERT INTO [dbo].[DM_DacTinhSP]
           ([MaDacTinhSP]
           ,[MaLoaiSP]
           ,[ThuTu]
           ,[KieuDacTinh]
           ,[KieuDuLieu]
           ,[DonViDo]
           ,[TenDacTinh_TA]
           ,[TenDacTinh_TV])
     VALUES
           ('DT03', 'LSP02', '1', '2', '2', 'inch', 'Kích Thước', 'Size');

/* --------------- */

select * from DM_LoaiSP;
select * from DM_DacTinhSP;
select * from DM_NhomSP;
/* --------------- */
select * from DM_LoaiSP where MaNhomSP='NH1';
select * from DM_DacTinhSP where MaLoaiSP = 'LSP01';

/* --------------- */

SELECT NhomSP.TenNhomSP_TV AS TenNhomSP, COUNT(LoaiSP.MaLoaiSP) AS SoLuongLoaiSP
FROM DM_NhomSP NhomSP LEFT JOIN DM_LoaiSP LoaiSP ON NhomSP.MaNhomSP = LoaiSP.MaNhomSP
GROUP BY NhomSP.MaNhomSP, NhomSP.TenNhomSP_TV ORDER BY NhomSP.TenNhomSP_TV;
/* 
SELECT NhomSP.TenNhomSP_TV AS TenNhomSP, COUNT(LoaiSP.MaLoaiSP) AS SoLuongLoaiSP
FROM   DM_NhomSP NhomSP LEFT JOIN DM_LoaiSP LoaiSP ON NhomSP.MaNhomSP = LoaiSP.MaNhomSP
GROUP BY NhomSP.TenNhomSP_TV ORDER BY NhomSP.TenNhomSP_TV;
*/

/* --------------- */