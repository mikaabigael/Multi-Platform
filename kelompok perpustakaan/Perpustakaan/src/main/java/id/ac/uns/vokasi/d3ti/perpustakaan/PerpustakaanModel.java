package id.ac.uns.vokasi.d3ti.perpustakaan;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class PerpustakaanModel {
	static Connection con;
	static Statement st;
	static ResultSet rs;
	static ArrayList<Perpustakaan> dataBuku;
	
	public PerpustakaanModel() {
		String server="jdbc:mysql://localhost/db_perpustakaan?user=root&password=";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(server);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dataBuku = new ArrayList<Perpustakaan>();
	}
	
	public static ArrayList<Perpustakaan> getData() {
		String query= "SELECT * FROM buku";
		try {
			st=con.createStatement();
			rs=st.executeQuery(query);
			while(rs.next()) {
				Perpustakaan perpustakaan = new Perpustakaan();
				perpustakaan.setKode_buku(rs.getString(1));
				perpustakaan.setJudul_buku(rs.getString(2));
				perpustakaan.setPenulis_buku(rs.getString(3));
				perpustakaan.setPenerbit_buku(rs.getString(4));
				perpustakaan.setTahun_terbit(rs.getString(5));
				perpustakaan.setStok(rs.getString(6));
				dataBuku.add(perpustakaan);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataBuku;
	}
	
	public static ArrayList<Perpustakaan> getDataByKode(String kode_buku){
		String query="SELECT * FROM buku WHERE kode_buku='"+kode_buku+"'";
		try {
			st=con.createStatement();
			rs=st.executeQuery(query);
			while(rs.next()) {
				Perpustakaan perpustakaan = new Perpustakaan();
				perpustakaan.setKode_buku(rs.getString(1));
				perpustakaan.setJudul_buku(rs.getString(2));
				perpustakaan.setPenulis_buku(rs.getString(3));
				perpustakaan.setPenerbit_buku(rs.getString(4));
				perpustakaan.setTahun_terbit(rs.getString(5));
				perpustakaan.setStok(rs.getString(6));
				dataBuku.add(perpustakaan);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataBuku;
	}
	
	public static void insertBuku(Perpustakaan perpustakaan) {
		String query = "INSERT INTO buku(kode_buku,judul_buku,penulis_buku,penerbit_buku,tahun_terbit,stok) VALUES("
				+ "'"+perpustakaan.getKode_buku()+"','"+perpustakaan.getJudul_buku()+"','"+perpustakaan.getPenulis_buku()+"',"
						+ "'"+perpustakaan.getPenerbit_buku()+"','"+perpustakaan.getTahun_terbit()+"',"
								+ "'"+perpustakaan.getStok()+"')";
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void updateBuku(Perpustakaan perpustakaan) {
		String query = "UPDATE buku SET judul_buku = '"+perpustakaan.getJudul_buku()+"', penulis_buku = '"+perpustakaan.getPenulis_buku()+"'"
				+ ", penerbit_buku = '"+perpustakaan.getPenerbit_buku()+"', tahun_terbit = '"+perpustakaan.getTahun_terbit()+"'"
						+ ", stok = '"+perpustakaan.getStok()+"' WHERE kode_buku = '"+perpustakaan.getKode_buku()+"'";
		
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void deleteBuku(String kodebuku) {
		String query = "DELETE FROM buku WHERE kode_buku = '"+kodebuku+"'";
		
		try {
			st=con.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}