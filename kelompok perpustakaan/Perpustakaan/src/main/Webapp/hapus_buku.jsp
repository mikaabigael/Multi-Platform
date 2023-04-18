<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hapus Buku</title>
</head>
<body>

<%@ page import="id.ac.uns.vokasi.d3ti.perpustakaan.*" %>

<%
String kode_buku = request.getParameter("kode_buku");

PerpustakaanModel perpustakaan = new PerpustakaanModel();
Perpustakaan buku = new Perpustakaan();
buku.setKode_buku(kode_buku);
perpustakaan.deleteBuku(kode_buku);
response.sendRedirect("TabelPustaka.jsp");
%>

</body>
</html>