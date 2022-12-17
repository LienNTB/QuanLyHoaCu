package utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.ChiTietHoaDon;
import beans.commons;
public class ChiTietHoaDonUtils 
{
    public static List<ChiTietHoaDon> getChiTietHoaDonByIdMaHD(Connection con, String MaHD) throws SQLException 
    {
        List<ChiTietHoaDon> result = new ArrayList<ChiTietHoaDon>();
        PreparedStatement preparedStatement = con.prepareStatement("SELECT hd.MaHoaDon, hd.MaSP, hd.SoLuong, hd.TongPhu,sp.TenSP, sp.Gia  FROM ChiTietHoaDon hd, SanPham sp WHERE hd.MaHoaDon=?  and sp.MaSP=hd.MaSP");
        preparedStatement.setString(1, MaHD);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next())
        {
            ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
            chiTietHoaDon.setMaHoaDon(resultSet.getString("MaHoaDon"));
            chiTietHoaDon.setMaSP(resultSet.getString("MaSP"));
            chiTietHoaDon.setSoLuong(resultSet.getInt("SoLuong"));
            chiTietHoaDon.setTongPhu(resultSet.getFloat("TongPhu"));
            chiTietHoaDon.setTenSP(resultSet.getString("TenSP"));
            chiTietHoaDon.setGia(resultSet.getInt("Gia"));
            result.add(chiTietHoaDon);
        }
        return result;
    }
    public static List<ChiTietHoaDon> getChiTietHoaDonFromCart(Connection con) throws SQLException 
    {
        List<ChiTietHoaDon> result = new ArrayList<ChiTietHoaDon>();
        PreparedStatement preparedStatement = con.prepareStatement("exec getCartList ?");
        String userID = commons.mainUser.getMaNguoiDung();
        preparedStatement.setString(1, userID);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next())
        {
            ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
            chiTietHoaDon.setMaHoaDon(resultSet.getString("MaHoaDon"));
            chiTietHoaDon.setMaSP(resultSet.getString("MaSP"));
            chiTietHoaDon.setSoLuong(resultSet.getInt("SoLuong"));
            chiTietHoaDon.setTongPhu(resultSet.getFloat("TongPhu"));
            chiTietHoaDon.setTenSP(resultSet.getString("tenSP"));
            chiTietHoaDon.setGia(resultSet.getInt("Gia"));
            chiTietHoaDon.setHinh(resultSet.getString("Hinh"));
            chiTietHoaDon.setLoaiSP(resultSet.getString("loaiSP"));
            result.add(chiTietHoaDon);
        }
        return result;
    }
    public static ChiTietHoaDon getChiTietHoaDonByMaHDMaSP(Connection conn, String maHD, String maSP) throws SQLException
    {
        String sqlString = "SELECT hd.MaHoaDon, hd.MaSP, hd.SoLuong, hd.TongPhu,sp.TenSP, sp.Gia  FROM ChiTietHoaDon hd, SanPham sp where hd.MaHoaDon=? and hd.MaSP=? and sp.MaSP=hd.MaSP";
        PreparedStatement preparedStatement = conn.prepareStatement(sqlString);
        preparedStatement.setString(1, maHD);
        preparedStatement.setString(2, maSP);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.next())
        {
            ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
            chiTietHoaDon.setMaHoaDon(resultSet.getString("MaHoaDon"));
            chiTietHoaDon.setMaSP(resultSet.getString("MaSP"));
            chiTietHoaDon.setSoLuong(resultSet.getInt("SoLuong"));
            chiTietHoaDon.setTongPhu(resultSet.getFloat("TongPhu"));
            chiTietHoaDon.setTenSP(resultSet.getString("TenSP"));
            chiTietHoaDon.setGia(resultSet.getInt("Gia"));
            return chiTietHoaDon;
        }
        return null;
        
    }
    
    public static void insertChiTietHoaDon(Connection conn, ChiTietHoaDon cthd) throws SQLException
    {
        PreparedStatement ps =conn.prepareStatement("INSERT INTO ChiTietHoaDon VALUES (?,?,?,?)");
        ps.setString(1, cthd.getMaHoaDon());
        ps.setString(2, cthd.getMaSP());
        ps.setInt(3, cthd.getSoLuong());
        ps.setFloat(4, cthd.getTongPhu());
        ps.executeUpdate();
    }
    public static void updateChiTietHoaDon(Connection conn, ChiTietHoaDon cthd) throws SQLException{
        PreparedStatement ps = conn.prepareStatement("UPDATE ChiTietHoaDon SET MaHoaDon=?, MaSP=?, SoLuong=?, TongPhu=? WHERE MaHoaDon=? and MaSP=?");
        ps.setString(1, cthd.getMaHoaDon());
        ps.setString(2, cthd.getMaSP());
        ps.setInt(3, cthd.getSoLuong());
        ps.setFloat(4, cthd.getTongPhu());
        ps.setString(5, cthd.getMaHoaDon());
        ps.setString(6, cthd.getMaSP());
        ps.executeUpdate();
    }
    public static void deleteChiTietHoaDon(Connection conn, ChiTietHoaDon cthd) throws SQLException
    {
        PreparedStatement ps = conn.prepareStatement("DELETE FROM ChiTietHoaDon WHERE MaHoaDon=? and MaSP=?");
        ps.setString(1, cthd.getMaHoaDon());
        ps.setString(2, cthd.getMaSP());
        ps.executeUpdate();
    }
    public static void deleteChiTietHoaDonById(Connection conn, String maHD) throws SQLException 
    {
        PreparedStatement ps = conn.prepareStatement("DELETE FROM ChiTietHoaDon where MaHoaDon=?");
        ps.setString(1,maHD);
        ps.executeUpdate();
    }
    public static void deleteCart(Connection conn, String maNguoiDung) throws SQLException
    {
    	String id="cart_"+maNguoiDung;
        deleteChiTietHoaDonById(conn, id);

    }
    public static void changeMaCTHD(Connection conn, String oldString, String newString ) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("UPDATE ChiTietHoaDon SET MaHoaDon=? WHERE MaHoaDon=?");
        ps.setString(1, newString);
        ps.setString(2, oldString);
        ps.executeUpdate();
    }
    
}

