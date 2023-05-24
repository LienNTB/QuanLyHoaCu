package beans;

public class ChiTietHoaDon {
	private String maHoaDon;
	private String maSP;
	private int soLuong;
	private float tongPhu;
	private String tenSP;
	private int gia;
	private String hinh;
	private String loaiSP;
	
	public ChiTietHoaDon(){}
	public ChiTietHoaDon(String maHoaDon, String maSP, int soLuong, float tongPhu)
	{
		this.maHoaDon = maHoaDon;
        this.maSP = maSP;
        this.soLuong = soLuong;
        this.tongPhu = tongPhu;
	}
	public String getMaHoaDon() {
		return maHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		this.maHoaDon = maHoaDon;
	}
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public float getTongPhu() {
		return tongPhu;
	}
	public void setTongPhu(float tongPhu) {
		this.tongPhu = tongPhu;
	}
	public String getTenSP() {
		return tenSP;
	}
	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getHinh() {
		return hinh;
	}
	public void setHinh(String hinh) {
		this.hinh = hinh;
	}
	public String getLoaiSP() {
		return loaiSP;
	}
	public void setLoaiSP(String loaiSP) {
		this.loaiSP = loaiSP;
	}

}
