<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tambah Buku</title>
</head>
<body>

<%@ page import="id.ac.uns.vokasi.d3ti.perpustakaan.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<h2>Form Tambah Buku</h2>

<form action="" method="post">
<table>
	<tr>
		<td>Kode Buku</td>
		<td><input type="text" name="kode_buku" maxlength="9" minlength="9" required="required"></td>
	</tr>
	<tr>
		<td>Judul Buku</td>
		<td><input type="text" name="judul_buku" required="required"></td>
	</tr>
	<tr>
		<td>Penulis</td>
		<td><input type="text" name="penulis_buku" required="required"></td>
	</tr>
	<tr>
		<td>Penerbit</td>
		<td><input type="text" name="penerbit_buku" required="required"></td>
	</tr>
	<tr>
		<td>Tahun Terbit</td>
		<td><input type="text" name="tahun_terbit" onkeypress="return hanyaAngka(event)" maxlength="4" minlength="4" required="required"></td>
	</tr>
	<tr>
		<td>Stok</td>
		<td><input type="text" name="stok" onkeypress="return hanyaAngka(event)" maxlength="5" required="required"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="submit" value="Tambah"> <input type="reset" name="reset" value="Reset"></td>
	</tr>
</table>
</form>

<%
	String submit = request.getParameter("submit");
	if (submit != null) {
		Perpustakaan pustaka = new Perpustakaan();
		pustaka.setKode_buku(request.getParameter("kode_buku"));
		pustaka.setJudul_buku(request.getParameter("judul_buku"));
		pustaka.setPenulis_buku(request.getParameter("penulis_buku"));
		pustaka.setPenerbit_buku(request.getParameter("penerbit_buku"));
		pustaka.setTahun_terbit(request.getParameter("tahun_terbit"));
		pustaka.setStok(request.getParameter("stok"));
		PerpustakaanModel perpustakaanModel = new PerpustakaanModel();
		perpustakaanModel.insertBuku(pustaka);
		%>
		<script>
		alert('Data berhasil tambahkan');
		document.location.href = 'TabelPustaka.jsp'
		</script>
		<%
	}
%>

<script>
    function hanyaAngka(event) {
        var angka = (event.which) ? event.which : event.keyCode
        if (angka != 46 && angka > 31 && (angka < 48 || angka > 57))
            return false;
        return true;
    }
</script>

</body>
</html>