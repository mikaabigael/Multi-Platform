<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Perpustakaan</title>
</head>
<body>

<%@ page import="java.util.ArrayList" %>
<%@ page import="id.ac.uns.vokasi.d3ti.perpustakaan.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<h2>Tabel Buku</h2>

<table border="1" cellpadding="15" cellspacing="0">
<thead>
	<tr align="center">
		<th>Kode</th>
		<th>Judul</th>
		<th>Penulis</th>
		<th>Penerbit</th>
		<th>Tahun Terbit</th>
		<th>Stok</th>
		<th>Aksi</th>
	</tr>
</thead>
	<%
		PerpustakaanModel perpustakaan = new PerpustakaanModel();
		ArrayList<Perpustakaan> buku = new ArrayList<Perpustakaan>();
		buku = perpustakaan.getData();
		for(int i=0;i<buku.size();i++) {
			%>
			<tr align="center">
				<td><% out.print(buku.get(i).getKode_buku()); %></td>
				<td><% out.print(buku.get(i).getJudul_buku()); %></td>
				<td><% out.print(buku.get(i).getPenulis_buku()); %></td>
				<td><% out.print(buku.get(i).getPenerbit_buku()); %></td>
				<td><% out.print(buku.get(i).getTahun_terbit()); %></td>
				<td><% out.print(buku.get(i).getStok()); %></td>
				<td>
					<a href="ubah_buku.jsp?kode_buku=<% out.print(buku.get(i).getKode_buku()); %>">Ubah</a> | 
					<a href="hapus_buku.jsp?kode_buku=<% out.print(buku.get(i).getKode_buku()); %>" onclick="return confirm('Apakah anda yakin akan menghapus data?')">Hapus</a>
				</td>
			</tr>
			<%
		}
	%>
</table>
<br>
<br>
<a href="Tambah_Buku.jsp">Tambah Buku</a>

</body>
</html>