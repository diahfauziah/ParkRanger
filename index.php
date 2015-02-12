<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/home.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
    	<div class="container">
	        <div class="top">
		        <h1 class="text-muted"><a href="index.php">Park Ranger</a></h1>
			    <p class="text-right">Logged in as <a href="#">Edmund</a></p>
			    <div class="clearfix"></div>
		        <ul class="nav nav-justified" role="navigation">
		        	<li class="active"><a href="index.php">Home</a></li>
		        	<li><a href="lapor.php">Kirim Laporan</a></li>
		        	<li><a href="about.php">About</a></li>
		        	<li><a href="logout.php">Log Out</a></li>
		        </ul>
	       	</div>
	       	<br/>
	       	<div class="dropdown text-right">
	       	Sort by : &nbsp;
				<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					Most recent
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu1">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Most recent</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Top votes</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Recently handled</a></li>
				</ul>
			</div>
			<br />
			  <?php include ('koneksi.php'); 
					$query = mysql_query("select * from pengaduan natural join taman order by waktu desc");
					while ($data = mysql_fetch_array($query)){
				       	echo '<div class="panel panel-default">';
						echo	'<div class="panel-body">';
						echo		'<div class="col-xs-3">';
						echo			'<a href="#" class="thumbnail"><img src="img/taman1.jpg" alt="taman"></a>';
						echo '</div>';
						echo		'<div class="col-xs-9">';
						echo			'<h2><a href="#"><strong><a href="#">'. $data["nama"] . '</a></strong></a></h2>';
						echo			'<p class="text-warning">Jenis laporan : '.$data["jenis_laporan"].' </p>';
						echo			'<p>'.$data["keterangan"].'</p>';
						echo			'<p id="status">';
						if($data["status"]==NULL){
								echo	'<span class="text-danger"><span class="glyphicon glyphicon-remove"></span> Belum ditindaklanjuti</span><br />';
						}else{
								echo	'<span class="text-success"><span class="glyphicon glyphicon-ok"></span> Sudah ditindaklanjuti</span><br />';
						}
						echo				'<small>Pelapor : <a href="profile.html" class="text-primary">edmund.ophie </a> <a href="#"><span class="text-danger glyphicon glyphicon-exclamation-sign"></span></a></small>';
						echo			'</p>';
						echo			'<div class="vote col-xs-3 text-right">';
						echo				'<a id="upvote'.$data["id_laporan"].'" href="upvote.php?id_laporan='.$data["id_laporan"].'"><span class="glyphicon glyphicon-triangle-top" ></span></a>';
						echo				'20';
						echo				'<a id="downvote'.$data["id_laporan"].'" href="#"><span class="glyphicon glyphicon-triangle-bottom"></span></a>';
						echo			'</div>';
						echo		'</div>';
				        echo	'</div>';
			      		echo '</div>';
			      	}
      			?>
			<nav class="text-center">
				<ul class="pagination">
					<li class="disabled">
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li>
						<a href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
			<p class="text-center footer">
				<br/>
				Copyright &copy; 2014. ParkRanger. All rights reserved.<br/>
				<br/>
			</p>
	    </div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
        <script type="text/javascript" src="vote.js"></script>
    </body>
</html>
