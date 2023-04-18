package id.ac.uns.vokasi.d3ti.perpustakaan;

public class Perpustakaan {
	private String kode_buku;
	private String judul_buku;
	private String penulis_buku;
	private String penerbit_buku;
	private String tahun_terbit;
	private String stok;
	
	public String getKode_buku() {
		return kode_buku;
	}
	
	public void setKode_buku(String kode_buku) {
		this.kode_buku = kode_buku;
	}
	
	public String getJudul_buku() {
		return judul_buku;
	}

	public void setJudul_buku(String judul_buku) {
		this.judul_buku = judul_buku;
	}
	
	public String getPenulis_buku() {
		return penulis_buku;
	}
	
	public void setPenulis_buku(String penulis_buku) {
		this.penulis_buku = penulis_buku;
	}
	
	public String getPenerbit_buku() {
		return penerbit_buku;
	}
	
	public void setPenerbit_buku(String penerbit_buku) {
		this.penerbit_buku = penerbit_buku;
	}
	
	public String getTahun_terbit() {
		return tahun_terbit;
	}
	
	public void setTahun_terbit(String tahun_terbit) {
		this.tahun_terbit = tahun_terbit;
	}
	
	public String getStok() {
		return stok;
	}
	
	public void setStok(String stok) {
		this.stok = stok;
	}
}
