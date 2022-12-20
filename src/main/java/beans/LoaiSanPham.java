package beans;

public class LoaiSanPham {
	private String maLoaiSP;
	private String tenLoaiSanPham;
	private int SLTrongKho;
	private boolean daXoa=false;
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
	public int getSLTrongKho() {
		return SLTrongKho;
	}
	public void setSLTrongKho(int sLTrongKho) {
		SLTrongKho = sLTrongKho;
	}
	public boolean getDaXoa() {
		return daXoa;
	}
	public void setDaXoa(boolean daXoa) {
		this.daXoa = daXoa;
	}

}
