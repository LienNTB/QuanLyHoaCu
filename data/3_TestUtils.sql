/*
Test getListUser
*/

SELECT MaNguoiDung, TenDangNhap, HoTen, MatKhau, NgaySinh, DiaChi, RoleID FROM NguoiDung



/*
get ListSP
*/

select * from SanPham   



/*
get ListLoaiSP
*/

SELECT MaLoaiSP, TenLoaiSanPham FROM LoaiSanPham

/*
get SanPhamById
*/

Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham from SanPham sp LEFT JOIN  LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP where sp.MaSP='SP0001' ORDER BY sp.MaSP

/*
get SanPhamRelated
*/

Select TOP 4 sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham 

from SanPham sp LEFT JOIN  LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP 

where sp.MaLoaiSP='lsp02' and  sp.MaSP!='SP0001' 

ORDER BY sp.MaSP

/*
get TopSeller
*/

select  sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham, tk.SALEQTY from SanPham as sp,LoaiSanPham lsp,

 (SELECT  sp.MaSP, SUM(cthd.SoLuong) SALEQTY 

        FROM SanPham AS sp INNER JOIN ChiTietHoaDon AS cthd 

          ON sp.MaSP = cthd.MaSP GROUP BY sp.MaSP) as tk

        where sp.maSP=tk.MaSP and sp.MaLoaiSP=lsp.MaLoaiSP 

        order by tk.SALEQTY DESC

/*
get Cart
*/

SELECT hd.MaHoaDon, hd.MaSP, hd.SoLuong, hd.TongPhu,sp.TenSP, sp.Gia  FROM ChiTietHoaDon hd, SanPham sp WHERE hd.MaHoaDon='cart_test_user'  and sp.MaSP=hd.MaSP

/*
get TongThanhToan
*/

select sum(TongPhu) as TongThanhToan from ChiTietHoaDon where MaHoaDon='DH.test_user.001820221216'

select * from SanPham where MaSP like '%%'

Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham from SanPham sp LEFT JOIN  LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP where sp.MaLoaiSP='lsp01' and sp.tenSP like'%X%'  ORDER BY sp.MaSP