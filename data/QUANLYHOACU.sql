-- Create a new database called 'QUANLYHOACU'
-- Connect to the 'master' database to run this snippet
DROP DATABASE QUANLYHOACU;
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'QUANLYHOACU'
)
CREATE DATABASE QUANLYHOACU
GO
-- Create a new table called '[SanPham]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[SanPham]', 'U') IS NOT NULL

DROP TABLE [dbo].[SanPham]

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[SanPham]

(

	MaSP varchar(30) primary key,

	TenSP nvarchar(100),

	Gia int,

	ChiTiet nvarchar(200),

	Hinh varchar(1000),

	MaLoaiSP varchar(30),

	DaXoa bit DEFAULT 0 

);

GO

-- Create a new table called '[LoaiSanPham]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[LoaiSanPham]', 'U') IS NOT NULL

DROP TABLE [dbo].[LoaiSanPham]

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[LoaiSanPham]

(

	MaLoaiSP varchar(30) primary key,

	TenLoaiSanPham nvarchar(200),

	DaXoa bit DEFAULT 0

    -- Specify more columns here

);

GO

-- Create a new table called '[HoaDon]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[HoaDon]', 'U') IS NOT NULL

DROP TABLE [dbo].[HoaDon]

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[HoaDon] 

(

    MaHoaDon varchar(30) primary key,

    GhiChu nvarchar(200),

    TongThanhToan int,

    DiaChiGiaoHang nvarchar(200),

    SoDienThoai varchar(13),

    MaKhachHang varchar(30),

    ThoiGianGiaoHang DateTime,

    TrangThaiDonHang bit,

    TrangThaiGiaoHang bit,

    TrangThaiThanhToan bit,

    DaXoa bit DEFAULT 0

    -- Specify more columns here

);

GO



-- Create a new table called '[ChiTietHoaDon]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[ChiTietHoaDon]', 'U') IS NOT NULL

DROP TABLE [dbo].[ChiTietHoaDon]

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[ChiTietHoaDon]

(

    MaHoaDon varchar(30)  not null,

    MaSP varchar(30)  not null,

    SoLuong int,

    TongPhu float --soluong*giasanpham

);

GO





-- Create a new table called '[NguoiDung]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[NguoiDung]', 'U') IS NOT NULL

DROP TABLE [dbo].[NguoiDung]

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[NguoiDung]

(

	MaNguoiDung varchar(30)  primary key,

	TenDangNhap varchar(30) unique,

	MatKhau varchar(100),

	HoTen nvarchar(100),

	NgaySinh date,

	DiaChi nvarchar(100),

	RoleID varchar(10),

	DaXoa bit DEFAULT 0

);

GO



/*
Create the table in the specified schema
*/

-- Drop a table called 'ROLE' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[ROLE]', 'U') IS NOT NULL
DROP TABLE [dbo].[ROLE]
GO
CREATE TABLE [dbo].[ROLE]
(
	RoleID varchar(10) primary key,
	RoleName varchar(100) not null,
);

-- Insert rows into table 'ROLE' in schema '[dbo]'

INSERT INTO [dbo].[ROLE]

( -- Columns to insert data into

 [RoleID], [RoleName]

)

VALUES

( -- First row: values for the columns in the list above

 '000','ADMIN'

),

( -- Second row: values for the columns in the list above

 '001','USER'

)

-- Add more rows here

GO

alter table [dbo].[SanPham]
add CONSTRAINT FK_SanPhamVaLoaiSanPham
    FOREIGN key (MaLoaiSP)
    REFERENCES [dbo].[LoaiSanPham](MaLoaiSP)
ON UPDATE CASCADE
ON DELETE CASCADE

alter table [dbo].[ChiTietHoaDon]
ADD PRIMARY KEY (MaHoaDon, MaSP);

ALTER table [dbo].[ChiTietHoaDon]
add CONSTRAINT FK_MaSP
FOREIGN key (MaSP)
REFERENCES [dbo].[SanPham](MaSP)

alter table [dbo].[ChiTietHoaDon]
add constraint FK_MaHoaDon
foreign key (MaHoaDon) 
REFERENCES [dbo].[HoaDon](MaHoaDon)

alter table [dbo].[NguoiDung]
add constraint FK_UserAndRole
foreign key (RoleID) 
REFERENCES [dbo].[ROLE](RoleID)

alter table [dbo].[HoaDon]
	add constraint FK_UserAndOrder
	foreign key (MaKhachHang) 
	REFERENCES [dbo].[NguoiDung](MaNguoiDung)

go
CREATE TRIGGER newHoaDon_NewUser ON NguoiDung

FOR INSERT

AS BEGIN

	DECLARE @userID varchar(30)

	SET @userID = (select inserted.MaNguoiDung from inserted)

	insert into HoaDon values (CONCAT('cart_',@userID),'',0,'','',@userID,'',0,0,0,0);

end




-- Insert rows into table 'ROLE' in schema '[dbo]'

INSERT INTO [dbo].[ROLE]

( -- Columns to insert data into

 [RoleID], [RoleName]

)

VALUES

( -- First row: values for the columns in the list above

 '000','ADMIN'

),

( -- Second row: values for the columns in the list above

 '001','USER'

)

-- Add more rows here

GO


-- Add more rows here

INSERT INTO [dbo].[NguoiDung]

( -- Columns to insert data into

 [MaNguoiDung], [TenDangNhap], [MatKhau],[RoleID]

)

VALUES

( -- First row: values for the columns in the list above

 'admin','nimda','ngocphat','000'

)



-- Add more rows here

GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER01','iamNgocPhat','123',N'Nguyễn Ngọc Phát','2002-07-12',N'Quận 2','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER02','quynhhuong2','123',N'Nguyễn Ngọc o','2002-07-12',N'Quận 2','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER03','bichlien3','123',N'Nguyễn Văn u','2002-07-12',N'Thủ Đức','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER04','ngocphat4','123',N'Nguyễn Ngọc z','2002-07-12',N'Quận 2','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER05','quynhhuong5','123',N'Nguyễn Văn r','2002-07-12',N'Bình Chánh','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER06','quynhhuong6','123',N'Nguyễn Văn k','2002-07-12',N'Quận 1','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER07','quynhhuong7','123',N'Nguyễn Thị o','2002-07-12',N'Bình Chánh','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER08','quynhhuong8','123',N'Nguyễn Ngọc o','2002-07-12',N'Quận 2','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER09','aido9','123',N'Nguyễn Ngọc o','2002-07-12',N'Quận 2','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER010','quynhhuong10','123',N'Nguyễn Ngọc c','2002-07-12',N'Thủ Đức','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER011','quynhhuong11','123',N'Nguyễn Ngọc i','2002-07-12',N'Thủ Đức','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER012','aido12','123',N'Nguyễn Thị w','2002-07-12',N'Quận 1','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER013','ngocphat13','123',N'Nguyễn Ngọc s','2002-07-12',N'Bình Chánh','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER014','ngocphat14','123',N'Nguyễn Ngọc q','2002-07-12',N'Quận 1','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER015','ngocphat15','123',N'Nguyễn Thị x','2002-07-12',N'Quận 9','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER016','aido16','123',N'Nguyễn Ngọc i','2002-07-12',N'Thủ Đức','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER017','aido17','123',N'Nguyễn Văn m','2002-07-12',N'Thủ Đức','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER018','aido18','123',N'Nguyễn Văn o','2002-07-12',N'Quận 1','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER019','quynhhuong19','123',N'Nguyễn Văn p','2002-07-12',N'Quận 2','001')

 GO

INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiaChi ,RoleID) VALUES ('USER020','bichlien20','123',N'Nguyễn Thị k','2002-07-12',N'Thủ Đức','001')

 GO



-- Insert rows into table 'LoaiSanPham' in schema '[dbo]'




-- Insert rows into table 'LoaiSanPham' in schema '[dbo]'

INSERT INTO [dbo].[LoaiSanPham]

( -- Columns to insert data into

 [MaLoaiSP], [TenLoaiSanPham]

)

VALUES

(

    'lsp00',N'Tất cả'

)

,

( -- First row: values for the columns in the list above

    'lsp01',N'Màu vẽ'

),

( -- Second row: values for the columns in the list above

    'lsp02',N'Giấy vẽ'

),

(

    'lsp03',N'Bút vẽ'

),

(

    'lsp04',N'Phác thảo'

),

(

    'lsp05',N'Văn phòng phẩm'

)

,

(

    'lsp06',N'Dụng cụ hỗ trợ'

)

-- Add





