package utils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.HoaDon;
import beans.commonBeans;
public class HoaDonUtils {
    public static List<HoaDon> getListHoaDon(Connection conn) throws SQLException {
        List<HoaDon> hoaDonList = new ArrayList<HoaDon>();
        PreparedStatement pst = conn.prepareStatement("select MaHoaDon, GhiChu, TongThanhToan, DiaChiGiaoHang, SoDienThoai,MaKhachHang,TrangThaiDonHang, ThoiGianGiaoHang,TrangThaiGiaoHang, TrangThaiThanhToan, DaXoa from HoaDon where MaHoaDon like 'DH.%'");
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            HoaDon hoaDon = new HoaDon();
            hoaDon.setMaHoaDon(rs.getString("MaHoaDon"));
            hoaDon.setGhiChu(rs.getString("GhiChu"));
            hoaDon.setTongThanhToan(rs.getInt("TongThanhToan"));
            hoaDon.setDiaChiGiaoHang(rs.getString("DiaChiGiaoHang"));
            hoaDon.setSoDienThoai(rs.getString("SoDienThoai"));
            hoaDon.setMaKhachHang(rs.getString("MaKhachHang"));
            hoaDon.setTrangThaiDonHang(rs.getBoolean("TrangThaiDonHang"));
            hoaDon.setThoiGianGiaoHang(rs.getDate("ThoiGianGiaoHang"));
            hoaDon.setTrangThaiGiaoHang(rs.getBoolean("TrangThaiGiaoHang"));
            hoaDon.setTrangThaiThanhToan(rs.getBoolean("TrangThaiThanhToan"));
            hoaDon.setDaXoa(rs.getBoolean("DaXoa"));
            hoaDonList.add(hoaDon);
        }
        return hoaDonList;
        
    }
    public static List<HoaDon> getListHoaDonByDeletedStatus(Connection conn, boolean status) throws SQLException {
        List<HoaDon> hoaDonList = new ArrayList<HoaDon>();
        PreparedStatement pst = conn.prepareStatement("select MaHoaDon, GhiChu, TongThanhToan, DiaChiGiaoHang, SoDienThoai,MaKhachHang,TrangThaiDonHang, ThoiGianGiaoHang,TrangThaiGiaoHang, TrangThaiThanhToan, DaXoa from HoaDon where DaXoa=? and MaHoaDon like 'DH.%'");
        pst.setBoolean(1,status);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            HoaDon hoaDon = new HoaDon();
            hoaDon.setMaHoaDon(rs.getString("MaHoaDon"));
            hoaDon.setGhiChu(rs.getString("GhiChu"));
            hoaDon.setTongThanhToan(rs.getInt("TongThanhToan"));
            hoaDon.setDiaChiGiaoHang(rs.getString("DiaChiGiaoHang"));
            hoaDon.setSoDienThoai(rs.getString("SoDienThoai"));
            hoaDon.setMaKhachHang(rs.getString("MaKhachHang"));
            hoaDon.setTrangThaiDonHang(rs.getBoolean("TrangThaiDonHang"));
            hoaDon.setThoiGianGiaoHang(rs.getDate("ThoiGianGiaoHang"));
            hoaDon.setTrangThaiGiaoHang(rs.getBoolean("TrangThaiGiaoHang"));
            hoaDon.setTrangThaiThanhToan(rs.getBoolean("TrangThaiThanhToan"));
            hoaDon.setDaXoa(rs.getBoolean("DaXoa"));
            hoaDonList.add(hoaDon);
        }
        return hoaDonList;
        
    }
    
    public static List<HoaDon> getListHoaDonBySearch(Connection conn, String text) throws SQLException {
        List<HoaDon> hoaDonList = new ArrayList<HoaDon>();
        PreparedStatement pst = conn.prepareStatement("select MaHoaDon, GhiChu, TongThanhToan, DiaChiGiaoHang, SoDienThoai,MaKhachHang,TrangThaiDonHang,\r\n"
        		+ "ThoiGianGiaoHang,TrangThaiGiaoHang, TrangThaiThanhToan from HoaDon where MaHoaDon like 'DH.%'\r\n"
        		+ "and HoaDon.MaHoaDon like '%"+text+"%' or HoaDon.DiaChiGiaoHang like '%"+text+"%' or HoaDon.MaKhachHang like '%"+text+"%'\r\n"
        		+ "or HoaDon.SoDienThoai like '%"+text+"%' or HoaDon.TongThanhToan like '%"+text+"%'");
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            HoaDon hoaDon = new HoaDon();
            hoaDon.setMaHoaDon(rs.getString("MaHoaDon"));
            hoaDon.setGhiChu(rs.getString("GhiChu"));
            hoaDon.setTongThanhToan(rs.getInt("TongThanhToan"));
            hoaDon.setDiaChiGiaoHang(rs.getString("DiaChiGiaoHang"));
            hoaDon.setSoDienThoai(rs.getString("SoDienThoai"));
            hoaDon.setMaKhachHang(rs.getString("MaKhachHang"));
            hoaDon.setTrangThaiDonHang(rs.getBoolean("TrangThaiDonHang"));
            hoaDon.setThoiGianGiaoHang(rs.getDate("ThoiGianGiaoHang"));
            hoaDon.setTrangThaiGiaoHang(rs.getBoolean("TrangThaiGiaoHang"));
            hoaDon.setTrangThaiThanhToan(rs.getBoolean("TrangThaiThanhToan"));
            hoaDonList.add(hoaDon);
        }
        return hoaDonList;
        
    }
    public static List<HoaDon> getHoaDonByIdMaKH(Connection conn, String maKH) throws SQLException 
    {


        List<HoaDon> hoaDonList = new ArrayList<HoaDon>();

        PreparedStatement pst = conn.prepareStatement("select MaHoaDon, GhiChu, TongThanhToan, DiaChiGiaoHang, SoDienThoai,MaKhachHang,TrangThaiDonHang, ThoiGianGiaoHang,TrangThaiGiaoHang, TrangThaiThanhToan from HoaDon where MaKhachHang=? and MaHoaDon !=? and DaXoa=0 ORDER BY MaHoaDon DESC");
        pst.setString(1, maKH);
        pst.setString(2, "cart_"+maKH);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) 
        {
            HoaDon hoaDon = new HoaDon();
            hoaDon.setMaHoaDon(rs.getString("MaHoaDon"));
            hoaDon.setGhiChu(rs.getString("GhiChu"));
            hoaDon.setTongThanhToan(rs.getInt("TongThanhToan")); 
            hoaDon.setDiaChiGiaoHang(rs.getString("DiaChiGiaoHang"));
            hoaDon.setSoDienThoai(rs.getString("SoDienThoai"));
            hoaDon.setMaKhachHang(rs.getString("MaKhachHang"));
            hoaDon.setThoiGianGiaoHang(rs.getDate("ThoiGianGiaoHang"));
            hoaDon.setTrangThaiDonHang(rs.getBoolean("TrangThaiDonHang"));
            hoaDon.setTrangThaiGiaoHang(rs.getBoolean("TrangThaiGiaoHang"));
            hoaDon.setTrangThaiThanhToan(rs.getBoolean("TrangThaiThanhToan"));
            hoaDonList.add(hoaDon);
        }
        return hoaDonList;
    }
    public static HoaDon getHoaDonById (Connection conn, String MaHD) throws SQLException {
        PreparedStatement pst = conn.prepareStatement("select * from HoaDon, NguoiDung where HoaDon.MaKhachHang = NguoiDung.MaNguoiDung\r\n"
        		+ "and HoaDon.MaHoaDon = ?");
        pst.setString(1, MaHD);
        ResultSet rs = pst.executeQuery();
        if (rs.next())
        {
            HoaDon hoaDon = new HoaDon();
            hoaDon.setMaHoaDon(rs.getString("MaHoaDon"));
            hoaDon.setGhiChu(rs.getString("GhiChu"));
            hoaDon.setTongThanhToan(rs.getInt("TongThanhToan"));
            hoaDon.setDiaChiGiaoHang(rs.getString("DiaChiGiaoHang"));
            hoaDon.setSoDienThoai(rs.getString("SoDienThoai"));
            hoaDon.setMaKhachHang(rs.getString("MaKhachHang"));
            hoaDon.setThoiGianGiaoHang(rs.getDate("ThoiGianGiaoHang"));
            hoaDon.setTrangThaiDonHang(rs.getBoolean("TrangThaiDonHang"));
            hoaDon.setTrangThaiGiaoHang(rs.getBoolean("TrangThaiGiaoHang"));
            hoaDon.setTrangThaiThanhToan(rs.getBoolean("TrangThaiThanhToan"));
            hoaDon.setHoten(rs.getString("HoTen"));
            return hoaDon;
        }
        return null;

    }
    public static void insertHoaDon(Connection conn, HoaDon hd) throws SQLException {
        PreparedStatement pst = conn.prepareStatement("INSERT INTO HoaDon VALUES (?,?,?,?,?,?,?,?,?,?,?)");

        pst.setString(1,hd.getMaHoaDon());
        pst.setString(2,hd.getGhiChu());
        pst.setInt(3,hd.getTongThanhToan());
        pst.setString(4,hd.getDiaChiGiaoHang());
        pst.setString(5,hd.getSoDienThoai());
        pst.setString(6,hd.getMaKhachHang());
        pst.setDate(7,(Date) hd.getThoiGianGiaoHang());
        pst.setBoolean(8,hd.getTrangThaiDonHang());
        pst.setBoolean(9,hd.getTrangThaiGiaoHang());
        pst.setBoolean(10,hd.getTrangThaiThanhToan());
        pst.setBoolean(11,false);
        
        pst.executeUpdate();
    }
    public static void updateHoaDon(Connection conn, HoaDon hd) throws SQLException 
    {
        PreparedStatement pst = conn.prepareStatement("UPDATE HoaDon SET GhiChu=?,TongThanhToan=?,DiaChiGiaoHang=?,SoDienThoai=?,MaKhachHang=?,TrangThaiDonHang=?, TrangThaiGiaoHang=?, TrangThaiThanhToan=?, ThoiGianGiaoHang=? where MaHoaDon=?");
        pst.setString(1,hd.getGhiChu());
        pst.setInt(2,hd.getTongThanhToan());
        pst.setString(3,hd.getDiaChiGiaoHang());
        pst.setString(4,hd.getSoDienThoai());
        pst.setString(5,hd.getMaKhachHang());
        pst.setBoolean(6,hd.getTrangThaiDonHang());
        pst.setBoolean(7,hd.getTrangThaiGiaoHang());
        pst.setBoolean(8,hd.getTrangThaiThanhToan());
        pst.setDate(9,(Date) hd.getThoiGianGiaoHang());
        pst.setString(10,hd.getMaHoaDon());
        
        pst.executeUpdate();
        
    }
    public static void deleteHoaDon (Connection conn, String hd) throws SQLException
    {
        PreparedStatement pst = conn.prepareStatement("UPDATE HoaDon set DaXoa= 1 WHERE MaHoaDon=?");
        pst.setString(1, hd);
        pst.executeUpdate();
    
    }
    public static void undeleteHoaDon (Connection conn, String hd) throws SQLException
    {
        PreparedStatement pst = conn.prepareStatement("UPDATE HoaDon set DaXoa= 0 WHERE MaHoaDon=?");
        pst.setString(1, hd);   
        pst.executeUpdate();
    
    }
    public static int getTongThanhToan(Connection conn, String maHD) throws SQLException {
        PreparedStatement pst = conn.prepareStatement("select sum(TongPhu) as TongThanhToan from ChiTietHoaDon where MaHoaDon=?");
        pst.setString(1, maHD);
        ResultSet rs = pst.executeQuery();
        if (rs.next())
            return rs.getInt("TongThanhToan");
        return 0;
    }
    public static int getTongSoHoaDon(Connection conn) throws SQLException {
    	PreparedStatement pst = conn.prepareStatement("select count(MaHoaDon) as TongSoHoaDon from HoaDon where MaHoaDon like '%DH.USER%'");
    	ResultSet rs = pst.executeQuery();
    	if(rs.next()) return rs.getInt("TongSoHoaDon");
    	return 0;
    }
    public static int getTongDoanhThu(Connection conn) throws SQLException {
    	PreparedStatement pst = conn.prepareStatement("select sum(TongThanhToan) as TongDoanhThu from HoaDon where HoaDon.TrangThaiDonHang = 1");
    	ResultSet rs = pst.executeQuery();
    	if(rs.next()) return rs.getInt("TongDoanhThu");
    	return 0;
    }

}
