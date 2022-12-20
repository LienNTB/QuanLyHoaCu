package beans;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

public class commons {
	public static String admin_url="~/admin/";
	public static User mainUser=null;
	public static HomePage homePage=new HomePage(0);
	public static String role;
	public static String locSanPham="tatca";
	public static String locLoaiSanPham="tatca";
	public static String locNguoiDung="tatca";
	public static String locDonHang="tatca";
	public static boolean checkAdmin()
	{
		if (mainUser==null)
			return false;
		return mainUser.getRole().equals("ADMIN");
	}
	public static boolean isLogin()
	{
		return mainUser!=null;
	}
	
	public static Date ConvertStringToSQLDate(String dateString)
	{
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsed = null;
		try {
			parsed = format.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new java.sql.Date(parsed.getTime());
	}
	
	
}
