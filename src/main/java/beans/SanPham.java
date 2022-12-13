package beans;

public class SanPham {
	private String maSP;
	private String tenSP;
	private int gia;
	private String chiTiet;
	private String hinh;
	private String maLoaiSP;
	private String tenLoaiSanPham; 
	
	public SanPham(){}
	public SanPham(String maSP, String tenSP, int gia, String chiTiet, String hinh, String maLoaiSP)
	{
		this.maSP = maSP;
        this.tenSP = tenSP;
        this.gia = gia;
        this.chiTiet = chiTiet;
		this.hinh =hinh;
		this.maLoaiSP = maLoaiSP;
	}
	public SanPham(String maSP, String tenSP, int gia, String chiTiet, String hinh)
	{
		this.maSP = maSP;
        this.tenSP = tenSP;
        this.gia = gia;
        this.chiTiet = chiTiet;
		this.hinh =hinh;
		this.maLoaiSP = "lsp00";
	}
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
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
	public String getChiTiet() {
		return chiTiet;
	}
	public void setChiTiet(String chiTiet) {
		this.chiTiet = chiTiet;
	}
	public String getHinh() {
		return hinh;
	}
	public void setHinh(String hinh) {
		if (hinh == null)
			hinh="null";
		this.hinh = hinh;
	}
	public String getMaLoaiSP() {
		return maLoaiSP;
	}
	public void setMaLoaiSP(String maLoaiSP) {
		if (maLoaiSP ==null)
			maLoaiSP = "lsp00";
		this.maLoaiSP = maLoaiSP;
	}
	public String getTenLoaiSanPham() {
		return tenLoaiSanPham;
	}
	public void setTenLoaiSanPham(String tenLoaiSanPham) {
		this.tenLoaiSanPham = tenLoaiSanPham;
	}
	public void OutPrint() {
	System.out.println("maSP:"+maSP);
        System.out.println("tenSP:"+tenSP);
        System.out.println("gia:"+gia);
		System.out.println("chiTiet:"+chiTiet);
		System.out.println("hinh:"+hinh);
		System.out.println("maLoaiSP:"+maLoaiSP);
		System.out.println("tenLoaiSanPham:"+tenLoaiSanPham);	
	}

}
