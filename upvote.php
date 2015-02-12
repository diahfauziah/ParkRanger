<?php
	include ('koneksi.php');
	$id_laporan = $_GET['id_laporan'];
	$pelapor = mysql_query("SELECT `pelapor` FROM `pengaduan` WHERE `id_laporan` = '$id_laporan'");
	echo $pelapor;
	$query0 = "INSERT INTO `vote_laporan` (id_laporan, vote_by) VALUES ('$id_laporan', '$pelapor')";
	$query1 = "update pengaduan natural join vote_laporan set rank_vote = rank_vote+1 where id_laporan = '$id_laporan'";
	$eksekusi0 = mysql_query($query0);
	$eksekusi1 = mysql_query($query1);
	
?>