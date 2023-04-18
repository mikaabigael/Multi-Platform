<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ubah Data Buku</title>
</head>
<body>

<%@ page import="id.ac.uns.vokasi.d3ti.perpustakaan.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.ArrayList" %>

<h2>Form Ubah Data Buku</h2>

<%
String kode_buku = request.getParameter("kode_buku");

PerpustakaanModel perpustakaanModel = new PerpustakaanModel();
ArrayList<Perpustakaan> buku = new ArrayList<Perpustakaan>();
buku = perpustakaanModel.getDataByKode(kode_buku);
for(int i=0;i<buku.size();i++) {
%>

<form action="" method="post">
<input type="hidden" name="kode_buku" value="<% out.print(kode_buku); %>" maxlength="9" minlength="9" required="required">
<table>
	<tr>
		<td>Judul Buku</td>
		<td><input type="text" name="judul_buku" value="<% out.print(buku.get(i).getJudul_buku()); %>" required="required"></td>
	</tr>
	<tr>
		<td>Penulis</td>
		<td><input type="text" name="penulis_buku" value="<% out.print(buku.get(i).getPenulis_buku()); %>" required="required"></td>
	</tr>
	<tr>
		<td>Penerbit</td>
		<td><input type="text" name="penerbit_buku" value="<% out.print(buku.get(i).getPenerbit_buku()); %>" required="required"></td>
	</tr>
	<tr>
		<td>Tahun Terbit</td>
		<td><input type="text" name="tahun_terbit" value="<% out.print(buku.get(i).getTahun_terbit()); %>" onkeypress="return hanyaAngka(event)" maxlength="4" minlength="4" required="required"></td>
	</tr>
	<tr>
		<td>Stok</td>
		<td><input type="text" name="stok" value="<% out.print(buku.get(i).getStok()); %>" onkeypress="return hanyaAngka(event)" maxlength="5" required="required"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="submit" value="Ubah"></td>
	</tr>
</table>
</form>

<%
}
	String submit = request.getParameter("submit");
	if (submit != null) {
		Perpustakaan pustaka = new Perpustakaan();
		pustaka.setKode_buku(request.getParameter("kode_buku"));
		pustaka.setJudul_buku(request.getParameter("judul_buku"));
		pustaka.setPenulis_buku(request.getParameter("penulis_buku"));
		pustaka.setPenerbit_buku(request.getParameter("penerbit_buku"));
		pustaka.setTahun_terbit(request.getParameter("tahun_terbit"));
		pustaka.setStok(request.getParameter("stok"));
		perpustakaanModel.updateBuku(pustaka);
		%>
		<script>
		alert('Data berhasil diubah');
		document.location.href = 'TabelPustaka.jsp'
		</script>
		<%
	}
%>

</body>
</html>