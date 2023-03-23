<?php
    $dob = new DateTime($tgl_lahir);
    $now = new DateTime();
    $diff = $now->diff($dob);
?>
<!-- Begin Page Content --> 
<div class="container-fluid"> 
<div class="row"> 
<div class="col-lg-6 justify-content-x"> 
</div> 
</div> 
<div class="card mb-3" style="margin-top: 1rem;"> 
<div class="row no-gutters"> 
<div class="col-md-4"> 
<img style="height:100%;" src="<?= base_url('assets/img/profile/') . $image; ?>" class="img-thumbnail" alt="..."> 
</div> 
<div class="col-md-8"> 
<div class="card-body"> 
<h2 class="text-left">Halaman Profil Saya</h2>
<table class="table table-striped table-bordered" style="margin-top: 1rem"> 
<tr>
    <td>Nama</td>
    <td><?php echo $user ?></td>
</tr>
<tr>
    <td>NISN</td>
    <td><?php echo $nomor_unik ?></td>
</tr>
<tr>
    <td>Kelas</td>
    <td><?php echo $kelas ?></td>
</tr>
<tr>
    <td>Usia</td>
    <td><?php echo $diff->y ?> Tahun</td>
</tr>
</table> 
<div class="btn btn-info"> 
<a href="<?= base_url('member/ubahprofil'); ?>" class="text text-white">
<i class="fas fa-user-edit"></i> Ubah Profil</a> 
</div> 
</div> 

</div> 
</div> 
</div> 
</div> 
<!-- /.container-fluid --> 
</div> 
<!-- End of Main Content -->
