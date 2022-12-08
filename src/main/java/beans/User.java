package beans;

import java.util.Date;

public class User {
	private String maNguoiDung;
	private String tenDangNhap;
	private String matKhau;
	private String hoTen;
	private Date ngaySinh;
	private String diaChi;
	private String role;
	public User() {};
	public User(String tenDangNhap, String matKhau, String hoTen, java.util.Date birthday, String diaChi)
	{
		this.tenDangNhap = tenDangNhap;
		this.maNguoiDung=this.createMaNguoiDung();
        this.matKhau = matKhau;
        this.hoTen = hoTen;
		this.ngaySinh = birthday;
        this.diaChi = diaChi;
		this.role="USER";
	}
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
	public String getRole() {
		return role;
	}
	public void setRole(String roleID) {
		this.role = roleID;
	}
	public void OutPrint()
	{
		System.out.println("maNguoiDung:"+maNguoiDung);
        System.out.println("tenDangNhap:"+tenDangNhap);
		System.out.println("matKhau:"+matKhau);
		System.out.println("hoTen:"+hoTen);
	    System.out.println("ngaySinh:"+ngaySinh);
		System.out.println("diaChi:"+diaChi);
		System.out.println("roleID:"+role);
	}
	public String createMaNguoiDung()
	{
		String maNguoiDung;
		maNguoiDung = this.tenDangNhap;
        return maNguoiDung;
	}
	

}
