package utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.SanPham;
import beans.commonBeans;
public class SanPhamUtils 
{
    public static List<SanPham> getListSanPham(Connection conn) throws SQLException 
    {
        String sqlString = "Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham, sp.DaXoa from SanPham sp LEFT JOIN  LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP  ORDER BY sp.MaSP";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        ResultSet rs= stmt.executeQuery();
        List<SanPham> sanPhamList=new ArrayList<>();
        while(rs.next())
        {
            SanPham sanPham= new SanPham();
            sanPham.setMaSP(rs.getString("MaSP"));
            sanPham.setTenSP(rs.getString("TenSP"));
            sanPham.setGia(rs.getInt("Gia"));
            sanPham.setChiTiet(rs.getString("ChiTiet"));
            sanPham.setHinh(rs.getString("Hinh"));
            sanPham.setMaLoaiSP(rs.getString("MaLoaiSP"));
            sanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
            sanPham.setDaXoa(rs.getBoolean("DaXoa"));
            sanPhamList.add(sanPham);
        }   
        return sanPhamList;
    }
    public static List<SanPham> getSanPhamListByDeletedStatus(Connection conn, boolean status) throws SQLException
    {
        String sqlString = "Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham, sp.DaXoa from SanPham sp LEFT JOIN  LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP where sp.DaXoa=?  ORDER BY sp.MaSP";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        stmt.setBoolean(1,status);
        ResultSet rs= stmt.executeQuery();
        List<SanPham> sanPhamList=new ArrayList<>();
        while(rs.next())
        {
            SanPham sanPham= new SanPham();
            sanPham.setMaSP(rs.getString("MaSP"));
            sanPham.setTenSP(rs.getString("TenSP"));
            sanPham.setGia(rs.getInt("Gia"));
            sanPham.setChiTiet(rs.getString("ChiTiet"));
            sanPham.setHinh(rs.getString("Hinh"));
            sanPham.setMaLoaiSP(rs.getString("MaLoaiSP"));
            sanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
            sanPham.setDaXoa(rs.getBoolean("DaXoa"));
            sanPhamList.add(sanPham);
        }   
        return sanPhamList;
    }

    public static List<SanPham> getListSanPhamBySearch(Connection conn,String text) throws SQLException 
    {
    	String sqlString = "Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham from SanPham sp \r\n"
    			+ "inner join LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP \r\n"
    			+ "and sp.MaSP LIKE ?\r\n"
    			+ "ORDER BY sp.MaSP";
    	 PreparedStatement stmt = conn.prepareStatement("Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham from SanPham sp \r\n"
     			+ "inner join LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP \r\n"
     			+ "and sp.MaSP LIKE '%"+text+"%' or sp.TenSP LIKE N'%"+text+"%' or lsp.TenLoaiSanPham LIKE N'%"+text+"%'"
     			+ "ORDER BY sp.MaSP");
    	
         ResultSet rs= stmt.executeQuery();
         List<SanPham> sanPhamList=new ArrayList<>();
         System.out.print(sqlString);
         while(rs.next())
         {
             SanPham sanPham= new SanPham();
             sanPham.setMaSP(rs.getString("MaSP"));
             sanPham.setTenSP(rs.getString("TenSP"));
             sanPham.setGia(rs.getInt("Gia"));
             sanPham.setChiTiet(rs.getString("ChiTiet"));
             sanPham.setHinh(rs.getString("Hinh"));
             sanPham.setMaLoaiSP(rs.getString("MaLoaiSP"));
             sanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
             sanPhamList.add(sanPham);
         }   
         return sanPhamList;
    }
    public static List<SanPham> getListSanPhamByMaLSPandDataInput(Connection conn, String maLSP, String input) throws SQLException
    {
        PreparedStatement stmt = conn.prepareStatement("Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham from SanPham sp LEFT JOIN  LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP where sp.DaXoa=0 and sp.MaLoaiSP like ?  and sp.tenSP like ? ORDER BY sp.MaSP");
        stmt.setString(1, maLSP);
        stmt.setString(2, input);
        ResultSet rs= stmt.executeQuery();
        List<SanPham> sanPhamList=new ArrayList<>();
        while(rs.next())
        {
            SanPham sanPham= new SanPham();
            sanPham.setMaSP(rs.getString("MaSP"));
            sanPham.setTenSP(rs.getString("TenSP"));
            sanPham.setGia(rs.getInt("Gia"));
            sanPham.setChiTiet(rs.getString("ChiTiet"));
            sanPham.setHinh(rs.getString("Hinh"));
            sanPham.setMaLoaiSP(rs.getString("MaLoaiSP"));
            sanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
            sanPhamList.add(sanPham);
        }   
        return sanPhamList;
        
        
    }
    public static List<SanPham> getBestSeller( Connection conn, int numbers) throws SQLException
    {
        String sqlString="select  sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham, tk.SALEQTY from SanPham as sp,LoaiSanPham lsp, (SELECT TOP (?)  sp.MaSP, SUM(cthd.SoLuong) SALEQTY  FROM SanPham AS sp INNER JOIN ChiTietHoaDon AS cthd  ON sp.MaSP = cthd.MaSP GROUP BY sp.MaSP) as tk where sp.DaXoa=0 and sp.maSP=tk.MaSP and sp.MaLoaiSP=lsp.MaLoaiSP order by tk.SALEQTY DESC";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        stmt.setInt(1,numbers);
        ResultSet rs= stmt.executeQuery();
        List<SanPham> sanPhamList=new ArrayList<>();
        while(rs.next())
        {
            SanPham sanPham= new SanPham();
            sanPham.setMaSP(rs.getString("MaSP"));
            sanPham.setTenSP(rs.getString("TenSP"));
            sanPham.setGia(rs.getInt("Gia"));
            sanPham.setChiTiet(rs.getString("ChiTiet"));
            sanPham.setHinh(rs.getString("Hinh"));
            sanPham.setMaLoaiSP(rs.getString("MaLoaiSP"));
            sanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
            sanPhamList.add(sanPham);
        }   
        return sanPhamList;
            
    }
    
