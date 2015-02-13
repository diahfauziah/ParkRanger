<?php
	include ('koneksi.php');
	$id_laporan = $_GET['id_laporan'];
	$query0 = "INSERT INTO `vote_laporan` (id_laporan, vote_by) VALUES ('$id_laporan', 1)";
	$eksekusi0 = mysql_query($query0);
	$query1 = "update pengaduan natural join vote_laporan set rank_vote = rank_vote+1 where id_laporan = '$id_laporan'";
	$eksekusi1 = mysql_query($query1);
	
?>