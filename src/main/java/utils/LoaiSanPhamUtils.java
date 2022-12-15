package utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.LoaiSanPham;


public class LoaiSanPhamUtils 
{
    public static List<LoaiSanPham> getListLoaiSanPham(Connection conn) throws SQLException 
    {
        List<LoaiSanPham> loaiSanPhamList = new ArrayList<LoaiSanPham>();
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        ResultSet rs = null;
        stmt = conn.prepareStatement("SELECT MaLoaiSP, TenLoaiSanPham FROM LoaiSanPham");
        rs = stmt.executeQuery();
        while (rs.next())
        {
            LoaiSanPham loaiSanPham = new LoaiSanPham();
            loaiSanPham.setMaLoaiSP(rs.getString("MaLoaiSP"));
           /*stmt2 = conn.prepareStatement("select count(SanPham.MaSP) as 'SLTrongKho' from SanPham where SanPham.MaLoaiSP = ?");
            stmt2.setString(1, loaiSanPham.getMaLoaiSP());
            ResultSet rs2 = null;
            rs2 = stmt2.executeQuery();
            loaiSanPham.setSLTrongKho(rs2.getInt("SLTrongKho"));*/
            loaiSanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
            loaiSanPhamList.add(loaiSanPham);
        }
        return loaiSanPhamList;
    }
    public static LoaiSanPham getLoaiSanPhamById(Connection connection, String MaLoaiSP) throws SQLException 
    {
        LoaiSanPham loaiSanPham = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        stmt = connection.prepareStatement("SELECT MaLoaiSP, TenLoaiSanPham FROM LoaiSanPham WHERE MaLoaiSP =?");
        stmt.setString(1, MaLoaiSP);
        rs = stmt.executeQuery();
        if (rs.next())
        {
            loaiSanPham = new LoaiSanPham();
            loaiSanPham.setMaLoaiSP(rs.getString("MaLoaiSP"));
            loaiSanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
            return loaiSanPham;
        }
        return null;
    }
    public static void insertLoaiSanPham(Connection connection, LoaiSanPham loaiSanPham) throws SQLException
    {
        PreparedStatement stmt = null;
        stmt = connection.prepareStatement("INSERT INTO LoaiSanPham (MaLoaiSP, TenLoaiSanPham) VALUES (?,?)");
        stmt.setString(1, loaiSanPham.getMaLoaiSP());
        stmt.setString(2, loaiSanPham.getTenLoaiSanPham());
        stmt.executeUpdate();
   

    }
    public static void updateLoaiSanPham(Connection connection, LoaiSanPham loaiSanPham) throws SQLException
    {
        PreparedStatement stmt = null;

        stmt = connection.prepareStatement("UPDATE LoaiSanPham SET TenLoaiSanPham =? WHERE MaLoaiSP =?");
        stmt.setString(1, loaiSanPham.getTenLoaiSanPham());
        stmt.setString(2, loaiSanPham.getMaLoaiSP());
        stmt.executeUpdate();
        

    }
    public static void deleteLoaiSanPham(Connection connection, String MaLoaiSP) throws SQLException
    {
        PreparedStatement stmt = null;
        stmt = connection.prepareStatement("DELETE FROM LoaiSanPham WHERE MaLoaiSP=?");
        stmt.setString(1, MaLoaiSP);
        stmt.executeUpdate();
    }
}

