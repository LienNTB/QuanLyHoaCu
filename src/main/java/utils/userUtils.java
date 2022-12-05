package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.User;

public class userUtils {
    public static User findUser(Connection conn, String username, String password) throws SQLException {
        String sql="Select MaNguoiDung, TenDangNhap,HoTen, MatKhau, NgaySinh, DiaChi, RoleID from NguoiDung where TenDangNhap=? and MatKhau=?";
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
            user.setRoleID(rs.getString("RoleID"));
            return user;
        }
    
        return null;
    }
}
