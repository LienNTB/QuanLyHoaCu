package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Monhoc;
import beans.SinhVien;

public class DBUtils {
	public static List<Monhoc> listMonHoc(Connection conn) throws SQLException {
		List<Monhoc> list = new ArrayList<Monhoc>();
		String sql = "select * from monhoc";
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		
		while(rs.next()) {
			int maso_monhoc = rs.getInt("maso_monhoc");
			String ten_monhoc = rs.getString("ten_monhoc");
			int sotinchi = rs.getInt("sotinchi");
			
			Monhoc mh = new Monhoc();
			mh.setMaso_monhoc(maso_monhoc);
			mh.setTen_monhoc(ten_monhoc);
			mh.setSotinchi(sotinchi);
			list.add(mh);
			
		}
		return list;
	}

	public static Monhoc getMonhoc(Connection conn, int id) throws SQLException {
		String sql = "select * from monhoc where monhoc.maso_monhoc = ?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1,id);
		ResultSet rs = pstm.executeQuery();
		
		while(rs.next()) {
			int maso_monhoc = rs.getInt("maso_monhoc");
			String ten_monhoc = rs.getString("ten_monhoc");
			int sotinchi = rs.getInt("sotinchi");
			
			Monhoc mh = new Monhoc(maso_monhoc,ten_monhoc,sotinchi);
			return mh;
		}
		return null;
	}
    public static void updateMonhoc(Connection conn, Monhoc mh) throws SQLException {
    	String sql = "update monhoc set maso_monhoc=?,ten_monhoc=?,sotinchi=? "
    			+ "where monhoc.maso_monhoc = ?";
    	
    	PreparedStatement pstm = conn.prepareStatement(sql);
    	pstm.setInt(1,mh.getMaso_monhoc());
    	pstm.setString(2, mh.getTen_monhoc());
    	pstm.setInt(3, mh.getSotinchi());
    	pstm.setInt(4, mh.getMaso_monhoc());
    	pstm.executeUpdate();
    }
	
    public static void insertMonhoc(Connection conn, Monhoc mh) throws SQLException {
        String sql = "Insert monhoc values(?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setInt(1, mh.getMaso_monhoc());
        pstm.setString(2, mh.getTen_monhoc());
        pstm.setInt(3, mh.getSotinchi());

        pstm.executeUpdate();
    }

	public static void deleteMonhoc(Connection conn, int idIn) throws SQLException {
        String sql = "delete from monhoc where monhoc.maso_monhoc = ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setInt(1, idIn);  
        
        pstm.executeUpdate();
    }
}
