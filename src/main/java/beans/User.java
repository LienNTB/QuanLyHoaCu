package beans;

import java.sql.Date;

public class User {
	private String maNguoiDung;
	private String tenDangNhap;
	private String matKhau;
	private String hoTen;
	private Date ngaySinh;
	private String diaChi;
	private String roleID;
	public String getMaNguoiDung() {
		return maNguoiDung;
	}
	public void setMaNguoiDung(String maNguoiDung) {
		this.maNguoiDung = maNguoiDung;
	}
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getRoleID() {
		return roleID;
	}
	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}
	public void OutPrint()
	{
		System.out.println("maNguoiDung:"+maNguoiDung);
        System.out.println("tenDangNhap:"+tenDangNhap);
		System.out.println("matKhau:"+matKhau);
		System.out.println("hoTen:"+hoTen);
	    System.out.println("ngaySinh:"+ngaySinh);
		System.out.println("diaChi:"+diaChi);
		System.out.println("roleID:"+roleID);

	}
	

}
