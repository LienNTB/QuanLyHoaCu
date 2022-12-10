package beans;

public class LoaiSanPham {
	private String maLoaiSP;
	private String tenLoaiSanPham;
	public LoaiSanPham() {};
	public LoaiSanPham(String maLoaiSanPham, String tenLoaiSanPham) {
		this.maLoaiSP=maLoaiSanPham;
		this.tenLoaiSanPham=tenLoaiSanPham;
	}
	public String getMaLoaiSP() {
		return maLoaiSP;
	}
	public void setMaLoaiSP(String maLoaiSP) {
		this.maLoaiSP = maLoaiSP;
	}
	public String getTenLoaiSanPham() {
		return tenLoaiSanPham;
	}
	public void setTenLoaiSanPham(String tenLoaiSanPham) {
		this.tenLoaiSanPham = tenLoaiSanPham;
	}

}
