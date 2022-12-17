package beans;

public class HomePage {
	//0: All product
	
	private int chedo;
	private int sttTrang;
	private String maLSP="lsp00";
	private String dataInput;
	public HomePage(int mode)
	{
		this.chedo=mode;
	}
	public HomePage() {}
	public int getChedo() {
		return chedo;
	}
	public void setChedo(int chedo) {
		this.chedo = chedo;
	}
	public int getSttTrang() {
		return sttTrang;
	}
	public void setSttTrang(int i) {
		this.sttTrang = i;
	}
	public String getMaLSP() {
		return maLSP;
	}
	public void setMaLSP(String maLSP) {
		this.maLSP = maLSP;
	}
	public String getDataInput() {
		return dataInput;
	}
	public void setDataInput(String dataInput) {
		this.dataInput = dataInput;
	}
	

}
