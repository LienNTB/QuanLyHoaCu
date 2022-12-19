package utils;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import beans.User;

public class userUtils {
    public static List<User> getListUser(Connection conn) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("SELECT MaNguoiDung, TenDangNhap, HoTen, MatKhau, NgaySinh, DiaChi, RoleID FROM NguoiDung where RoleID='001'");
        ResultSet rs = ps.executeQuery();
        List<User> userList = new ArrayList<User>();
        while (rs.next()) {
            User user = new User();
            user.setMaNguoiDung(rs.getString("MaNguoiDung"));
            user.setTenDangNhap(rs.getString("TenDangNhap"));
            user.setHoTen(rs.getString("HoTen"));
            user.setMatKhau(rs.getString("MatKhau"));
            user.setNgaySinh(rs.getDate("NgaySinh"));
            user.setDiaChi(rs.getString("DiaChi"));
            user.setRole(rs.getString("RoleID"));
            userList.add(user);
        }
        return userList;
    }
    public static User findUser(Connection conn, String username, String password) throws SQLException {
        String sql="Select u.MaNguoiDung, u.TenDangNhap, u.HoTen, u.MatKhau, u.NgaySinh, u.DiaChi, r.RoleName from NguoiDung u, ROLE r where u.TenDangNhap=? and u.MatKhau=? and u.RoleID=r.RoleID";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1,username);
        stmt.setString(2,password);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            User user=new User();
            user.setMaNguoiDung(rs.getString("MaNguoiDung"));
            user.setTenDangNhap(rs.getString("TenDangNhap"));
            user.setHoTen(rs.getString("HoTen"));
            user.setMatKhau(rs.getString("MatKhau"));
            user.setNgaySinh(rs.getDate("NgaySinh"));
            user.setDiaChi(rs.getString("DiaChi"));
            user.setRole(rs.getString("RoleName"));
            return user;
        }    
        return null;
    }
    public static User getUserById(Connection conn, String userID) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement("SELECT MaNguoiDung, TenDangNhap, HoTen, MatKhau, NgaySinh, DiaChi, RoleID FROM NguoiDung where  MaNguoiDung=?");
        stmt.setString(1,userID);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            User user = new User();
            user.setMaNguoiDung(rs.getString("MaNguoiDung"));
            user.setTenDangNhap(rs.getString("TenDangNhap"));
            user.setHoTen(rs.getString("HoTen"));
            user.setMatKhau(rs.getString("MatKhau"));
            user.setNgaySinh(rs.getDate("NgaySinh"));
            user.setDiaChi(rs.getString("DiaChi"));
            user.setRole(rs.getString("RoleID"));
            return user;
        }
        return null;
    }
    public static void insertUser(Connection conn, User user) throws SQLException 
    {
        String sql="INSERT INTO NguoiDung (MaNguoiDung,TenDangNhap,HoTen,MatKhau,NgaySinh,DiaChi,RoleID) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1,user.getMaNguoiDung());
        stmt.setString(2,user.getTenDangNhap());
        stmt.setString(3,user.getHoTen());
        stmt.setString(4,user.getMatKhau());
        stmt.setDate(5, (java.sql.Date) user.getNgaySinh());
        stmt.setString(6,user.getDiaChi());
        stmt.setString(7,user.getRole());
        stmt.executeUpdate();
    } 
    public static void updateUser(Connection conn, User user) throws SQLException 
    {
        String sql="UPDATE NguoiDung SET TenDangNhap=?,HoTen=?,MatKhau=?,NgaySinh=?,DiaChi=?,RoleID=? where MaNguoiDung=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1,user.getTenDangNhap());
        stmt.setString(2,user.getHoTen());
        stmt.setString(3,user.getMatKhau());
        stmt.setDate(4,(java.sql.Date) user.getNgaySinh());
        stmt.setString(5,user.getDiaChi());
        stmt.setString(6,user.getRole());
        stmt.setString(7,user.getMaNguoiDung());
        stmt.executeUpdate();
    }
    public static void updateUserWithoutMatKhau(Connection conn, User user) throws SQLException {
    
        String sql="UPDATE NguoiDung SET TenDangNhap=?,HoTen=?,NgaySinh=?,DiaChi=?,RoleID=? where MaNguoiDung=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1,user.getTenDangNhap());
        stmt.setString(2,user.getHoTen());
        stmt.setDate(3,(java.sql.Date) user.getNgaySinh());
        stmt.setString(4,user.getDiaChi());
        stmt.setString(5,user.getRole());
        stmt.setString(6,user.getMaNguoiDung());
        stmt.executeUpdate();

    }
    public static void updateMatKhau(Connection conn, User user) throws SQLException {
        PreparedStatement stmt=conn.prepareStatement("UPDATE NguoiDung SET MatKhau=? where MaNguoiDung=?");
        stmt.setString(1,user.getMatKhau());
        stmt.setString(2,user.getMaNguoiDung());
        stmt.executeUpdate();
        
    }


}
