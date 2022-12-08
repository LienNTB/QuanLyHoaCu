package beans;

import java.util.Date;

public class HoaDon {
	private String maHoaDon;
	private String ghiChu;
	private int tongThanhToan;
	private String diaChiGiaoHang;
	private String soDienThoai;
	private String maKhachHang;
	private Date thoiGianGiaoHang;
	private boolean trangThaiDonHang;
	private boolean trangThaiThanhToan;
	private boolean trangThaiGiaoHang;
	public String getMaHoaDon() {
		return maHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		this.maHoaDon = maHoaDon;
	}
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	/**
	 * @return the tongThanhToan
	 */
	public int getTongThanhToan() {
		return tongThanhToan;
	}
	/**
	 * @param tongThanhToan the tongThanhToan to set
	 */
	public void setTongThanhToan(int tongThanhToan) {
		this.tongThanhToan = tongThanhToan;
	}
	/**
	 * @return the diaChiGiaoHang
	 */
	public String getDiaChiGiaoHang() {
		return diaChiGiaoHang;
	}
	/**
	 * @param diaChiGiaoHang the diaChiGiaoHang to set
	 */
	public void setDiaChiGiaoHang(String diaChiGiaoHang) {
		this.diaChiGiaoHang = diaChiGiaoHang;
	}
	/**
	 * @return the soDienThoai
	 */
	public String getSoDienThoai() {
		return soDienThoai;
	}
	/**
	 * @param soDienThoai the soDienThoai to set
	 */
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	/**
	 * @return the maKhachHang
	 */
	public String getMaKhachHang() {
		return maKhachHang;
	}
	/**
	 * @param maKhachHang the maKhachHang to set
	 */
	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}
	public boolean getTrangThaiDonHang() {
		return trangThaiDonHang;
	}
	public void setTrangThaiDonHang(boolean trangThaiDonHang) {
		this.trangThaiDonHang = trangThaiDonHang;
	}
	public Date getThoiGianGiaoHang() {
		return thoiGianGiaoHang;
	}
	public void setThoiGianGiaoHang(Date thoiGianGiaoHang) {
		this.thoiGianGiaoHang = thoiGianGiaoHang;
	}
	public boolean getTrangThaiThanhToan() {
		return trangThaiThanhToan;
	}
	public void setTrangThaiThanhToan(boolean trangThaiThanhToan) {
		this.trangThaiThanhToan = trangThaiThanhToan;
	}
	public boolean getTrangThaiGiaoHang() {
		return trangThaiGiaoHang;
	}
	public void setTrangThaiGiaoHang(boolean trangThaiGiaoHang) {
		this.trangThaiGiaoHang = trangThaiGiaoHang;
	}
	
}