    public static List<SanPham> getBestSellerByLSP( Connection conn, int numbers, String lsp) throws SQLException
    {
        String sqlString="select  sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham, tk.SALEQTY from SanPham as sp,LoaiSanPham lsp, (SELECT TOP (?)  sp.MaSP, SUM(cthd.SoLuong) SALEQTY  FROM SanPham AS sp INNER JOIN ChiTietHoaDon AS cthd  ON sp.MaSP = cthd.MaSP GROUP BY sp.MaSP) as tk where sp.DaXoa=0 and sp.maSP=tk.MaSP and sp.MaLoaiSP=lsp.MaLoaiSP and lsp.MaLoaiSP like ? order by tk.SALEQTY DESC";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        stmt.setInt(1,numbers);
        stmt.setString(2, lsp);
        ResultSet rs= stmt.executeQuery();
        List<SanPham> sanPhamList=new ArrayList<>();
        while(rs.next())
        {
            SanPham sanPham= new SanPham();
            sanPham.setMaSP(rs.getString("MaSP"));
            sanPham.setTenSP(rs.getString("TenSP"));
            sanPham.setGia(rs.getInt("Gia"));
            sanPham.setChiTiet(rs.getString("ChiTiet"));
            sanPham.setHinh(rs.getString("Hinh"));
            sanPham.setMaLoaiSP(rs.getString("MaLoaiSP"));
            sanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
            sanPhamList.add(sanPham);
        }   
        return sanPhamList;
            
    }
    public static List<SanPham> getListSanPhamWithoutMaLSP(Connection conn) throws SQLException 
    {
        String sqlString = "Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh, sp.TenLoaiSanPham from SanPham sp ";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        ResultSet rs= stmt.executeQuery();
        List<SanPham> sanPhamList=new ArrayList<>();
        while(rs.next())
        {
            SanPham sanPham= new SanPham();
            sanPham.setMaSP(rs.getString("MaSP"));
            sanPham.setTenSP(rs.getString("TenSP"));
            sanPham.setGia(rs.getInt("Gia"));
            sanPham.setChiTiet(rs.getString("ChiTiet"));
            sanPham.setHinh(rs.getString("Hinh"));
            sanPham.setMaLoaiSP(rs.getString("TenLoaiSanPham"));
            sanPhamList.add(sanPham);
        }   
        return sanPhamList;
    }
    public static List<SanPham> getListSanPhamRelated(Connection conn, SanPham sp, int numbers) throws SQLException
    {
        String sqlString = "Select TOP (?) sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham from SanPham sp LEFT JOIN  LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP where sp.DaXoa=0 and sp.MaLoaiSP=? and sp.MaSP!=? ORDER BY sp.MaSP";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        stmt.setInt(1, numbers);
        stmt.setString(2,sp.getMaLoaiSP());
        stmt.setString(3, sp.getMaSP());
        ResultSet rs= stmt.executeQuery();
        List<SanPham> sanPhamList=new ArrayList<>();
        while(rs.next())
        {
            SanPham sanPham= new SanPham();
            sanPham.setMaSP(rs.getString("MaSP"));
            sanPham.setTenSP(rs.getString("TenSP"));
            sanPham.setGia(rs.getInt("Gia"));
            sanPham.setChiTiet(rs.getString("ChiTiet"));
            sanPham.setHinh(rs.getString("Hinh"));
            sanPham.setMaLoaiSP(rs.getString("TenLoaiSanPham"));
            sanPhamList.add(sanPham);
        }
        return sanPhamList;
        
    }
    public static SanPham GetSanPhamById(Connection conn, String maSP) throws SQLException
    {
        String sqlString = "Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, sp.DaXoa, lsp.TenLoaiSanPham from SanPham sp LEFT JOIN  LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP where sp.MaSP=? ORDER BY sp.MaSP";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        stmt.setString(1, maSP);
        ResultSet rs= stmt.executeQuery();
        if(rs.next())
        {
            SanPham sanPham= new SanPham();
            sanPham.setMaSP(rs.getString("MaSP"));
            sanPham.setTenSP(rs.getString("TenSP"));
            sanPham.setGia(rs.getInt("Gia"));
            sanPham.setChiTiet(rs.getString("ChiTiet"));
            sanPham.setHinh(rs.getString("Hinh"));
            sanPham.setMaLoaiSP(rs.getString("MaLoaiSP"));
            sanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
            sanPham.setDaXoa(rs.getBoolean("DaXoa"));
            return sanPham;
        }
        return null;
    }
    public static void AddSanPhamToCart(Connection conn, String maSP, int soluong) throws SQLException 
    {
    	String sqlString="exec AddToCart_Proc ?,?,?";
    	PreparedStatement stmt= conn.prepareStatement(sqlString);
    	String userID = commonBeans.mainUser.getMaNguoiDung();
    	stmt.setString(1,userID);
    	stmt.setString(2,maSP);
    	stmt.setInt(3, soluong);
    	stmt.executeUpdate();
    }
    public static void InsertSanPham(Connection conn, SanPham sanPham) throws SQLException 
    {
        String sqlString = "INSERT INTO SanPham (MaSP, TenSP, Gia, ChiTiet, Hinh, MaLoaiSP) VALUES (?,?,?,?,?,?)";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        stmt.setString(1, sanPham.getMaSP());
        stmt.setString(2, sanPham.getTenSP());
        stmt.setInt(3, sanPham.getGia());
        stmt.setString(4, sanPham.getChiTiet());
        stmt.setString(5, sanPham.getHinh());
        stmt.setString(6, sanPham.getMaLoaiSP());
        stmt.executeUpdate();
    }
    public static void UpdateSanPham(Connection conn, SanPham sanPham) throws SQLException
    {
        String sqlString = "UPDATE SanPham SET  TenSP=?, Gia=?, ChiTiet=?, Hinh=?, MaLoaiSP=? WHERE MaSP=?";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        stmt.setString(1, sanPham.getTenSP());
        stmt.setInt(2, sanPham.getGia());
        stmt.setString(3, sanPham.getChiTiet());
        stmt.setString(4, sanPham.getHinh());  
        stmt.setString(5, sanPham.getMaLoaiSP());
        stmt.setString(6, sanPham.getMaSP());
        stmt.executeUpdate();
    }
    public static void DeleteSanPham(Connection conn, String sanPham) throws SQLException
    {
        String sqlString = "UPDATE SanPham set DaXoa=1 WHERE MaSP=?";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        stmt.setString(1, sanPham);
        stmt.executeUpdate();
    }
    public static void unDeleteSanPham(Connection conn, String sanPham) throws SQLException
    {
        String sqlString = "UPDATE SanPham set DaXoa=0 WHERE MaSP=?";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        stmt.setString(1, sanPham);
        stmt.executeUpdate();
    }
    public static int getTongSoSanPham(Connection conn) throws SQLException {
    	PreparedStatement pst = conn.prepareStatement("select count(MaSP) as TongSanPham from SanPham");
    	ResultSet rs = pst.executeQuery();
    	if(rs.next()) return rs.getInt("TongSanPham");
    	return 0;
    }

}
