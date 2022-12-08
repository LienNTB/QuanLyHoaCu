package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.User;

public class userUtils {
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
    public static void insertUser(Connection conn, User user) throws SQLException 
    {
        String sql="INSERT INTO NguoiDung (MaNguoiDung,TenDangNhap,HoTen,MatKhau,NgaySinh,DiaChi,RoleName) VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1,user.getMaNguoiDung());
        stmt.setString(2,user.getTenDangNhap());
        stmt.setString(3,user.getHoTen());
        stmt.setString(4,user.getMatKhau());
        stmt.setDate(5,(Date) user.getNgaySinh());
        stmt.setString(6,user.getDiaChi());
        stmt.setString(7,"001");
        stmt.execute();
    } 

}