DELETE SanPham;

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP0000',N'Sổ Canson XL Dessin 160gsm 40 tờ',230000,'','https://bucket.nhanh.vn/store/15668/ps/20210303/311202151159_so_canson_xl_dession_160gsm_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP0001',N'Sổ Canson XL Dessin Noir 150gsm 40 tờ A4',225000,'','https://bucket.nhanh.vn/store/15668/ps/20210905/Canson_XL_dessin_noir.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP0002',N'Sổ Canson XL Kraft 90gsm 60 tờ',195000,'','https://bucket.nhanh.vn/store/15668/ps/20210612/12062021090653_So_Canson_XL_Kraft_90gsm_60_to__so_canson_xl_4_.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP0003',N'Sổ giấy đen Black Pad Potentate',40000,'','https://bucket.nhanh.vn/store/15668/ps/20210324/24132021111312_So_giay_den_Black_Pad_Potentate__so_blackpad_a4_4_.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP0004',N'Sổ Kraft Potentate 100gsm 120 tờ',60000,'','https://bucket.nhanh.vn/store/15668/ps/20211125/potentate_kraft.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP0005',N'Sổ Sketchbook Arto Campap Black 140gsm A4 - 80 tờ',80000,'','','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP0006',N'Sổ Sketchbook Potentate màu Kraft 120gsm A4',130000,'','https://bucket.nhanh.vn/store/15668/ps/20210614/So_Sketchbook__Potentate__Kraft_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP0007',N'Sổ Travel Book 300gsm A5 - 20 tờ',155000,'','https://bucket.nhanh.vn/store/15668/ps/20210324/24092021100919_so_travel_book_a5_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP0008',N'Sổ vẽ Acrylic Arto 12 tờ 360gsm khổ B4',120000,'','https://bucket.nhanh.vn/store/15668/ps/20210512/1244202134454_Giay_ve_arto_2.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP0009',N'Sổ vẽ Canson Barbizon 240gsm 20 tờ khổ A4',130000,'','https://bucket.nhanh.vn/store/15668/ps/20210118/18542021125452_so_canson_barbizon_ve_mau_nuoc.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00010',N'Sổ vẽ Canson Montval - 300gsm',130000,'','https://bucket.nhanh.vn/store/15668/ps/20210129/2939202133928_so_ve_mau_nuoc_canson_montval.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00011',N'Sổ vẽ Canson XL Aquarelle - 300gsm 30 tờ',290000,'','https://bucket.nhanh.vn/store/15668/ps/20210905/So_____Canson_XL_Aquarelle_3.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00012',N'Sổ vẽ Canson XL Bristol - 180gsm 50 tờ A4',210000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/bristol_thumb.jpeg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00013',N'Sổ vẽ Canson XL Mix Media - 300gsm 25 tờ',200000,'','https://bucket.nhanh.vn/store/15668/ps/20211101/Screenshot_3.png','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00014',N'Sổ vẽ màu nước Canson Barbizon',68000,'','https://bucket.nhanh.vn/store/15668/ps/20210630/so_canson_barbizon_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00015',N'Sổ vẽ Nabii Limited 300gsm A5 - 21 tờ',81000,'','https://bucket.nhanh.vn/store/15668/ps/20210318/18032021100331_18102021111043_Nabii_limited_2__1_.png','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00016',N'Sổ vẽ Sketch Basic Gáy Còng 160gsm khổ A5',135000,'','https://bucket.nhanh.vn/store/15668/ps/20210319/1931202133146_so_sketch_2.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00017',N'Sổ vẽ Sketch book Cretacolor 180 gsm',95000,'','https://bucket.nhanh.vn/store/15668/ps/20210319/1908202130843_so_sketbook_cretacolor_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00018',N'Sổ vẽ Skethbook Potentate 100gsm 120 tờ gáy khâu',45000,'','https://bucket.nhanh.vn/store/15668/ps/20211125/sketchbook_potentate.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00019',N'Sổ vẽ Skethbook Potentate 140gsm 60 tờ gáy lò xo',38000,'','https://bucket.nhanh.vn/store/15668/ps/20211125/potentate_gay_xoan_6.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00020',N'Tệp giấy vẽ chì Potentate - 180gsm 20 tờ',20000,'','https://bucket.nhanh.vn/store/15668/ps/20210128/28082021110811_giay_ve_chi_potentate.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00021',N'Tệp giấy vẽ màu nước organ-style Dorerart - 300gsm',172000,'','https://bucket.nhanh.vn/store/15668/ps/20210905/Tep_giay_ve_mau_nuoc_organ_style_Dorerart___300gsm__tap_doreart_4_.jpeg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00022',N'Sổ vẽ , túi tote, túi vải Lobeo x Yionyi Limited Edition',70000,'','https://bucket.nhanh.vn/store/15668/ps/20221209/yionyi2.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00023',N'Bộ 6 bút chì Staedtler Carbone Graphite MARS LUMOGRAPH',150000,'','https://bucket.nhanh.vn/store/15668/ps/20210417/17232021102344_bo_6_but_chi_staedtler_1.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00024',N'Bộ chì đủ sắc độ Hernidex',240000,'','https://bucket.nhanh.vn/store/15668/ps/20210904/04092021050902_but__chi_hernidex.jpeg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00025',N'Bút chì Art Design',45000,'','https://bucket.nhanh.vn/store/15668/ps/20210904/lyra_art_design_1.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00026',N'Bút chì bấm Mono Graph 0.5mm Pastel',75000,'','https://bucket.nhanh.vn/store/15668/ps/20210520/2047202134718_but_chi_bam_mono_2.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00027',N'Bút chì gỗ Koh-I-Nor 1500',10000,'','https://bucket.nhanh.vn/store/15668/ps/20210820/but_chi_koh.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00028',N'Bút chì gỗ UNI 9800',30000,'','https://bucket.nhanh.vn/store/15668/ps/20210603/but_chi_uni_misubishi_1.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00029',N'Bút chì kim màu UNI NANO DIA - có thể tẩy',35000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/chi uni ngoi 2_thumb.jpeg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00030',N'Bút chì kim ngòi dẹt Marvy 2.0 mm FL200',40000,'','https://bucket.nhanh.vn/store/15668/ps/20210512/12242021112446_but_chi_kim_ngoi_det_2.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00031',N'Bút tẩy Kokuyo Nhật Bản tông Pastel',58000,'','https://bucket.nhanh.vn/store/15668/ps/20210506/659202195923_But_tay_Kokuyo_Nhat_Ban_tong_Pastel__but_tay_kokuyo_1_.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00032',N'Bút tẩy Staedtler',40000,'','https://bucket.nhanh.vn/store/15668/ps/20210825/25082021090849_but_tay_1.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00033',N'Gôm Tẩy Bút Chì Pentel Ain Black - Màu đen',10000,'','https://bucket.nhanh.vn/store/15668/ps/20210820/20082021110816_Pentel_Ain_Black.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00034',N'Gọt bút chì Faber Castell SLEEVE Mini Spitzer',31000,'','https://bucket.nhanh.vn/store/15668/ps/20210420/20042021110408_Chuot_chi_Faber_Castell_SLEEVE_Mini_Spitzer__chuot_chi_faber_castell_4_.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00035',N'Gọt bút chì quay Tenwin',162000,'','https://bucket.nhanh.vn/store/15668/ps/20210408/824202132420_got_chi_quay_tenwin_1_DSC1508jpg.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00036',N'Gọt bút chì sắt Lyra',25000,'','https://bucket.nhanh.vn/store/15668/ps/20210603/got_chi_lyra_2.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00037',N'Ngòi Bút Tẩy Mono Zero',30000,'','https://bucket.nhanh.vn/store/15668/ps/20210520/2002202150237_but_tay_mono_3.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00038',N'Ruột chì bấm Faber Castell Eco 2B 0.5mm x 60mm',20000,'','https://bucket.nhanh.vn/store/15668/ps/20210821/21082021050853_Faber_Castell_Eco_2B.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00039',N'Ruột chì Marvy 2.0mm 2B FL200 đen ngòi dẹt',15000,'','https://bucket.nhanh.vn/store/15668/ps/20210512/12272021112704_ngoi_chi_det_1.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00040',N'Ruột chì UNI 2B 0.5mm',25000,'','https://bucket.nhanh.vn/store/15668/ps/20210814/ruot_chi_uni.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00041',N'Set dụng cụ vẽ truyền thần mini',35000,'','https://bucket.nhanh.vn/store/15668/ps/20210319/19192021101956_Set_truyen_than_mini.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00042',N'Set Truyền Thần Marco',230000,'','https://bucket.nhanh.vn/store/15668/ps/20210317/set_truyen_than_marco_2.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00043',N'Tẩy dạng bút có chổi quét 52661 Staedtler',35000,'','https://bucket.nhanh.vn/store/15668/ps/20220119/but_tay_5.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00044',N'Tẩy đất sét Artooo',19000,'','https://bucket.nhanh.vn/store/15668/ps/20210311/1104202140430_tay_dat_set_artoo_1_up.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00045',N'Tẩy đất sét Kuelox hộp nhựa',15000,'','https://bucket.nhanh.vn/store/15668/ps/20220120/tay_dat_set_kuelox.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00046',N'Tẩy đất sét Lyra Kneadable Easer',45000,'','https://bucket.nhanh.vn/store/15668/ps/20210107/740202134039_tay_dat_set_lyra.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00047',N'Tẩy Dust Free Faber Castell Tẩy đen',10000,'','https://bucket.nhanh.vn/store/15668/ps/20211122/22112021081135_dust_free.jpeg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00048',N'Tẩy STAEDTLER  EXAM 526 E30 Size M Màu Đen',8000,'','https://bucket.nhanh.vn/store/15668/ps/20210820/20082021110857_STAEDTLER__EXAM_526.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00049',N'Tẩy STAEDTLER EXAM Màu Đen 526 E40',6000,'','https://bucket.nhanh.vn/store/15668/ps/20220119/19012022060113_Ta____y_STAEDTLER_EXAM_Ma__u_Den_526_E20.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00050',N'Tẩy STAEDTLER Rasoplast màu đen 526 B40-9',10000,'','https://bucket.nhanh.vn/store/15668/ps/20220119/Ta____y_STAEDTLER_Rasoplast_ma__u_den_526_B40_9_size_S.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00051',N'Thanh than chì Marie’s - 25 cây',40000,'','https://bucket.nhanh.vn/store/15668/ps/20210107/710202151031_Than_than_chi_marie_2.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00052',N'Thước kẻ chữ nhật ô vuông 20cm',45000,'','https://bucket.nhanh.vn/store/15668/ps/20201103/Ảnh chụp Màn hình 2020-11-03 lúc 13.03.50_thumb.png','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00053',N'Thước kẻ tròn',30000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/thuoc tron_thumb.png','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00054',N'Tệp giấy trang trí in hình hoạ tiết vintage 60 tờ',20000,'','https://bucket.nhanh.vn/store/15668/ps/20211025/giay_trang_tri_1.jpeg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00055',N'Túi đeo chéo bản to màu đen',80000,'','https://bucket.nhanh.vn/store/15668/ps/20211124/tui_cheo_ban_to_4.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00056',N'Túi đeo chéo mini 17x20cm - Tặng huy hiệu , không kèm gấu bông',70000,'','https://bucket.nhanh.vn/store/15668/ps/20211124/tui_deo_cheo_mini.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00057',N'Túi đựng dụng cụ vẽ vải dù 47x65cm màu xám',280000,'','https://bucket.nhanh.vn/store/15668/ps/20220228/tui_dung_dung_cu_ve_2.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00058',N'Washi Tape chủ đề hoa quả',15000,'','https://bucket.nhanh.vn/store/15668/ps/20200707/washi hoa qua.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00059',N'Washi Tape hoa văn trang trí bản to',Liên hệ,'','https://bucket.nhanh.vn/store/15668/ps/20211007/07102021051058_hoa_va__n_2.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00060',N'Washi Tape kim tuyến',40000,'','https://bucket.nhanh.vn/store/15668/ps/20200707/washi dong gia_thumb.png','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00061',N'Washi Tape Magic Ocean',90000,'','https://bucket.nhanh.vn/store/15668/ps/20210824/24082021100803_magic_ocean.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00062',N'Sổ vẽ màu nước Nabii Aqua Fat - 300gsm 25 tờ',90000,'','https://bucket.nhanh.vn/store/15668/ps/20210630/so_ve_nabii_aqua_fat_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00063',N'Giấy vẽ màu nước Nabii Aqua Fat 300gsm - tệp 16 tờ',30000,'','https://bucket.nhanh.vn/store/15668/ps/20210129/2948202124820_giay_tep_nabii_aqua_fat_2.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00064',N'Sổ Sketchbook Nabii Ima - 160gsm 32 tờ',75000,'','https://bucket.nhanh.vn/store/15668/ps/20210630/so_sketchbook_ima_2.gif','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00065',N'Giấy vẽ màu nước Nabii Aqua Fat 300gsm - Newbie Set',15000,'','https://bucket.nhanh.vn/store/15668/ps/20210416/Giay_nabii_aqua_fat_newbie_set_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00066',N'Sổ vẽ Lobeo Idea Sketchbook 50 tờ 200gsm',35000,'','https://bucket.nhanh.vn/store/15668/ps/20221022/22102022111050_Idea_Sketchbook_.jpeg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00067',N'Sổ vẽ màu dạ Marker Pad Nabii - 250gsm 20 tờ',30000,'','https://bucket.nhanh.vn/store/15668/ps/20210107/745202154534_so_nabii_marker_pad_5.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00068',N'Sổ Nabii Marker Trial Pad gáy xoắn 250gsm - A6 (10.5x14.5cm) - 20 tờ',30000,'','https://bucket.nhanh.vn/store/15668/ps/20220120/trial_pad.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00069',N'Giấy màu nước 100% cotton LEYTON 300 gsm túi 10 tờ',36000,'','https://bucket.nhanh.vn/store/15668/ps/20220106/leyton_le.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00070',N'Bảng vải Holic Canvas',35000,'','https://bucket.nhanh.vn/store/15668/ps/20210227/2758202195823_toan_holic_du_SIZE.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00071',N'Sổ vẽ màu nước Lobeo Dream Sketchbook 25 tờ 300gsm',55000,'','https://bucket.nhanh.vn/store/15668/ps/20220715/lobeo_dream_watercolor_sketchbook_10.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00072',N'Sổ Sketchbook Unic 160gsm 40 trang 8.5x21cm',35000,'','https://bucket.nhanh.vn/store/15668/ps/20221116/so_chu_nhat_2.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00073',N'Sổ vẽ Lobeo Cream Sketchbook limited edition 160gsm 40 trang - Lobeo x Anne Cheng 21x21cm',80000,'','https://bucket.nhanh.vn/store/15668/ps/20221123/anne_cheng_sketchbook_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00074',N'Sổ vẽ Potentate Bristol - 240gsm 36 tờ',77000,'','https://bucket.nhanh.vn/store/15668/ps/20200708/potentate_bristol_thumb.jpeg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00075',N'Giấy vẽ màu nước Saunders Waterford lẻ 300gsm',42000,'','https://bucket.nhanh.vn/store/15668/ps/20210812/saunder_waterford_coldpress.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00076',N'Sổ Leyton 300gsm 20 tờ',75000,'','https://bucket.nhanh.vn/store/15668/ps/20210905/giay_ve_layton.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00077',N'Sổ vẽ CANVAS Faber Castell 280 Gsm 12 tờ A4',125000,'','https://bucket.nhanh.vn/store/15668/ps/20210408/834202143438_so_canvas_fabercastell_2.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00078',N'Giấy vẽ màu nước Canson Montval Pháp 300gsm - 3 tờ',30000,'','https://bucket.nhanh.vn/store/15668/ps/20210603/giay_canson_montval_le_6.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00079',N'Sổ vẽ Travel Book - 300gsm khổ A6 20 tờ',115000,'','https://bucket.nhanh.vn/store/15668/ps/20210303/333202153328_So_travel_book_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00080',N'Sổ vẽ Canson XL Marker - 70gsm 50 tờ',160000,'','https://bucket.nhanh.vn/store/15668/ps/20220120/Canson_XL_marker_3.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00081',N'Sổ vẽ Faber Castell - 200gsm 20 tờ A4',60000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/so-faber_thumb.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00082',N'Giấy vẽ màu nước Baohong 100% cotton 20 tờ',85000,'','https://bucket.nhanh.vn/store/15668/ps/20210413/1356202195636_giay_ve_baohong_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00083',N'Giấy vẽ truyện tranh Holbein Maxon',68000,'','https://bucket.nhanh.vn/store/15668/ps/20220517/giay_ve_truyen_maxon_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00084',N'Sổ vẽ Maruman Sketchbook',60000,'','https://bucket.nhanh.vn/store/15668/ps/20210108/835202193530_so_sketch_book_maruman.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00085',N'Sổ vẽ màu Oil Pastel Kuelox 240gsm 20 tờ A4',90000,'','https://bucket.nhanh.vn/store/15668/ps/20210108/804202190441_so_ve_kuelox_oil_pastel.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00086',N'Bút chì cơ khí Graphgear Pentel 500',98000,'','https://bucket.nhanh.vn/store/15668/ps/20210310/1004202130436_but_chi_graphgear_pentel.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00087',N'Ngòi chì kim màu UNI NANO DIA 0.5 - có thể tẩy',55000,'','https://bucket.nhanh.vn/store/15668/ps/20210902/02092021120902_ngoi_chi_mau_uni_nano_3.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00088',N'Tẩy tam giác Marie’s Màu bất kỳ',10000,'','https://bucket.nhanh.vn/store/15668/ps/20210108/8232021102303_tay_tam_giac_marie.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00089',N'Tẩy Mono Đen - Thường',15000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/mn den_thumb.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00090',N'Ruột chì kim kỹ thuật STAEDTLER 254 màu xanh biển - 0.5mm',55000,'','https://bucket.nhanh.vn/store/15668/ps/20220705/ruot_mau.png','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00091',N'Bút chì kim Econ Faber Castell 0.5mm',30000,'','https://bucket.nhanh.vn/store/15668/ps/20210904/but_chi_econ_faber_castell.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00092',N'Tẩy Mono Air Touch',25000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/mono air touch_thumb.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00093',N'Bút chì Than Marie Charcoal - Thân chì đen đậm',50000,'','https://bucket.nhanh.vn/store/15668/ps/20210622/but_chi_than_marie_charcoal_1.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00094',N'Ruột chì AinStein Pentel',20000,'','https://bucket.nhanh.vn/store/15668/ps/20210807/ruot_chi_pentel.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00095',N'Bút chì Staedtler Mars Lumograph',19000,'','https://bucket.nhanh.vn/store/15668/ps/20210905/But_chi_Staedtler_Mars_Lumograph.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00096',N'Tẩy Mono Dust Catch Màu đen',25000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/mn dust_thumb.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00097',N'Bộ 3 cây di chì Borrence',12000,'','https://bucket.nhanh.vn/store/15668/ps/20220726/di_chi_2.png','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00098',N'Tẩy đất sét Faber Castell',35000,'','https://bucket.nhanh.vn/store/15668/ps/20221003/812202131259_tay_dat_set_fabercastel_1.jpeg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP00099',N'Tẩy Staedtler Luna màu đỏ 525L30-20',10000,'','https://bucket.nhanh.vn/store/15668/ps/20210825/25082021040815_staedtler_luna.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000100',N'Kẹp mài chì cao cấp Tenwin',49000,'','https://bucket.nhanh.vn/store/15668/ps/20220508/Ke__p_ma__i_chi___cao_ca____p_Tenwin.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000101',N'Bộ 7 cây di chì Mont Marte',45000,'','https://bucket.nhanh.vn/store/15668/ps/20220505/di_chi_mont_marte_3.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000102',N'Bộ than chì Mont Marte Willow 10pc',70000,'','https://bucket.nhanh.vn/store/15668/ps/20221027/bo_10c_than_chi_MM.png','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000103',N'Bút Tẩy Mono Zero',75000,'','https://bucket.nhanh.vn/store/15668/ps/20210520/2008202150855_but_tay_mono_2.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000104',N'Ruột chì kim kỹ thuật STAEDTLER 250',30000,'','https://bucket.nhanh.vn/store/15668/ps/20210905/ruot_chi_kim_staedtler.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000105',N'Bộ 12 cây chì than Mont Marte Charcoal Pencils',85000,'','https://bucket.nhanh.vn/store/15668/ps/20220508/Mont_Marte_Charcoal_Pencils_1.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000106',N'Ngòi chì kim Faber Castell 0.5mm',15000,'','https://bucket.nhanh.vn/store/15668/ps/20210902/Faber_Castell_1265_0_5mm_2B_HB_Pencil_Refill_10Boxes_Set_Faber_Castell_Mechanical_Pencil_Lead_jpg_q50.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000107',N'Bộ 2 bút chì trắng Mont Marte',52000,'','https://bucket.nhanh.vn/store/15668/ps/20220505/_Bo_____2_bu__t_chi___tra____ng_Mont_Marte_1.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000108',N'Bộ 3 cây bút than chì kèm dụng cụ di chì Staedtler',90000,'','https://bucket.nhanh.vn/store/15668/ps/20201203/chi_staedler_thumb.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000109',N'Bộ 3 cây di chì Marie',12000,'','https://bucket.nhanh.vn/store/15668/ps/20210513/13332021103354_Bo_3_cay_di_chi_Marie___s__bo_di_chi_marie_5_.jpg','lsp04')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000110',N'Hình dán San X sticker dễ thương',15000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/san X_thumb.png','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000111',N'Sổ lưu trữ Washi, Sticker',55000,'','https://bucket.nhanh.vn/store/15668/ps/20220505/so_luu_tru_washi.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000112',N'Bộ con dấu bằng gỗ vintage',95000,'','https://bucket.nhanh.vn/store/15668/ps/20210426/26042021040429_bo_36_con_dau_go_3.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000113',N'Hình dán San Sticker 50 miếng',15000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/san 50_thumb.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000114',N'Sticker hình dán Dehop 45 miếng tông vàng xanh',25000,'','https://bucket.nhanh.vn/store/15668/ps/20211007/Sticker_hi__nh_da__n_Dehop_45_mie____ng_to__ng_va__ng_xanh_.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000115',N'Hình dán trang trí hoa basic',23000,'','https://bucket.nhanh.vn/store/15668/ps/20201207/a__nh_chu__p_ma__n_hi__nh_2020_12_07_lu__c_14_06_42_copy_thumb.png','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000116',N'Sticker hình dán Drehop Vintage 40 miếng',25000,'','https://bucket.nhanh.vn/store/15668/ps/20211007/Sticker_hi__nh_da__n_Drehop_Vintage_40_mie____ng.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000117',N'Washi tape dạng giấy nhớ 80 tờ',30000,'','https://bucket.nhanh.vn/store/15668/ps/20211012/12102021061017_washi_giay_nho.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000118',N'Sổ ô vuông Calligraphy Workbook Mont Marte 70gsm 50 tờ 22x30cm',70000,'','https://bucket.nhanh.vn/store/15668/ps/20220508/_Mont_Marte_workbook.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000119',N'Giấy nhớ tay mèo dễ thương 30 tờ',12000,'','https://bucket.nhanh.vn/store/15668/ps/20211015/giay_nho_tay_meo_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000120',N'Hình dán ảnh in Drehop theo tông màu 55 miếng',25000,'','https://bucket.nhanh.vn/store/15668/ps/20211022/hinh_in_drehop_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000121',N'Hình dán Box Sticker Vintage - 40 miếng',23000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/vintage box_thumb.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000122',N'Sticker DECO trang trí Cổ Điển',25000,'','https://bucket.nhanh.vn/store/15668/ps/20200821/co dien_thumb.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000123',N'Sticker trong suốt hình khối theo tông màu 30 miếng',20000,'','https://bucket.nhanh.vn/store/15668/ps/20211012/trong_suot_5.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000124',N'Washi Tape Infeel Me Basic',20000,'','https://bucket.nhanh.vn/store/15668/ps/20211007/Washi_Tape_Infeel_Me_Basic_3.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000125',N'Sticker typo vintage 20 tấm - 320 hình',30000,'','https://bucket.nhanh.vn/store/15668/ps/20211025/Typo_3.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000126',N'Giấy nhớ trang trí chủ đề Trái cây',15000,'','https://bucket.nhanh.vn/store/15668/ps/20210628/28062021020652_Giay_nho_memo_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000127',N'Album đựng tranh, ảnh vintage 10x15cm 50 tờ',50000,'','https://bucket.nhanh.vn/store/15668/ps/20211124/album_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000128',N'Bộ Washi Senmu - 10 tấm hình dán, 10 cuộn washi',65000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/mẫu chung_thumb.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000129',N'Combo 10 cuộn Washi Sweet Dream Tông Pastel',40000,'','https://bucket.nhanh.vn/store/15668/ps/20210507/07052021110507_combo_10_washi_tong_pastel.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000130',N'Giấy báo trang trí Drehop 26 tờ',35000,'','https://bucket.nhanh.vn/store/15668/ps/20211022/giay_bao_3.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000131',N'Giấy báo trang trí loft book 60 tờ',35000,'','https://bucket.nhanh.vn/store/15668/ps/20211025/loft_book_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000132',N'Giấy nhớ trang trí chủ đề Swatch Màu Nước',15000,'','https://bucket.nhanh.vn/store/15668/ps/20210813/giay_nho_mau_nuoc.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000133',N'Giấy trang trí tem thư vintage Mo Card 20 tờ',25000,'','https://bucket.nhanh.vn/store/15668/ps/20211007/tem_thu__.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000134',N'Bảng vải canvas mini - kèm giá đỡ',25000,'','https://bucket.nhanh.vn/store/15668/ps/20210520/2040202144024_bang_vai_canvas_mini_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000135',N'Sổ Travel Book 300gsm 20 tờ bìa vintage',165000,'','https://bucket.nhanh.vn/store/15668/ps/20220517/so_bia_vintage_A5_m4.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000136',N'Sổ vẽ Mont Marte Sketching Journal 150gsm 50 tờ',70000,'','https://bucket.nhanh.vn/store/15668/ps/20220507/So_den_mont_marte_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000137',N'Sổ vẽ màu nước bìa da LEYTON 300gsm 24 tờ',173000,'','https://bucket.nhanh.vn/store/15668/ps/20221022/leyton_bia_da_7.jpeg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000138',N'Bảng vải Mini Canvas Mont Marte',26000,'','https://bucket.nhanh.vn/store/15668/ps/20220508/Ba__ng_va__i_Mini_Canvas_Mont_Marte_2_ba__ng_8x10cm__kho__ng_ke__m_gia___do______3.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000139',N'Bút bi bấm 6 màu ngòi 0.7mm',35000,'','https://bucket.nhanh.vn/store/15668/ps/20221022/BUT_BI_BAM.jpeg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000140',N'Giấy Arches Made in France 300gsm 19x28cm - 4 tờ',112000,'','https://bucket.nhanh.vn/store/15668/ps/20210630/giay_arches_new.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000141',N'Giấy Artistico 100% cotton 300gsm 10 tờ',90000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/artistico_thumb.jpeg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000142',N'Giấy Baohong 200gsm túi 10 tờ',26000,'','https://bucket.nhanh.vn/store/15668/ps/20220106/baohong_200gsm.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000143',N'Giấy Canson ',220000,'','https://bucket.nhanh.vn/store/15668/ps/20210324/24052021110542_Giay_Canson__C_a_Grain_ve_chi_250gsm_30_to_A4__giay_canson_ve_chi_2_.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000144',N'Giấy màu nước Veneto - 300gsm 20 tờ',75000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/veneto_thumb.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000145',N'Giấy vẽ Canson Moulin Du Roy - 300gsm 12 tờ',430000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/moulin_thumb.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000146',N'Giấy vẽ chì Canson truyền thống 110gsm 10 tờ A4 chuẩn',20000,'','https://bucket.nhanh.vn/store/15668/ps/20220508/Canson_truye____n_tho____ng_110gsm.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000147',N'Giấy vẽ màu nước Bockingford 100% cotton 300gsm 12 tờ',235000,'','https://bucket.nhanh.vn/store/15668/ps/20210310/1016202121626_giay_ve_Bockingford.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000148',N'Giấy vẽ màu nước Canson 1557 250g 20 tờ',80000,'','https://bucket.nhanh.vn/store/15668/ps/20210807/_DSC5556.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000149',N'Giấy vẽ màu nước Canson Imagine - 200gsm 50 tờ',270000,'','https://bucket.nhanh.vn/store/15668/ps/20210904/giay_ve_canson_imagine_5.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000150',N'Giấy vẽ màu nước Fabriano 300gsm 10 tờ',32000,'','https://bucket.nhanh.vn/store/15668/ps/20220508/Gia____y_Fabriano_300gsm.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000151',N'Giấy vẽ màu nước Nabii Watercolor Pad x Halcyon Planet - 300 gsm 20 tờ - A5',90000,'','https://bucket.nhanh.vn/store/15668/ps/20210807/z2588913809001_1b53255c9600d26ac9e91df52a7cac94.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000152',N'Giấy vẽ màu nước Potentate hoa đỏ 300gsm 16 tờ gáy xoắn',39000,'','https://bucket.nhanh.vn/store/15668/ps/20211124/potentate_hoa_hong_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000153',N'Giấy vẽ truyền thần Canson ',155000,'','https://bucket.nhanh.vn/store/15668/ps/20210223/2350202145027_giay_ve_truyen_than_c_a_grain.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000154',N'Combo tự làm sổ vẽ màu nước mini A7',65000,'','','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000155',N'Sổ Canson 1557 - 155gsm 40 tờ',130000,'','https://bucket.nhanh.vn/store/15668/ps/20210612/12062021090611_So_Canson_1557___155gsm_40_to__so_canson_1557_5_.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000156',N'Sổ Canson 1557 - 300gsm 20 tờ',90000,'','https://bucket.nhanh.vn/store/15668/ps/20210107/728202162822_so_canson_giay_canson_1557_1.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000157',N'Sổ Canson Creative Pad - 160gsm 30 tờ',70000,'','https://bucket.nhanh.vn/store/15668/ps/20210129/2941202134122_so_canson_creative_pad_2.jpg','lsp02')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000158',N'Hình dán ảnh in theo tông màu 40 miếng',30000,'','https://bucket.nhanh.vn/store/15668/ps/20211012/anh_in.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000159',N'Hình dán Box Sticker mèo dễ thương 30 miếng',25000,'','https://bucket.nhanh.vn/store/15668/ps/20210405/05042021050433_hinhdan_sticker_meo_3_2.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000160',N'Hình dán Pocket Tape',30000,'','https://bucket.nhanh.vn/store/15668/ps/20200826/a__nh_chu__p_ma__n_hi__nh_2020_08_26_lu__c_16_55_30_thumb.png','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000161',N'Hình dán sticker Planet Diary hình thú dễ thương',15000,'','https://bucket.nhanh.vn/store/15668/ps/20210628/28062021020629_Planet_Diary_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000162',N'Hình dán Tem thư Cổ điển',30000,'','https://bucket.nhanh.vn/store/15668/ps/20200827/Ảnh chụp Màn hình 2020-08-27 lúc 12.55.41_thumb.png','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000163',N'Hình dán trang trí Deco Paper',32000,'','https://bucket.nhanh.vn/store/15668/ps/20200827/Ảnh chụp Màn hình 2020-08-27 lúc 12.43.20_thumb.png','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000164',N'Hình dán trang trí Hoa Vintage',12000,'','https://bucket.nhanh.vn/store/15668/ps/20200827/Ảnh chụp Màn hình 2020-08-27 lúc 12.01.57_thumb.png','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000165',N'Set 10 washi Infeel.me phong cách Nhật Bản Minimal',65000,'','https://bucket.nhanh.vn/store/15668/ps/20210507/07052021120525_washi_infeel_3.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000166',N'Set giấy báo trang trí cổ điển Zaomo',35000,'','https://bucket.nhanh.vn/store/15668/ps/20200913/Set_giay_bao_trang_tri_co_dien_Zaomo_(a__nh_chu__p_ma__n_hi__nh_2020_08_27_lu__c_13_27_42)_thumb.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000167',N'Sổ lưu tranh A4 - 30 tờ màu trắng',30000,'','https://bucket.nhanh.vn/store/15668/ps/20220106/so_dung_tranh.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000168',N'Sticker Bag Series 40 miếng',25000,'','https://bucket.nhanh.vn/store/15668/ps/20211022/bag_series_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000169',N'Sticker chấm tròn',9000,'','https://bucket.nhanh.vn/store/15668/ps/20201207/a__nh_chu__p_ma__n_hi__nh_2020_12_07_lu__c_13_50_53_copy_thumb.png','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000170',N'Sticker Color Matching hình khối cơ bản 10 tờ',25000,'','https://bucket.nhanh.vn/store/15668/ps/20211021/color_matching_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000171',N'Sticker Deco Infeel Me vintage 40 miếng',25000,'','https://bucket.nhanh.vn/store/15668/ps/20211025/vintage_deco_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000172',N'Sticker hình dán chủ đề hoa lá vintage 60 miếng',35000,'','https://bucket.nhanh.vn/store/15668/ps/20211012/12102021061053_Sticker_hoa_vintage_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000173',N'Sticker hình dán Golden Flower kim tuyến',30000,'','https://bucket.nhanh.vn/store/15668/ps/20211007/Golden_Flower_2.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000174',N'Sticker hộp vuông câu trích dẫn 46 miếng',20000,'','https://bucket.nhanh.vn/store/15668/ps/20211021/sticker_lo____i_tri__ch_da____n.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000175',N'Sticker hộp vuông chủ đề cafe 46 miếng',20000,'','https://bucket.nhanh.vn/store/15668/ps/20211022/cafe_4.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000176',N'Sticker hộp vuông chủ đề đồ ăn 46 miếng',20000,'','https://bucket.nhanh.vn/store/15668/ps/20211022/food_2.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000177',N'Sticker hộp vuông chủ đề tem thư 46 miếng',20000,'','https://bucket.nhanh.vn/store/15668/ps/20211012/tem_thu_vuong_5.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000178',N'Sticker hộp vuông chủ đề vintage 46 miếng',20000,'','https://bucket.nhanh.vn/store/15668/ps/20211012/hop_vuong_2.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000179',N'Sticker Simo 48 miếng theo tông màu',25000,'','https://bucket.nhanh.vn/store/15668/ps/20211013/simno_4.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000180',N'Sticker tem thư nhỏ 46 miếng',25000,'','https://bucket.nhanh.vn/store/15668/ps/20211012/12102021101010_tem_thu_nho_2.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000181',N'Sticker tranh in hiện đại trắng đen 45 miếng',20000,'','https://bucket.nhanh.vn/store/15668/ps/20211022/22102021061028_hinh_in_1.jpg','lsp05')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000182',N'Cọ Holic 1999 đầu tròn',20000,'','https://bucket.nhanh.vn/store/15668/ps/20210311/11072021110742_co_holic_1999.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000183',N'Cọ mop Holic Snow',105000,'','https://bucket.nhanh.vn/store/15668/ps/20210904/co_mop_holic_4.jpeg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000184',N'Cọ vẽ Lobeo Moon',30000,'','https://bucket.nhanh.vn/store/15668/ps/20210129/2910202121054__DSC2069resize.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000185',N'Bút Marie Gelly cây lẻ',13000,'','https://bucket.nhanh.vn/store/15668/ps/20210428/28042021080438_But_Marie_s_Gelly_cay_le__bo_3_but_marie_s_gelly_3_.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000186',N'Bút Trắng Gelly Roll 0.8',23000,'','https://bucket.nhanh.vn/store/15668/ps/20210118/1805202110526_but_trang_gelly_roll_sakura.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000187',N'Cọ vẽ Makie đầu siêu nhỏ lông sóc',85000,'','https://bucket.nhanh.vn/store/15668/ps/20210807/co_makie_3.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000188',N'Bộ cọ Keep Smiling 5 cây đỏ đen',40000,'','https://bucket.nhanh.vn/store/15668/ps/20221028/keep_do_den.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000189',N'Bút Đi Nét Marvy',19000,'','https://bucket.nhanh.vn/store/15668/ps/20210311/11332021103314_but_di_net_marvy_4.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000190',N'Cọ tỉa Ishak - Thân đen lông vàng',25000,'','https://bucket.nhanh.vn/store/15668/ps/20210319/1930202123020_co_tia_ishak_3.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000191',N'Dụng cụ bo viền giấy 3 trong 1',85000,'','https://bucket.nhanh.vn/store/15668/ps/20221022/bo_goc_3in1_3.jpeg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000192',N'Bút đi nét Superior kháng nước',15000,'','https://bucket.nhanh.vn/store/15668/ps/20210129/2954202135451_but_di_net_superior_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000193',N'Cọ vẽ thư pháp Chu Tước Lông Thỏ',100000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/chu-tuoc_thumb.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000194',N'Cọ vẽ thư pháp Sơn Quỷ',75000,'','https://bucket.nhanh.vn/store/15668/ps/20210129/2923202132345_co_thu_phap_Son_Quy_3.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000195',N'Bút lông kim Marvy 4300',20000,'','https://bucket.nhanh.vn/store/15668/ps/20220120/marvy_4300_3.jpeg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000196',N'Cọ vẽ thư pháp Phượng Trì Ngâm',140000,'','https://bucket.nhanh.vn/store/15668/ps/20210223/co_phuong_tri_ngam.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000197',N'Cọ silicon sử dụng keo chặn màu Ishake',18000,'','https://bucket.nhanh.vn/store/15668/ps/20221021/Co___silicon_su_____du__ng_keo_cha____n_ma__u_Ishake_3.jpeg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000198',N'Cọ Thư pháp Nhất Tiễn Mai',90000,'','https://bucket.nhanh.vn/store/15668/ps/20210223/2304202130447_co_nhat_tien_mai_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000199',N'Cọ vẽ thư pháp Tiểu Giai',75000,'','https://bucket.nhanh.vn/store/15668/ps/20210129/2926202132640_co_thu_phap_Tieu_giai_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000200',N'Bộ 10 cọ vẽ acrylic Ishake',110000,'','https://bucket.nhanh.vn/store/15668/ps/20211124/bo_10_cay_ishake_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000201',N'Set bút Brush LePen Flex Marvy tông Pastel',165000,'','https://bucket.nhanh.vn/store/15668/ps/20210607/07062021100636_Set_but_Brush_LePen_Flex_Marvy_tong_Pastel__set_but_lepen_flex_marvy_4_.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000202',N'Bút sơn nhũ Marvy 170',35000,'','https://bucket.nhanh.vn/store/15668/ps/20220120/Marvy_170.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000203',N'Cọ vẽ rigger Ishake lông nhân tạo',20000,'','https://bucket.nhanh.vn/store/15668/ps/20220507/co_rigger_ishake_2.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000204',N'Bộ cọ Giorgione 8 cây - ống nhựa',70000,'','https://bucket.nhanh.vn/store/15668/ps/20221022/Bo_____co___Giorgione_8_ca__y_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000205',N'Cọ nước Superior phiên bản mới',28000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/4_0_thumb.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000206',N'Bộ bút gel Mira plus',35000,'','https://bucket.nhanh.vn/store/15668/ps/20221003/mira.jpeg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000207',N'Cọ vẽ Mont Marte',25000,'','https://bucket.nhanh.vn/store/15668/ps/20220322/co_3.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000208',N'Cọ Artpower vẽ màu Acrylic bộ 10 cây',98000,'','https://bucket.nhanh.vn/store/15668/ps/20210324/24102021111009_Co_Artpower_ve_mau_Acrylic_bo_10_cay__10_co_artpower_3_.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000209',N'Bộ 7 Cây Cọ vẽ Giorgione Lông Nhân Tạo Tông Pastel',75000,'','https://bucket.nhanh.vn/store/15668/ps/20210427/27042021090419_Bo_10_Cay_Co_ve_Giorgione_Long_Nhan_Tao_Tong_Pastel__bo_10_co_giorgione_long_nhan_tao_3_.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000210',N'Bộ cọ Keep Smiling 3 cây',25000,'','https://bucket.nhanh.vn/store/15668/ps/20221028/keep_x3_1.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000211',N'Bộ cọ Keep Smiling thân xanh',75000,'','https://bucket.nhanh.vn/store/15668/ps/20221028/keep_7_2.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000212',N'Cọ mop Lông Cừu Aishake',65000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/co long cuu 1 copy_thumb.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000213',N'Bộ cọ tỉa Transon -12 cây',200000,'','https://bucket.nhanh.vn/store/15668/ps/20210609/bo_co_tia_transon_12_cay_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000214',N'Bộ cọ Keep Smiling 6 cây',55000,'','https://bucket.nhanh.vn/store/15668/ps/20221028/keep_t6_2.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000215',N'Bút thư pháp Lepen Flex đầu brush Marvy 4800',24000,'','https://bucket.nhanh.vn/store/15668/ps/20220120/marvy_4800_1.jpeg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000216',N'Cọ vẽ thư pháp Hoả Vũ',165000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/hoa vu.jpeg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000217',N'Cọ vẽ thư pháp Tô Mạc Già',115000,'','https://bucket.nhanh.vn/store/15668/ps/20220427/co_to_mac_gia.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000218',N'Bộ 9 bút Morandi',98000,'','https://bucket.nhanh.vn/store/15668/ps/20200827/a__nh_chu__p_ma__n_hi__nh_2020_08_27_lu__c_15_31_17_thumb.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000219',N'Bút dạ đánh dấu STABILO SWING COOL',30000,'','https://bucket.nhanh.vn/store/15668/ps/20210904/stabilo_swing_cool_5.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000220',N'Cọ vẽ thư pháp Bạch Phụng',140000,'','https://bucket.nhanh.vn/store/15668/ps/20210123/2302202150230_co_thu_phap_bach_phung_2.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000221',N'Bút lông 2 đầu Marvy Uchida 1122',30000,'','https://bucket.nhanh.vn/store/15668/ps/20210521/2153202195318_But_long_2_dau_Marvy_Uchida_1122__but_long_hai_dau_uchida_6_.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000222',N'Bút đi nét Micron Pigma Manga - Cây Lẻ',35000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/micron cây lẻ_thumb.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000223',N'Bộ 6 cọ acrylic Aishake đầu vuông màu bạc',80000,'','https://bucket.nhanh.vn/store/15668/ps/20221130/aishake_2.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000224',N'Bộ cọ nylon Giorgione 6 cây',75000,'','https://bucket.nhanh.vn/store/15668/ps/20221103/bo_6_co_1.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000225',N'Phá Trận Tử',125000,'','https://bucket.nhanh.vn/store/15668/ps/20220427/co_pha_tran_tu.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000226',N'Bộ cọ Keep Smiling 12 cây đủ đầu cọ',110000,'','https://bucket.nhanh.vn/store/15668/ps/20221028/keep_12_tong.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000227',N'Cọ vẽ đầu tròn Hand ZBS2',25000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/hand_thumb.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000228',N'Bộ 5 bút sắt Kuelox',180000,'','https://bucket.nhanh.vn/store/15668/ps/20210512/1253202135351_Bo_5_but_sat_kuelox_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000229',N'Cọ vẽ thư pháp Giang Thành Tử',115000,'','https://bucket.nhanh.vn/store/15668/ps/20210316/16032021040314_co_giang_thanh_tu_2.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000230',N'Hộp 7 cọ vẽ Giorgione đầu tròn tông Pastel',140000,'','https://bucket.nhanh.vn/store/15668/ps/20210625/hop_7_co_giorgione_pastel_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000231',N'Bút đi nét Stabilo Point-88 0.4mm',28000,'','https://bucket.nhanh.vn/store/15668/ps/20200709/sta1_thumb.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000232',N'Bút lông Kuretake Cambio',125000,'','https://bucket.nhanh.vn/store/15668/ps/20201207/cambio1_thumb.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000233',N'Bộ 5 cây cọ tỉa Mont Marte lông nhân tạo thân trắng',155000,'','https://bucket.nhanh.vn/store/15668/ps/20220508/Bo_____5_ca__y_co___ti__a_Mont_Marte_lo__ng_nha__n_ta__o_tha__n_tra____ng.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000234',N'Bộ bút gel Yoofun 12 màu tặng kèm hộp bút',145000,'','https://bucket.nhanh.vn/store/15668/ps/20210616/Bo_but_gel_yoofun_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000235',N'Bút đi nét Zig Mangaka - Màu',25000,'','https://bucket.nhanh.vn/store/15668/ps/20210107/759202145905_but_di_net_zig_mangaka_3.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000236',N'Bút mực nước DS-904',15000,'','https://bucket.nhanh.vn/store/15668/ps/20200901/Ảnh chụp Màn hình 2020-08-27 lúc 16.32.01_thumb.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000237',N'Bộ 5 cây cọ Giorgione Lông Nhân Tạo Đầu tròn',60000,'','https://bucket.nhanh.vn/store/15668/ps/20210427/27032021110344_co_5_cay_giorgione_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000238',N'Bộ bút viết Calligraphy 9 ngòi Mont Marte',89000,'','https://bucket.nhanh.vn/store/15668/ps/20220426/Calligraphy_Dip_Pen_5.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000239',N'Bộ bút, cọ vẽ truyện tranh Holbein Maxon',340000,'','https://bucket.nhanh.vn/store/15668/ps/20220517/bo_ve_truyen_tranh_maxon_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000240',N'Set Bút Viền Micron Pigma Manga - 6 Bút',199000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/micron_thumb.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000241',N'Cọ tỉa đầu tròn Aishake',20000,'','https://bucket.nhanh.vn/store/15668/ps/20221021/co___ti__a_Ishake_2.jpeg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000242',N'Bút đi nét Staedtler',39000,'','https://bucket.nhanh.vn/store/15668/ps/20210825/25082021090853_STAEDTLER_line1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000243',N'Cọ Lông Dê Art Secret 2690 Thân Trúc',82000,'','https://bucket.nhanh.vn/store/15668/ps/20200719/co long de 2690.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000244',N'Bộ 9 bút gel Languo',45000,'','https://bucket.nhanh.vn/store/15668/ps/20200913/Bo_9_but_gel_Languo_thumb.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000245',N'Bút ngòi 2 Lines Pen',45000,'','https://bucket.nhanh.vn/store/15668/ps/20200826/Ảnh chụp Màn hình 2020-08-26 lúc 16.40.58_thumb.png','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000246',N'Bút đi nét Copic Multiliner',62000,'','https://bucket.nhanh.vn/store/15668/ps/20210317/but_di_net_copic_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000247',N'Bút lông Kuretake Bimoji',52000,'','https://bucket.nhanh.vn/store/15668/ps/20210324/24322021103216_but_long_Kuretake_Bimoji_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000248',N'Bộ 12 bút thư pháp Hernidex 2 đầu',360000,'','https://bucket.nhanh.vn/store/15668/ps/20210830/30082021120833_hernidex_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000249',N'Bộ 2 bút tỉa Zig Inktober trắng, đen',280000,'','https://bucket.nhanh.vn/store/15668/ps/20201115/set_2_cay_thumb.jpeg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000250',N'Bộ 3 bút Marie Gelly (Trắng - Bạc - Vàng)',35000,'','https://bucket.nhanh.vn/store/15668/ps/20210427/27092021100905_bo_3_but_marie_s_gelly_1.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000251',N'Bộ 3 Bút Trắng Gelly Roll đủ size',65000,'','https://bucket.nhanh.vn/store/15668/ps/20200716/but gelly roll_thumb.jpeg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000252',N'Bộ 3 cọ tỉa Mỹ Trúc (Cọ Mỹ Trúc)',35000,'','https://bucket.nhanh.vn/store/15668/ps/20210606/bo_3_co_tia_my_truc_2.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000253',N'Bộ 3 cọ vẽ Staedtler',90000,'','https://bucket.nhanh.vn/store/15668/ps/20201207/brush_steadtler_thumb.jpg','lsp03')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000254',N'Bút dạ Giotto Decor textile vẽ lên vải',30000,'','https://bucket.nhanh.vn/store/15668/ps/20201201/giottotex1_thumb.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000255',N'Màu chì Faber Castell POLYCHROMOS hộp thiếc',1260,000,'','https://bucket.nhanh.vn/store/15668/ps/20221110/polychromos_120m.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000256',N'Màu chì khô Marco Raffine hộp thiếc',160000,'','https://bucket.nhanh.vn/store/15668/ps/20210118/18112021121111_mau_chi_marco_raffine_2.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000257',N'Màu dạ lẻ Superior Brush 2 đầu',15000,'','https://bucket.nhanh.vn/store/15668/ps/20220109/uperior_brush_5.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000258',N'Màu dạ lẻ Touch Soft Head',12000,'','https://bucket.nhanh.vn/store/15668/ps/20220107/touch_soft_head_4.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000259',N'Màu nước Moyuntang Boku',370000,'','https://bucket.nhanh.vn/store/15668/ps/20210310/1011202131120_mau_moyuntang_thuy_mac_2.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000260',N'Màu nước Mungyo Professional',390000,'','https://bucket.nhanh.vn/store/15668/ps/20210310/1041202134118_mau_nuoc_mungyo_1.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000261',N'Màu nước Staedtler dạng tuýp',120000,'','https://bucket.nhanh.vn/store/15668/ps/20221022/mau_nc_staed_2c2c2d383b884323b2aef33f83bed757_1024x1024.jpeg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000262',N'Màu poster Faber-Castell 15ml',30000,'','https://bucket.nhanh.vn/store/15668/ps/20220421/1.png','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000263',N'Màu Gouache Miya 30ml bộ 56 màu',550000,'','https://bucket.nhanh.vn/store/15668/ps/20220323/egehhtrh.png','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000264',N'Chì khô Faber Castell CLASSIC KNIGHT',140000,'','https://bucket.nhanh.vn/store/15668/ps/20210415/15322021113255_Chi_kho_Faber_Castell__mau_chi_kho_faber_castell_3_.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000265',N'Màu Nước Van Gogh - Hộp Sắt',1160,000,'','https://bucket.nhanh.vn/store/15668/ps/20220427/_DSC4627.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000266',N'Màu Nước White Nights viên nén',305000,'','https://bucket.nhanh.vn/store/15668/ps/20210630/mau_nuoc_white_nights_hop_nhua.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000267',N'Mực bút sắt Kuelox kháng nước Hũ 30ml',55000,'','https://bucket.nhanh.vn/store/15668/ps/20211216/1.png','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000268',N'Chì nước Faber Castell PARROT',98000,'','https://bucket.nhanh.vn/store/15668/ps/20210828/chi_nuoc_faber_1.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000269',N'Màu gouache Holbein Limited 4 mùa 15ml set 12 màu',1300,000,'','https://bucket.nhanh.vn/store/15668/ps/20210630/mau_gouache_holbein_limited_xuan.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000270',N'Màu nước LENINGRAD',490000,'','https://bucket.nhanh.vn/store/15668/ps/20221023/27122021111224_mau_nuoc_leningrad_Nga_3_nho.jpeg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000271',N'Màu nước LUKAS AQUARELL STUDIO',800000,'','https://bucket.nhanh.vn/store/15668/ps/20201015/a__nh_chu__p_ma__n_hi__nh_2020_10_15_lu__c_00_23_57_thumb.png','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000272',N'Màu nước Super Vision Studio Hộp Sắt',440000,'','https://bucket.nhanh.vn/store/15668/ps/20210223/2314202151409_mau_nuoc_super_vision.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000273',N'Màu nước Winsor Newton Cotman 9 màu',330000,'','https://bucket.nhanh.vn/store/15668/ps/20221122/Ma__u_nu__o____c_Winsor_Newton_Cotman_9_ma__u.jpeg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000274',N'Bút dạ Giotto Decor materials',30000,'','https://bucket.nhanh.vn/store/15668/ps/20201201/giottole_thumb.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000275',N'Bút sơn Acrylic Guang Na tông Morandi',190000,'','https://bucket.nhanh.vn/store/15668/ps/20220517/acrylic_guangna_2.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000276',N'Bút sơn vẽ trên nhiều chất liệu POSCA PC5M',65000,'','https://bucket.nhanh.vn/store/15668/ps/20200825/posca_thumb.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000277',N'Màu nước Holbein Artist 5ml',525000,'','https://bucket.nhanh.vn/store/15668/ps/20210317/1744202194454_mau_nuoc_holbein_3.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000278',N'Màu phấn dầu Paul Rubens hạng họa sỹ',85000,'','https://bucket.nhanh.vn/store/15668/ps/20221201/IMG_8283.JPG','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000279',N'Màu nước Mijello Mission Gold - Tuýp Lẻ 7ml',40000,'','https://bucket.nhanh.vn/store/15668/ps/20220423/mijello_new_pure_pigment_4.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000280',N'Màu nước Sennelier Aquarelle cao cấp - Tuýp 10ml ( Tông Lạnh)',144000,'','https://bucket.nhanh.vn/store/15668/ps/20210831/31082021100820_mau_nuoc_sennelier_3.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000281',N'Mực vẽ truyện tranh Holbein Maxon kháng nước 30ml',75000,'','https://bucket.nhanh.vn/store/15668/ps/20220514/Muc_holbein_maxon_3.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000282',N'Màu chì KALOUR cao cấp',368000,'','https://bucket.nhanh.vn/store/15668/ps/20221110/240m_chi_kho_2.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000283',N'Màu chì khô Marco Renoir cao cấp',410000,'','https://bucket.nhanh.vn/store/15668/ps/20210508/811202141132_Mau_chi_Marco_Renoir_cao_cap__mau_chi_marco_4_.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000284',N'Màu nước Giorgione hộp sắt',195000,'','https://bucket.nhanh.vn/store/15668/ps/20221122/mau_nuoc_giorgione_1.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000285',N'Phấn dầu Giorgione',50000,'','https://bucket.nhanh.vn/store/15668/ps/20221025/Pha____n_da____u_giorgione.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000286',N'Màu nước chiết Paul Rubens - 24 màu 0.8ml Set Pastel',290000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/chiet paul rubens_thumb.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000287',N'Màu Acrylic Staedtler dạng tuýp',200000,'','https://bucket.nhanh.vn/store/15668/ps/20210106/631202133131_mau_acrylic_staedtler_tuyp_1.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000288',N'Màu nước Renesans',39000,'','https://bucket.nhanh.vn/store/15668/ps/20200804/ren3_thumb.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000289',N'Màu poster Mont Marte 500ml',65000,'','https://bucket.nhanh.vn/store/15668/ps/20221122/Poster_mont_marte_500ml.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000290',N'Màu Nhũ Pearl Gansai 6 màu',250000,'','https://bucket.nhanh.vn/store/15668/ps/20210829/29082021040810_pearl.jpeg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000291',N'Bút màu chì phấn Stabilo Carbothello - Cây lẻ',37000,'','https://bucket.nhanh.vn/store/15668/ps/20210902/chi_phan_carbothello_stabilo_2.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000292',N'Màu Acrylic Pentel Arts tuýp 28ml',36000,'','https://bucket.nhanh.vn/store/15668/ps/20210616/mau_acrylic_pentel_tuyp_1.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000293',N'Màu nước Paul Rubens hạng học sinh - tuýp 5ml',17000,'','https://bucket.nhanh.vn/store/15668/ps/20210830/30082021050824_paul_rubens_hang_hoc_sinh.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000294',N'Tuýp lẻ màu nước Paul Rubens 8ml',39000,'','https://bucket.nhanh.vn/store/15668/ps/20210904/mau_nuoc_paul_rubens_tuyp_le_1.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000295',N'Màu dạ Touchliit 6 lẻ',10000,'','https://bucket.nhanh.vn/store/15668/ps/20211029/touchliit_6_2.jpeg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000296',N'Màu mực nước Ecoline - 30ml',80000,'','https://bucket.nhanh.vn/store/15668/ps/20210903/mau_muc_ecoline_1.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000297',N'Màu nước Hạng Hoạ sĩ Art Secret tuýp 5ml',32000,'','https://bucket.nhanh.vn/store/15668/ps/20220107/mau_nuoc_art_secret_5.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000298',N'Màu nước Sennelier Aquarelle cao cấp - Tuýp 10ml ( Tông Nóng )',144000,'','https://bucket.nhanh.vn/store/15668/ps/20210831/31082021100830_mau_nuoc_sennelier_2.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000299',N'Phấn dầu Pentel Arts',30000,'','https://bucket.nhanh.vn/store/15668/ps/20220519/pha____n_da____u_pentel.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000300',N'Màu chì dầu Brutfuner tông pastel bộ 50 màu',365000,'','https://bucket.nhanh.vn/store/15668/ps/20221125/chi_dau_50m.png','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000301',N'Bộ màu poster Nicker - Tuýp 20ml',750000,'','https://bucket.nhanh.vn/store/15668/ps/20210904/bo_mau_poster_nick_12_mau.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000302',N'Màu nước Phoenix Artist Grade Watercolor',280000,'','https://bucket.nhanh.vn/store/15668/ps/20210807/07082021050856_phon1.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000303',N'Màu dạ Touchliit 6 bộ',160000,'','https://bucket.nhanh.vn/store/15668/ps/20210903/03092021030921_touch_liit_30_mau.jpeg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000304',N'Phấn tiên Master Pastel Marie',45000,'','https://bucket.nhanh.vn/store/15668/ps/20210123/2334202153424_phan_tien_marie_master.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000305',N'Màu chì khô Deli - Hộp thiếc',120000,'','https://bucket.nhanh.vn/store/15668/ps/20210902/_DSC0296.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000306',N'Bộ màu vẽ vải Fabric Mont Marte 20ml',125000,'','https://bucket.nhanh.vn/store/15668/ps/20220628/IMG_1652.JPG','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000307',N'Màu Nước Superior',120000,'','https://bucket.nhanh.vn/store/15668/ps/20210309/911202151110_mau_nuoc_superior_1.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000308',N'Màu gouache Mari 100ml',13000,'','https://bucket.nhanh.vn/store/15668/ps/20210415/Mau_gouache_Marie_s_100ml__mau_gouache_marie_3_.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000309',N'Màu Acrylic Marie 300ml',55000,'','https://bucket.nhanh.vn/store/15668/ps/20210904/Mau_Acrylic_Marie_s_300ml__mau_acrylic_marie_3_.jpeg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000310',N'Acrylic Marie 100ml',19000,'','https://bucket.nhanh.vn/store/15668/ps/20210904/Acrylic_Marie_s_100ml__mau_acrylic_marie_4_.jpeg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000311',N'Màu Poster Nicker - Tuýp lẻ 20ml',58000,'','https://bucket.nhanh.vn/store/15668/ps/20210905/mau_poster_nicker.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000312',N'Màu Mực Nhũ 5ml',12000,'','https://bucket.nhanh.vn/store/15668/ps/20200818/mau muc nhu.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000313',N'Màu poster Pentel 30ml',32000,'','https://bucket.nhanh.vn/store/15668/ps/20210609/mau_poster_pentel_2.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000314',N'Màu dạ marker Deli',169000,'','https://bucket.nhanh.vn/store/15668/ps/20221122/marker_deli_1.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000315',N'Màu nước Owin hộp sắt',245000,'','https://bucket.nhanh.vn/store/15668/ps/20221125/owin.png','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000316',N'Màu Gouache Dạng Tuýp Phoenix Studio Gouache',170000,'','https://bucket.nhanh.vn/store/15668/ps/20210701/mau_gouache_phoenix_11.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000317',N'Màu nước White Nights Lẻ Pastel',42000,'','https://bucket.nhanh.vn/store/15668/ps/20200726/white_nights_pastel.jpeg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000318',N'Bột nhũ Paul Rubens (Aqua Bronze)',85000,'','https://bucket.nhanh.vn/store/15668/ps/20210107/726202142633_bot_nhu_paul_rubens.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000319',N'Màu thạch Himi Gouache',200000,'','https://bucket.nhanh.vn/store/15668/ps/20210306/6402021124048_mau_thach_himi_gouache_2__2_.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000320',N'Mực vẽ kháng nước KOH-I-NOOR 20g',37000,'','https://bucket.nhanh.vn/store/15668/ps/20210901/01092021110921_muc_koh.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000321',N'Bộ màu vẽ gốm Ceramic Mont Marte 20ml x 6 màu',125000,'','https://bucket.nhanh.vn/store/15668/ps/20221123/ceramic.png','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000322',N'Màu Mont Marte Gouache',96000,'','https://bucket.nhanh.vn/store/15668/ps/20211230/MM_gouache_4.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000323',N'Màu phấn dầu Paul Rubens hình Vẹt hạng học sinh',40000,'','https://bucket.nhanh.vn/store/15668/ps/20221201/IMG_8298.JPG','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000324',N'Màu Nước Van Gogh - Hộp Nhựa 15 màu',460000,'','https://bucket.nhanh.vn/store/15668/ps/20210223/2321202142135_mau_van_gogh_set_pocket_15_mau.jpg','lsp01')

