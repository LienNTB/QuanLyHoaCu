package utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.ChiTietHoaDon;
public class ChiTietHoaDonUtils 
{
    public static List<ChiTietHoaDon> getChiTietHoaDonByIdMaHD(Connection con, String MaHD) throws SQLException 
    {
        List<ChiTietHoaDon> result = new ArrayList<ChiTietHoaDon>();
        PreparedStatement preparedStatement = con.prepareStatement("SELECT MaHoaDon, MaSP, SoLuong, TongPhu FROM ChiTietHoaDon WHERE MaHoaDon=?");
        preparedStatement.setString(1, MaHD);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next())
        {
            ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
            chiTietHoaDon.setMaHoaDon(resultSet.getString("MaHoaDon"));
            chiTietHoaDon.setMaSP(resultSet.getString("MaSP"));
            chiTietHoaDon.setSoLuong(resultSet.getInt("SoLuong"));
            chiTietHoaDon.setTongPhu(resultSet.getFloat("TongPhu"));
            result.add(chiTietHoaDon);
        }
        return result;
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
}

