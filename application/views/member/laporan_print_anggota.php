<!DOCTYPE html> 
<html> 
<head> 
<title></title> 
</head> 
<body> 
<style type="text/css"> 
.table-data{ 
width: 100%; 
border-collapse: collapse; 
} 
.table-data tr th, 
.table-data tr td{ 
border:1px solid black; 
font-size: 11pt; 
font-family:Verdana; 
padding: 10px 10px 10px 10px; 
} 
h3{ 
font-family:Verdana; 
} 

</style> 
<h3><center>Laporan Data Anggota Perputakaan Online</center></h3> 
<br/> 
<table class="table-data"> 
<thead> 
<tr> 
<th>No</th> 
<th>Nama</th> 
<th>Email</th>
<th>Status Keanggotaan</th>
</tr> 
</thead> 
<tbody> 
<?php 
$no = 1; 
foreach($anggota as $u){ 
	if ($u['is_active'] == 1){
                    		$status = 'Aktif';	
                    	}else{
                    		$status = 'Tidak aktif';
                    	}
?> 
<tr> 
<th scope="row"><?= $no++; ?></th> 
<td><?= $u['nama']; ?></td> 
<td><?= $u['email']; ?></td> 
<td style="text-align: center;"><?= $status; ?></td> 
</tr> 
<?php 
} 
?> 
</tbody> 
</table> 
<script type="text/javascript"> 
window.print(); 
</script> 
</body> 
</html>