GO

INSERT INTO [dbo].[SanPham] (MaSP, TenSP,Gia,ChiTiet,Hinh,MaLoaiSP) VALUES ('SP000325',N'Màu acrylic Mont Marte hạng học sinh',96000,'','https://bucket.nhanh.vn/store/15668/ps/20211230/MM_acrylic_36ml_36m.jpg','lsp01')



-- Insert rows into table 'NguoiDung' in schema '[dbo]'

INSERT INTO [dbo].[NguoiDung]

( -- Columns to insert data into

 [MaNguoiDung], [TenDangNhap], [MatKhau], [RoleID]

)

VALUES

( -- First row: values for the columns in the list above

 'test_user_01','BeMeo','ngocphat','001'

)



-- Add more rows here

GO

/*
Tạo Hóa Đơn
*/

INSERT INTO [dbo].[HoaDon] (MaHoaDon, GhiChu,TongThanhToan,DiaChiGiaoHang,SoDienThoai,MaKhachHang,TrangThaiDonHang,TrangThaiGiaoHang,TrangThaiThanhToan) VALUES 

('DH.USER020.20221221072850',N'Đây là ghi chú của đơn hàng 1',455000,N'Đây là địa chỉ giao hàng của đơn số 1','0387439537','USER019', 1,1,0),

