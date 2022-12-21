DELETE NguoiDung;

DELETE ROLE;

DELETE LoaiSanPham;



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



INSERT INTO [dbo].[NguoiDung]

( -- Columns to insert data into

 [MaNguoiDung], [TenDangNhap],[HoTen], [MatKhau],[RoleID]

)

VALUES

( -- First row: values for the columns in the list above

 'test_user','ngocphat',N'Bồ Bé Mèo','ngocphat','001'

)



-- Add more rows here

GO

update NguoiDung set  HoTen=N'Bồ Bé Mèo'  where MaNguoiDung='test_user';

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

INSERT INTO [dbo].[LoaiSanPham]

( -- Columns to insert data into

 [MaLoaiSP], [TenLoaiSanPham]

)

VALUES

( -- First row: values for the columns in the list above

    'test_lsp01','LoaiSanPham01'

),

( -- Second row: values for the columns in the list above

    'test_lsp02','LoaiSanPham02'

),

(

    'test_lsp03','LoaiSanPham03'

)

-- Add more rows here

GO



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