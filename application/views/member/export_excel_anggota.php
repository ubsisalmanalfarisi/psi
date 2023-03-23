<?php
header("Content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=$title.xls"); header("Pragma: no-cache");
header("Expires: 0");
?>
<h3><center>Laporan Data Anggota Perputakaan Online</center></h3>
<br/>
<table class="table-data">
<thead>
<tr>
<th>No</th>
<th>Nama</th>
<th>Email</th>
<th>Status Keanggotaan</th>
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
<?php
}
?>
</tbody>
</table>