('DH.USER016.20221221074813',N'Đây là ghi chú của đơn hàng 2',560000,N'Đây là địa chỉ giao hàng của đơn số 2','0385007600','USER019', 1,1,1),

('DH.USER01.20221221082592',N'Đây là ghi chú của đơn hàng 3',965000,N'Đây là địa chỉ giao hàng của đơn số 3','0383169311','USER06', 0,1,0),

('DH.USER01.20221221092542',N'Đây là ghi chú của đơn hàng 4',835000,N'Đây là địa chỉ giao hàng của đơn số 4','0383523856','USER03', 1,1,1),

('DH.USER017.20221221093950',N'Đây là ghi chú của đơn hàng 5',750000,N'Đây là địa chỉ giao hàng của đơn số 5','0382951357','USER02', 1,0,1),

('DH.USER012.20221221120685',N'Đây là ghi chú của đơn hàng 6',745000,N'Đây là địa chỉ giao hàng của đơn số 6','0384485629','USER01', 0,1,1),

('DH.USER020.20221221091594',N'Đây là ghi chú của đơn hàng 7',925000,N'Đây là địa chỉ giao hàng của đơn số 7','0387323590','USER013', 1,1,0),

('DH.USER012.20221221138944',N'Đây là ghi chú của đơn hàng 8',540000,N'Đây là địa chỉ giao hàng của đơn số 8','0387156382','USER08', 1,0,0),

