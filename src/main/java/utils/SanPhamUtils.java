package utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.SanPham;
public class SanPhamUtils 
{
    public static List<SanPham> getListSanPham(Connection conn) throws SQLException 
    {
        String sqlString = "Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham from SanPham sp LEFT JOIN  LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP ORDER BY sp.MaSP";
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
    public static SanPham GetSanPhamById(Connection conn, String maSP) throws SQLException
    {
        String sqlString = "Select sp.MaSP, sp.TenSP, sp.Gia, sp.ChiTiet, sp.Hinh,sp.MaLoaiSP, lsp.TenLoaiSanPham from SanPham sp LEFT JOIN  LoaiSanPham lsp on sp.MaLoaiSP=lsp.MaLoaiSP where sp.MaSP=? ORDER BY sp.MaSP";
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
            return sanPham;
        }
        return null;
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
        String sqlString = "DELETE FROM SanPham WHERE MaSP=?";
        PreparedStatement stmt= conn.prepareStatement(sqlString);
        stmt.setString(1, sanPham);
        stmt.executeUpdate();
    }

}