('DH.USER010.20221221114986',N'Đây là ghi chú của đơn hàng 9',940000,N'Đây là địa chỉ giao hàng của đơn số 9','0381120058','USER010', 0,0,0),

('DH.USER015.20221221085468',N'Đây là ghi chú của đơn hàng 10',740000,N'Đây là địa chỉ giao hàng của đơn số 10','0388037891','USER010', 0,1,0),

('DH.USER020.20221221105180',N'Đây là ghi chú của đơn hàng 11',780000,N'Đây là địa chỉ giao hàng của đơn số 11','0387468467','USER018', 1,1,0),

('DH.USER016.20221221080000',N'Đây là ghi chú của đơn hàng 12',960000,N'Đây là địa chỉ giao hàng của đơn số 12','0388241850','USER04', 0,1,0),

('DH.USER05.20221221082198',N'Đây là ghi chú của đơn hàng 13',305000,N'Đây là địa chỉ giao hàng của đơn số 13','0381740095','USER018', 0,0,0),

('DH.USER01.20221221168075',N'Đây là ghi chú của đơn hàng 14',360000,N'Đây là địa chỉ giao hàng của đơn số 14','0388577681','USER04', 0,0,1),

('DH.USER09.20221221077176',N'Đây là ghi chú của đơn hàng 15',435000,N'Đây là địa chỉ giao hàng của đơn số 15','0382458385','USER014', 1,0,1),

('DH.USER09.20221221075985',N'Đây là ghi chú của đơn hàng 16',705000,N'Đây là địa chỉ giao hàng của đơn số 16','0386045814','USER018', 1,0,1),

('DH.USER018.20221221214786',N'Đây là ghi chú của đơn hàng 17',600000,N'Đây là địa chỉ giao hàng của đơn số 17','0386544297','USER02', 1,0,0),

('DH.USER01.20221221111542',N'Đây là ghi chú của đơn hàng 18',760000,N'Đây là địa chỉ giao hàng của đơn số 18','0381582275','USER019', 1,1,1),

('DH.USER013.20221221145768',N'Đây là ghi chú của đơn hàng 19',480000,N'Đây là địa chỉ giao hàng của đơn số 19','0386673167','USER018', 0,1,1),

('DH.USER03.20221221124473',N'Đây là ghi chú của đơn hàng 20',1000000,N'Đây là địa chỉ giao hàng của đơn số 20','0382515690','USER03', 0,0,0),

('DH.USER019.20221221179210',N'Đây là ghi chú của đơn hàng 21',275000,N'Đây là địa chỉ giao hàng của đơn số 21','0387749644','USER01', 1,1,0),

('DH.USER08.20221221172474',N'Đây là ghi chú của đơn hàng 22',870000,N'Đây là địa chỉ giao hàng của đơn số 22','0381845801','USER06', 0,0,1),

('DH.USER04.20221221282004',N'Đây là ghi chú của đơn hàng 23',650000,N'Đây là địa chỉ giao hàng của đơn số 23','0386561112','USER01', 0,0,0),

('DH.USER05.20221221150222',N'Đây là ghi chú của đơn hàng 24',860000,N'Đây là địa chỉ giao hàng của đơn số 24','0384646196','USER08', 1,0,0),

('DH.USER01.20221221246610',N'Đây là ghi chú của đơn hàng 25',285000,N'Đây là địa chỉ giao hàng của đơn số 25','0384536937','USER016', 1,0,1),

('DH.USER012.20221221315025',N'Đây là ghi chú của đơn hàng 26',920000,N'Đây là địa chỉ giao hàng của đơn số 26','0385286181','USER08', 1,1,1),

('DH.USER020.20221221288624',N'Đây là ghi chú của đơn hàng 27',650000,N'Đây là địa chỉ giao hàng của đơn số 27','0388003619','USER03', 1,1,0),

('DH.USER09.20221221158278',N'Đây là ghi chú của đơn hàng 28',940000,N'Đây là địa chỉ giao hàng của đơn số 28','0382404421','USER06', 1,0,0),

('DH.USER012.20221221304354',N'Đây là ghi chú của đơn hàng 29',375000,N'Đây là địa chỉ giao hàng của đơn số 29','0385787353','USER02', 0,0,0),

('DH.USER019.20221221110202',N'Đây là ghi chú của đơn hàng 30',910000,N'Đây là địa chỉ giao hàng của đơn số 30','0381503423','USER03', 0,0,1),

('DH.USER09.20221221357130',N'Đây là ghi chú của đơn hàng 31',930000,N'Đây là địa chỉ giao hàng của đơn số 31','0381640473','USER01', 1,1,0),

('DH.USER014.20221221117118',N'Đây là ghi chú của đơn hàng 32',715000,N'Đây là địa chỉ giao hàng của đơn số 32','0381512061','USER05', 0,1,0),

('DH.USER07.20221221173906',N'Đây là ghi chú của đơn hàng 33',670000,N'Đây là địa chỉ giao hàng của đơn số 33','0386093562','USER011', 1,0,0),

('DH.USER07.20221221098755',N'Đây là ghi chú của đơn hàng 34',650000,N'Đây là địa chỉ giao hàng của đơn số 34','0387872590','USER012', 1,0,0),

('DH.USER019.20221221084206',N'Đây là ghi chú của đơn hàng 35',775000,N'Đây là địa chỉ giao hàng của đơn số 35','0387584520','USER04', 1,0,0),

('DH.USER018.20221221227235',N'Đây là ghi chú của đơn hàng 36',745000,N'Đây là địa chỉ giao hàng của đơn số 36','0382849101','USER017', 1,0,0),

('DH.USER014.20221221335686',N'Đây là ghi chú của đơn hàng 37',930000,N'Đây là địa chỉ giao hàng của đơn số 37','0385952511','USER018', 1,0,0),

('DH.USER01.20221221352940',N'Đây là ghi chú của đơn hàng 38',965000,N'Đây là địa chỉ giao hàng của đơn số 38','0383410468','USER012', 0,1,0),

('DH.USER014.20221221259240',N'Đây là ghi chú của đơn hàng 39',500000,N'Đây là địa chỉ giao hàng của đơn số 39','0387026449','USER011', 0,0,1),

('DH.USER018.20221221293707',N'Đây là ghi chú của đơn hàng 40',275000,N'Đây là địa chỉ giao hàng của đơn số 40','0389456221','USER09', 0,1,1),

('DH.USER015.20221221232490',N'Đây là ghi chú của đơn hàng 41',935000,N'Đây là địa chỉ giao hàng của đơn số 41','0385755066','USER015', 1,1,1),

('DH.USER09.20221221384819',N'Đây là ghi chú của đơn hàng 42',490000,N'Đây là địa chỉ giao hàng của đơn số 42','0389095546','USER08', 0,1,0),

('DH.USER014.20221221083938',N'Đây là ghi chú của đơn hàng 43',595000,N'Đây là địa chỉ giao hàng của đơn số 43','0382530388','USER017', 1,1,0),

('DH.USER016.20221221136189',N'Đây là ghi chú của đơn hàng 44',980000,N'Đây là địa chỉ giao hàng của đơn số 44','0389347479','USER01', 1,1,0),

('DH.USER015.20221221213298',N'Đây là ghi chú của đơn hàng 45',935000,N'Đây là địa chỉ giao hàng của đơn số 45','0386651608','USER04', 0,1,1),

('DH.USER01.20221221084955',N'Đây là ghi chú của đơn hàng 46',705000,N'Đây là địa chỉ giao hàng của đơn số 46','0389421247','USER04', 1,0,0),

('DH.USER02.20221221431604',N'Đây là ghi chú của đơn hàng 47',335000,N'Đây là địa chỉ giao hàng của đơn số 47','0383247151','USER013', 1,1,0),

('DH.USER07.20221221153737',N'Đây là ghi chú của đơn hàng 48',795000,N'Đây là địa chỉ giao hàng của đơn số 48','0389284717','USER06', 0,0,1),

('DH.USER08.20221221477298',N'Đây là ghi chú của đơn hàng 49',950000,N'Đây là địa chỉ giao hàng của đơn số 49','0385083127','USER011', 1,1,1),

('DH.USER017.20221221453825',N'Đây là ghi chú của đơn hàng 50',795000,N'Đây là địa chỉ giao hàng của đơn số 50','0388929019','USER010', 0,1,1)

/*
Tạo  Chi Tiêt hóa đơn
*/

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER020.20221221072850','SP0001',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221074813','SP0001',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221074813','SP000119',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221074813','SP000151',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221074813','SP00065',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221074813','SP000130',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221074813','SP00059',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221074813','SP000199',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221082592','SP0001',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221082592','SP000138',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221082592','SP000209',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221082592','SP000187',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221092542','SP0001',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221092542','SP00058',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221092542','SP00021',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221092542','SP000288',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221092542','SP000257',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221092542','SP000320',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221092542','SP00095',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221092542','SP000253',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221093950','SP0001',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221093950','SP000270',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221093950','SP000128',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221093950','SP000143',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221093950','SP000260',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221093950','SP000282',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221093950','SP000146',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221093950','SP00074',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221093950','SP00093',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221093950','SP000232',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221120685','SP0001',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221120685','SP00035',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221120685','SP000120',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221120685','SP000172',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221120685','SP000292',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221120685','SP00087',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER020.20221221091594','SP0001',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER020.20221221091594','SP0002',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER020.20221221091594','SP00027',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221138944','SP0001',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221138944','SP00094',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221138944','SP00075',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221138944','SP000263',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221138944','SP000171',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221138944','SP000270',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221138944','SP000235',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER010.20221221114986','SP0001',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER010.20221221114986','SP000317',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER010.20221221114986','SP000289',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER010.20221221114986','SP000241',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER010.20221221114986','SP000112',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221085468','SP0001',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221085468','SP000195',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221085468','SP00039',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221085468','SP000271',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221085468','SP000286',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER020.20221221105180','SP0001',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER020.20221221105180','SP00042',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221080000','SP0001',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221080000','SP000108',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221080000','SP000255',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221080000','SP000183',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221080000','SP000116',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221080000','SP000266',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221080000','SP000245',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221082198','SP0001',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221082198','SP000161',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221082198','SP000319',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221082198','SP00030',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221082198','SP00082',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221082198','SP00045',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221082198','SP000102',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221082198','SP000323',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221082198','SP000112',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221168075','SP0001',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221168075','SP000316',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221168075','SP000288',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221168075','SP00088',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221168075','SP000311',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221168075','SP000289',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221168075','SP000242',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221077176','SP0001',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221077176','SP00033',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221077176','SP000215',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221077176','SP000307',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221077176','SP00093',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221077176','SP0002',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221077176','SP000322',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221077176','SP000242',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221077176','SP000222',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221077176','SP000135',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221075985','SP0001',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221075985','SP00020',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221075985','SP000114',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221075985','SP00030',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221075985','SP00044',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221075985','SP000167',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221075985','SP000166',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221075985','SP000119',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221075985','SP000246',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221214786','SP0001',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221214786','SP00016',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221214786','SP00085',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221111542','SP0001',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221111542','SP00068',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221111542','SP000158',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221111542','SP000281',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221111542','SP00062',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221111542','SP000185',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221111542','SP000156',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221111542','SP000301',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER013.20221221145768','SP0001',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER013.20221221145768','SP000186',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER013.20221221145768','SP000113',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER013.20221221145768','SP000172',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER013.20221221145768','SP000320',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER013.20221221145768','SP000254',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER013.20221221145768','SP000141',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER03.20221221124473','SP0001',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER03.20221221124473','SP00035',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER03.20221221124473','SP00024',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER03.20221221124473','SP00046',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER03.20221221124473','SP000302',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER03.20221221124473','SP000156',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221179210','SP0001',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221179210','SP000296',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221179210','SP00054',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221179210','SP00018',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221179210','SP000278',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221179210','SP000165',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER08.20221221172474','SP0001',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER04.20221221282004','SP0001',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER04.20221221282004','SP000213',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221150222','SP0001',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221150222','SP00045',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER05.20221221150222','SP00025',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221246610','SP0001',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221246610','SP000113',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221246610','SP00011',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221246610','SP000260',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221315025','SP0001',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER020.20221221288624','SP0001',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER020.20221221288624','SP00043',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER020.20221221288624','SP00073',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221158278','SP0001',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221158278','SP000219',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221158278','SP00034',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221158278','SP000151',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221158278','SP00018',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221304354','SP0001',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER012.20221221304354','SP00010',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221110202','SP0001',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221110202','SP000267',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221110202','SP000111',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221110202','SP000116',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221110202','SP00054',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221110202','SP000105',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221110202','SP000113',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221110202','SP00056',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221110202','SP000242',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221357130','SP0001',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221357130','SP00028',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221357130','SP000293',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221357130','SP000152',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221357130','SP000112',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221357130','SP000190',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221357130','SP000192',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221117118','SP0001',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221117118','SP00096',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221117118','SP000214',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221117118','SP000227',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221117118','SP000140',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221117118','SP000247',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221173906','SP0001',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221173906','SP000295',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221098755','SP0001',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221098755','SP00056',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221098755','SP000295',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221098755','SP00071',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221098755','SP000278',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221098755','SP000144',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221098755','SP000108',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221084206','SP0001',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER019.20221221084206','SP000126',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221227235','SP0001',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221227235','SP000137',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221227235','SP000279',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221227235','SP00079',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221227235','SP00022',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221227235','SP000218',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221227235','SP00045',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221227235','SP000256',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221227235','SP000235',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221227235','SP000305',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221335686','SP0001',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221335686','SP0009',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221335686','SP000225',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221335686','SP000296',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221352940','SP0001',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221352940','SP000182',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221352940','SP000252',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221352940','SP000160',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221352940','SP00092',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221352940','SP000226',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221352940','SP000262',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221259240','SP0001',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221259240','SP00023',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221293707','SP0001',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221293707','SP00090',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221293707','SP00036',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221293707','SP00075',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221293707','SP000165',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221293707','SP000201',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221293707','SP00091',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER018.20221221293707','SP0006',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221232490','SP0001',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221232490','SP000301',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221232490','SP000197',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221232490','SP000112',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221384819','SP0001',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221384819','SP000320',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221384819','SP00083',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER09.20221221384819','SP00047',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221083938','SP0001',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER014.20221221083938','SP000228',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221136189','SP0001',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221136189','SP000288',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221136189','SP000304',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221136189','SP000211',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221136189','SP00055',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221136189','SP000275',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER016.20221221136189','SP000164',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221213298','SP0001',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER015.20221221213298','SP000101',1,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER01.20221221084955','SP0001',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER02.20221221431604','SP0001',5,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER02.20221221431604','SP000158',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER02.20221221431604','SP000198',6,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER02.20221221431604','SP000129',4,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER02.20221221431604','SP000114',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER02.20221221431604','SP00036',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER02.20221221431604','SP00030',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER02.20221221431604','SP000266',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221153737','SP0001',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER07.20221221153737','SP000141',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER08.20221221477298','SP0001',3,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER08.20221221477298','SP000304',10,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER08.20221221477298','SP00053',2,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER08.20221221477298','SP000321',8,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER08.20221221477298','SP00080',9,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221453825','SP0001',7,0) 

 GO 

INSERT INTO [dbo].[ChiTietHoaDon] VALUES('DH.USER017.20221221453825','SP000121',7,0)

/*
update tongphu
*/

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER020.20221221072850' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER020.20221221072850' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221074813' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221074813' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221074813' and cthd.MaSP='SP000119' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221074813' and  MaSP='SP000119'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221074813' and cthd.MaSP='SP000151' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221074813' and  MaSP='SP000151'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221074813' and cthd.MaSP='SP00065' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221074813' and  MaSP='SP00065'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221074813' and cthd.MaSP='SP000130' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221074813' and  MaSP='SP000130'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221074813' and cthd.MaSP='SP00059' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221074813' and  MaSP='SP00059'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221074813' and cthd.MaSP='SP000199' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221074813' and  MaSP='SP000199'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221082592' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221082592' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221082592' and cthd.MaSP='SP000138' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221082592' and  MaSP='SP000138'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221082592' and cthd.MaSP='SP000209' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221082592' and  MaSP='SP000209'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221082592' and cthd.MaSP='SP000187' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221082592' and  MaSP='SP000187'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221092542' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221092542' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221092542' and cthd.MaSP='SP00058' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221092542' and  MaSP='SP00058'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221092542' and cthd.MaSP='SP00021' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221092542' and  MaSP='SP00021'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221092542' and cthd.MaSP='SP000288' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221092542' and  MaSP='SP000288'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221092542' and cthd.MaSP='SP000257' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221092542' and  MaSP='SP000257'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221092542' and cthd.MaSP='SP000320' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221092542' and  MaSP='SP000320'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221092542' and cthd.MaSP='SP00095' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221092542' and  MaSP='SP00095'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221092542' and cthd.MaSP='SP000253' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221092542' and  MaSP='SP000253'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221093950' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221093950' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221093950' and cthd.MaSP='SP000270' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221093950' and  MaSP='SP000270'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221093950' and cthd.MaSP='SP000128' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221093950' and  MaSP='SP000128'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221093950' and cthd.MaSP='SP000143' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221093950' and  MaSP='SP000143'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221093950' and cthd.MaSP='SP000260' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221093950' and  MaSP='SP000260'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221093950' and cthd.MaSP='SP000282' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221093950' and  MaSP='SP000282'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221093950' and cthd.MaSP='SP000146' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221093950' and  MaSP='SP000146'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221093950' and cthd.MaSP='SP00074' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221093950' and  MaSP='SP00074'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221093950' and cthd.MaSP='SP00093' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221093950' and  MaSP='SP00093'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221093950' and cthd.MaSP='SP000232' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221093950' and  MaSP='SP000232'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221120685' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221120685' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221120685' and cthd.MaSP='SP00035' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221120685' and  MaSP='SP00035'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221120685' and cthd.MaSP='SP000120' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221120685' and  MaSP='SP000120'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221120685' and cthd.MaSP='SP000172' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221120685' and  MaSP='SP000172'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221120685' and cthd.MaSP='SP000292' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221120685' and  MaSP='SP000292'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221120685' and cthd.MaSP='SP00087' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221120685' and  MaSP='SP00087'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER020.20221221091594' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER020.20221221091594' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER020.20221221091594' and cthd.MaSP='SP0002' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER020.20221221091594' and  MaSP='SP0002'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER020.20221221091594' and cthd.MaSP='SP00027' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER020.20221221091594' and  MaSP='SP00027'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221138944' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221138944' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221138944' and cthd.MaSP='SP00094' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221138944' and  MaSP='SP00094'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221138944' and cthd.MaSP='SP00075' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221138944' and  MaSP='SP00075'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221138944' and cthd.MaSP='SP000263' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221138944' and  MaSP='SP000263'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221138944' and cthd.MaSP='SP000171' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221138944' and  MaSP='SP000171'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221138944' and cthd.MaSP='SP000270' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221138944' and  MaSP='SP000270'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221138944' and cthd.MaSP='SP000235' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221138944' and  MaSP='SP000235'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER010.20221221114986' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER010.20221221114986' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER010.20221221114986' and cthd.MaSP='SP000317' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER010.20221221114986' and  MaSP='SP000317'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER010.20221221114986' and cthd.MaSP='SP000289' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER010.20221221114986' and  MaSP='SP000289'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER010.20221221114986' and cthd.MaSP='SP000241' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER010.20221221114986' and  MaSP='SP000241'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER010.20221221114986' and cthd.MaSP='SP000112' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER010.20221221114986' and  MaSP='SP000112'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221085468' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221085468' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221085468' and cthd.MaSP='SP000195' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221085468' and  MaSP='SP000195'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221085468' and cthd.MaSP='SP00039' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221085468' and  MaSP='SP00039'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221085468' and cthd.MaSP='SP000271' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221085468' and  MaSP='SP000271'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221085468' and cthd.MaSP='SP000286' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221085468' and  MaSP='SP000286'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER020.20221221105180' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER020.20221221105180' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER020.20221221105180' and cthd.MaSP='SP00042' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER020.20221221105180' and  MaSP='SP00042'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221080000' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221080000' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221080000' and cthd.MaSP='SP000108' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221080000' and  MaSP='SP000108'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221080000' and cthd.MaSP='SP000255' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221080000' and  MaSP='SP000255'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221080000' and cthd.MaSP='SP000183' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221080000' and  MaSP='SP000183'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221080000' and cthd.MaSP='SP000116' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221080000' and  MaSP='SP000116'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221080000' and cthd.MaSP='SP000266' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221080000' and  MaSP='SP000266'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221080000' and cthd.MaSP='SP000245' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221080000' and  MaSP='SP000245'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221082198' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221082198' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221082198' and cthd.MaSP='SP000161' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221082198' and  MaSP='SP000161'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221082198' and cthd.MaSP='SP000319' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221082198' and  MaSP='SP000319'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221082198' and cthd.MaSP='SP00030' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221082198' and  MaSP='SP00030'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221082198' and cthd.MaSP='SP00082' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221082198' and  MaSP='SP00082'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221082198' and cthd.MaSP='SP00045' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221082198' and  MaSP='SP00045'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221082198' and cthd.MaSP='SP000102' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221082198' and  MaSP='SP000102'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221082198' and cthd.MaSP='SP000323' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221082198' and  MaSP='SP000323'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221082198' and cthd.MaSP='SP000112' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221082198' and  MaSP='SP000112'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221168075' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221168075' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221168075' and cthd.MaSP='SP000316' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221168075' and  MaSP='SP000316'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221168075' and cthd.MaSP='SP000288' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221168075' and  MaSP='SP000288'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221168075' and cthd.MaSP='SP00088' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221168075' and  MaSP='SP00088'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221168075' and cthd.MaSP='SP000311' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221168075' and  MaSP='SP000311'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221168075' and cthd.MaSP='SP000289' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221168075' and  MaSP='SP000289'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221168075' and cthd.MaSP='SP000242' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221168075' and  MaSP='SP000242'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221077176' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221077176' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221077176' and cthd.MaSP='SP00033' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221077176' and  MaSP='SP00033'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221077176' and cthd.MaSP='SP000215' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221077176' and  MaSP='SP000215'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221077176' and cthd.MaSP='SP000307' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221077176' and  MaSP='SP000307'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221077176' and cthd.MaSP='SP00093' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221077176' and  MaSP='SP00093'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221077176' and cthd.MaSP='SP0002' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221077176' and  MaSP='SP0002'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221077176' and cthd.MaSP='SP000322' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221077176' and  MaSP='SP000322'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221077176' and cthd.MaSP='SP000242' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221077176' and  MaSP='SP000242'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221077176' and cthd.MaSP='SP000222' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221077176' and  MaSP='SP000222'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221077176' and cthd.MaSP='SP000135' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221077176' and  MaSP='SP000135'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221075985' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221075985' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221075985' and cthd.MaSP='SP00020' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221075985' and  MaSP='SP00020'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221075985' and cthd.MaSP='SP000114' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221075985' and  MaSP='SP000114'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221075985' and cthd.MaSP='SP00030' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221075985' and  MaSP='SP00030'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221075985' and cthd.MaSP='SP00044' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221075985' and  MaSP='SP00044'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221075985' and cthd.MaSP='SP000167' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221075985' and  MaSP='SP000167'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221075985' and cthd.MaSP='SP000166' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221075985' and  MaSP='SP000166'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221075985' and cthd.MaSP='SP000119' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221075985' and  MaSP='SP000119'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221075985' and cthd.MaSP='SP000246' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221075985' and  MaSP='SP000246'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221214786' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221214786' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221214786' and cthd.MaSP='SP00016' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221214786' and  MaSP='SP00016'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221214786' and cthd.MaSP='SP00085' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221214786' and  MaSP='SP00085'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221111542' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221111542' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221111542' and cthd.MaSP='SP00068' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221111542' and  MaSP='SP00068'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221111542' and cthd.MaSP='SP000158' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221111542' and  MaSP='SP000158'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221111542' and cthd.MaSP='SP000281' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221111542' and  MaSP='SP000281'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221111542' and cthd.MaSP='SP00062' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221111542' and  MaSP='SP00062'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221111542' and cthd.MaSP='SP000185' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221111542' and  MaSP='SP000185'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221111542' and cthd.MaSP='SP000156' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221111542' and  MaSP='SP000156'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221111542' and cthd.MaSP='SP000301' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221111542' and  MaSP='SP000301'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER013.20221221145768' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER013.20221221145768' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER013.20221221145768' and cthd.MaSP='SP000186' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER013.20221221145768' and  MaSP='SP000186'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER013.20221221145768' and cthd.MaSP='SP000113' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER013.20221221145768' and  MaSP='SP000113'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER013.20221221145768' and cthd.MaSP='SP000172' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER013.20221221145768' and  MaSP='SP000172'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER013.20221221145768' and cthd.MaSP='SP000320' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER013.20221221145768' and  MaSP='SP000320'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER013.20221221145768' and cthd.MaSP='SP000254' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER013.20221221145768' and  MaSP='SP000254'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER013.20221221145768' and cthd.MaSP='SP000141' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER013.20221221145768' and  MaSP='SP000141'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER03.20221221124473' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER03.20221221124473' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER03.20221221124473' and cthd.MaSP='SP00035' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER03.20221221124473' and  MaSP='SP00035'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER03.20221221124473' and cthd.MaSP='SP00024' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER03.20221221124473' and  MaSP='SP00024'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER03.20221221124473' and cthd.MaSP='SP00046' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER03.20221221124473' and  MaSP='SP00046'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER03.20221221124473' and cthd.MaSP='SP000302' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER03.20221221124473' and  MaSP='SP000302'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER03.20221221124473' and cthd.MaSP='SP000156' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER03.20221221124473' and  MaSP='SP000156'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221179210' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221179210' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221179210' and cthd.MaSP='SP000296' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221179210' and  MaSP='SP000296'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221179210' and cthd.MaSP='SP00054' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221179210' and  MaSP='SP00054'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221179210' and cthd.MaSP='SP00018' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221179210' and  MaSP='SP00018'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221179210' and cthd.MaSP='SP000278' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221179210' and  MaSP='SP000278'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221179210' and cthd.MaSP='SP000165' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221179210' and  MaSP='SP000165'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER08.20221221172474' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER08.20221221172474' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER04.20221221282004' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER04.20221221282004' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER04.20221221282004' and cthd.MaSP='SP000213' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER04.20221221282004' and  MaSP='SP000213'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221150222' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221150222' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221150222' and cthd.MaSP='SP00045' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221150222' and  MaSP='SP00045'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER05.20221221150222' and cthd.MaSP='SP00025' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER05.20221221150222' and  MaSP='SP00025'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221246610' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221246610' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221246610' and cthd.MaSP='SP000113' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221246610' and  MaSP='SP000113'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221246610' and cthd.MaSP='SP00011' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221246610' and  MaSP='SP00011'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221246610' and cthd.MaSP='SP000260' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221246610' and  MaSP='SP000260'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221315025' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221315025' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER020.20221221288624' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER020.20221221288624' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER020.20221221288624' and cthd.MaSP='SP00043' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER020.20221221288624' and  MaSP='SP00043'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER020.20221221288624' and cthd.MaSP='SP00073' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER020.20221221288624' and  MaSP='SP00073'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221158278' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221158278' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221158278' and cthd.MaSP='SP000219' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221158278' and  MaSP='SP000219'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221158278' and cthd.MaSP='SP00034' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221158278' and  MaSP='SP00034'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221158278' and cthd.MaSP='SP000151' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221158278' and  MaSP='SP000151'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221158278' and cthd.MaSP='SP00018' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221158278' and  MaSP='SP00018'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221304354' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221304354' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER012.20221221304354' and cthd.MaSP='SP00010' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER012.20221221304354' and  MaSP='SP00010'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221110202' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221110202' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221110202' and cthd.MaSP='SP000267' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221110202' and  MaSP='SP000267'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221110202' and cthd.MaSP='SP000111' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221110202' and  MaSP='SP000111'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221110202' and cthd.MaSP='SP000116' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221110202' and  MaSP='SP000116'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221110202' and cthd.MaSP='SP00054' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221110202' and  MaSP='SP00054'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221110202' and cthd.MaSP='SP000105' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221110202' and  MaSP='SP000105'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221110202' and cthd.MaSP='SP000113' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221110202' and  MaSP='SP000113'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221110202' and cthd.MaSP='SP00056' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221110202' and  MaSP='SP00056'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221110202' and cthd.MaSP='SP000242' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221110202' and  MaSP='SP000242'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221357130' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221357130' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221357130' and cthd.MaSP='SP00028' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221357130' and  MaSP='SP00028'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221357130' and cthd.MaSP='SP000293' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221357130' and  MaSP='SP000293'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221357130' and cthd.MaSP='SP000152' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221357130' and  MaSP='SP000152'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221357130' and cthd.MaSP='SP000112' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221357130' and  MaSP='SP000112'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221357130' and cthd.MaSP='SP000190' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221357130' and  MaSP='SP000190'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221357130' and cthd.MaSP='SP000192' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221357130' and  MaSP='SP000192'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221117118' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221117118' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221117118' and cthd.MaSP='SP00096' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221117118' and  MaSP='SP00096'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221117118' and cthd.MaSP='SP000214' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221117118' and  MaSP='SP000214'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221117118' and cthd.MaSP='SP000227' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221117118' and  MaSP='SP000227'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221117118' and cthd.MaSP='SP000140' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221117118' and  MaSP='SP000140'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221117118' and cthd.MaSP='SP000247' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221117118' and  MaSP='SP000247'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221173906' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221173906' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221173906' and cthd.MaSP='SP000295' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221173906' and  MaSP='SP000295'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221098755' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221098755' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221098755' and cthd.MaSP='SP00056' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221098755' and  MaSP='SP00056'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221098755' and cthd.MaSP='SP000295' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221098755' and  MaSP='SP000295'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221098755' and cthd.MaSP='SP00071' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221098755' and  MaSP='SP00071'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221098755' and cthd.MaSP='SP000278' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221098755' and  MaSP='SP000278'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221098755' and cthd.MaSP='SP000144' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221098755' and  MaSP='SP000144'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221098755' and cthd.MaSP='SP000108' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221098755' and  MaSP='SP000108'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221084206' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221084206' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER019.20221221084206' and cthd.MaSP='SP000126' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER019.20221221084206' and  MaSP='SP000126'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221227235' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221227235' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221227235' and cthd.MaSP='SP000137' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221227235' and  MaSP='SP000137'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221227235' and cthd.MaSP='SP000279' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221227235' and  MaSP='SP000279'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221227235' and cthd.MaSP='SP00079' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221227235' and  MaSP='SP00079'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221227235' and cthd.MaSP='SP00022' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221227235' and  MaSP='SP00022'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221227235' and cthd.MaSP='SP000218' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221227235' and  MaSP='SP000218'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221227235' and cthd.MaSP='SP00045' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221227235' and  MaSP='SP00045'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221227235' and cthd.MaSP='SP000256' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221227235' and  MaSP='SP000256'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221227235' and cthd.MaSP='SP000235' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221227235' and  MaSP='SP000235'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221227235' and cthd.MaSP='SP000305' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221227235' and  MaSP='SP000305'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221335686' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221335686' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221335686' and cthd.MaSP='SP0009' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221335686' and  MaSP='SP0009'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221335686' and cthd.MaSP='SP000225' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221335686' and  MaSP='SP000225'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221335686' and cthd.MaSP='SP000296' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221335686' and  MaSP='SP000296'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221352940' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221352940' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221352940' and cthd.MaSP='SP000182' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221352940' and  MaSP='SP000182'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221352940' and cthd.MaSP='SP000252' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221352940' and  MaSP='SP000252'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221352940' and cthd.MaSP='SP000160' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221352940' and  MaSP='SP000160'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221352940' and cthd.MaSP='SP00092' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221352940' and  MaSP='SP00092'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221352940' and cthd.MaSP='SP000226' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221352940' and  MaSP='SP000226'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221352940' and cthd.MaSP='SP000262' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221352940' and  MaSP='SP000262'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221259240' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221259240' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221259240' and cthd.MaSP='SP00023' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221259240' and  MaSP='SP00023'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221293707' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221293707' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221293707' and cthd.MaSP='SP00090' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221293707' and  MaSP='SP00090'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221293707' and cthd.MaSP='SP00036' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221293707' and  MaSP='SP00036'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221293707' and cthd.MaSP='SP00075' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221293707' and  MaSP='SP00075'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221293707' and cthd.MaSP='SP000165' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221293707' and  MaSP='SP000165'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221293707' and cthd.MaSP='SP000201' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221293707' and  MaSP='SP000201'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221293707' and cthd.MaSP='SP00091' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221293707' and  MaSP='SP00091'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER018.20221221293707' and cthd.MaSP='SP0006' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER018.20221221293707' and  MaSP='SP0006'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221232490' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221232490' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221232490' and cthd.MaSP='SP000301' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221232490' and  MaSP='SP000301'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221232490' and cthd.MaSP='SP000197' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221232490' and  MaSP='SP000197'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221232490' and cthd.MaSP='SP000112' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221232490' and  MaSP='SP000112'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221384819' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221384819' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221384819' and cthd.MaSP='SP000320' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221384819' and  MaSP='SP000320'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221384819' and cthd.MaSP='SP00083' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221384819' and  MaSP='SP00083'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER09.20221221384819' and cthd.MaSP='SP00047' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER09.20221221384819' and  MaSP='SP00047'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221083938' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221083938' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER014.20221221083938' and cthd.MaSP='SP000228' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER014.20221221083938' and  MaSP='SP000228'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221136189' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221136189' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221136189' and cthd.MaSP='SP000288' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221136189' and  MaSP='SP000288'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221136189' and cthd.MaSP='SP000304' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221136189' and  MaSP='SP000304'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221136189' and cthd.MaSP='SP000211' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221136189' and  MaSP='SP000211'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221136189' and cthd.MaSP='SP00055' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221136189' and  MaSP='SP00055'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221136189' and cthd.MaSP='SP000275' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221136189' and  MaSP='SP000275'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER016.20221221136189' and cthd.MaSP='SP000164' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER016.20221221136189' and  MaSP='SP000164'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221213298' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221213298' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER015.20221221213298' and cthd.MaSP='SP000101' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER015.20221221213298' and  MaSP='SP000101'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER01.20221221084955' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER01.20221221084955' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER02.20221221431604' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER02.20221221431604' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER02.20221221431604' and cthd.MaSP='SP000158' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER02.20221221431604' and  MaSP='SP000158'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER02.20221221431604' and cthd.MaSP='SP000198' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER02.20221221431604' and  MaSP='SP000198'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER02.20221221431604' and cthd.MaSP='SP000129' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER02.20221221431604' and  MaSP='SP000129'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER02.20221221431604' and cthd.MaSP='SP000114' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER02.20221221431604' and  MaSP='SP000114'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER02.20221221431604' and cthd.MaSP='SP00036' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER02.20221221431604' and  MaSP='SP00036'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER02.20221221431604' and cthd.MaSP='SP00030' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER02.20221221431604' and  MaSP='SP00030'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER02.20221221431604' and cthd.MaSP='SP000266' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER02.20221221431604' and  MaSP='SP000266'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221153737' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221153737' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER07.20221221153737' and cthd.MaSP='SP000141' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER07.20221221153737' and  MaSP='SP000141'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER08.20221221477298' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER08.20221221477298' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER08.20221221477298' and cthd.MaSP='SP000304' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER08.20221221477298' and  MaSP='SP000304'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER08.20221221477298' and cthd.MaSP='SP00053' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER08.20221221477298' and  MaSP='SP00053'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER08.20221221477298' and cthd.MaSP='SP000321' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER08.20221221477298' and  MaSP='SP000321'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER08.20221221477298' and cthd.MaSP='SP00080' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER08.20221221477298' and  MaSP='SP00080'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221453825' and cthd.MaSP='SP0001' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221453825' and  MaSP='SP0001'

 GO 

update ChiTietHoaDon set TongPhu = (select cthd.SoLuong * sp.Gia from ChiTietHoaDon cthd, SanPham sp where cthd.MaHoaDon='DH.USER017.20221221453825' and cthd.MaSP='SP000121' and cthd.MaSP=sp.MaSP ) where MaHoaDon='DH.USER017.20221221453825' and  MaSP='SP000121'

 GO 

/*
update tttongthanhtoan
*/

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER020.20221221072850') where MaHoaDon='DH.USER020.20221221072850'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER016.20221221074813') where MaHoaDon='DH.USER016.20221221074813'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER01.20221221082592') where MaHoaDon='DH.USER01.20221221082592'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER01.20221221092542') where MaHoaDon='DH.USER01.20221221092542'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER017.20221221093950') where MaHoaDon='DH.USER017.20221221093950'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER012.20221221120685') where MaHoaDon='DH.USER012.20221221120685'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER020.20221221091594') where MaHoaDon='DH.USER020.20221221091594'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER012.20221221138944') where MaHoaDon='DH.USER012.20221221138944'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER010.20221221114986') where MaHoaDon='DH.USER010.20221221114986'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER015.20221221085468') where MaHoaDon='DH.USER015.20221221085468'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER020.20221221105180') where MaHoaDon='DH.USER020.20221221105180'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER016.20221221080000') where MaHoaDon='DH.USER016.20221221080000'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER05.20221221082198') where MaHoaDon='DH.USER05.20221221082198'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER01.20221221168075') where MaHoaDon='DH.USER01.20221221168075'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER09.20221221077176') where MaHoaDon='DH.USER09.20221221077176'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER09.20221221075985') where MaHoaDon='DH.USER09.20221221075985'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER018.20221221214786') where MaHoaDon='DH.USER018.20221221214786'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER01.20221221111542') where MaHoaDon='DH.USER01.20221221111542'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER013.20221221145768') where MaHoaDon='DH.USER013.20221221145768'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER03.20221221124473') where MaHoaDon='DH.USER03.20221221124473'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER019.20221221179210') where MaHoaDon='DH.USER019.20221221179210'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER08.20221221172474') where MaHoaDon='DH.USER08.20221221172474'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER04.20221221282004') where MaHoaDon='DH.USER04.20221221282004'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER05.20221221150222') where MaHoaDon='DH.USER05.20221221150222'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER01.20221221246610') where MaHoaDon='DH.USER01.20221221246610'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER012.20221221315025') where MaHoaDon='DH.USER012.20221221315025'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER020.20221221288624') where MaHoaDon='DH.USER020.20221221288624'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER09.20221221158278') where MaHoaDon='DH.USER09.20221221158278'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER012.20221221304354') where MaHoaDon='DH.USER012.20221221304354'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER019.20221221110202') where MaHoaDon='DH.USER019.20221221110202'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER09.20221221357130') where MaHoaDon='DH.USER09.20221221357130'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER014.20221221117118') where MaHoaDon='DH.USER014.20221221117118'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER07.20221221173906') where MaHoaDon='DH.USER07.20221221173906'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER07.20221221098755') where MaHoaDon='DH.USER07.20221221098755'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER019.20221221084206') where MaHoaDon='DH.USER019.20221221084206'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER018.20221221227235') where MaHoaDon='DH.USER018.20221221227235'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER014.20221221335686') where MaHoaDon='DH.USER014.20221221335686'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER01.20221221352940') where MaHoaDon='DH.USER01.20221221352940'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER014.20221221259240') where MaHoaDon='DH.USER014.20221221259240'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER018.20221221293707') where MaHoaDon='DH.USER018.20221221293707'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER015.20221221232490') where MaHoaDon='DH.USER015.20221221232490'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER09.20221221384819') where MaHoaDon='DH.USER09.20221221384819'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER014.20221221083938') where MaHoaDon='DH.USER014.20221221083938'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER016.20221221136189') where MaHoaDon='DH.USER016.20221221136189'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER015.20221221213298') where MaHoaDon='DH.USER015.20221221213298'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER01.20221221084955') where MaHoaDon='DH.USER01.20221221084955'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER02.20221221431604') where MaHoaDon='DH.USER02.20221221431604'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER07.20221221153737') where MaHoaDon='DH.USER07.20221221153737'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER08.20221221477298') where MaHoaDon='DH.USER08.20221221477298'

 GO 

update HoaDon set TongThanhToan=(select sum(tongphu) from ChiTietHoaDon where MaHoaDon='DH.USER017.20221221453825') where MaHoaDon='DH.USER017.20221221453825'

 GO 



