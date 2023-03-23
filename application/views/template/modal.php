<!-- login modal -->
<div class="modal fade" tabindex="-1" id="loginModal" role="dialog">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title">Login Member</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
<span aria-hidden="true">&times;</span> 
</button> 
</div> 
<form action="<?= base_url('member'); ?>" method="post">
<div class="modal-body">
<div class="form-group row"> 
<label for="email" class="col-sm-2 col-form-label">NISN</label> 
<div class="col-sm-10"> 
<input type="text" class="form-control" id="nomor-unik" name="nomor-unik" placeholder="Masukan NISN"> 
</div> 
</div> 
<div class="form-group row"> 
<label for="inputPassword" class="col-sm-2 col-form-label">Password</label> 
<div class="col-sm-10"> 
<input type="password" class="form-control" id="password" name="password" placeholder="Password"> 
</div> 
</div> 
</div> 
<div class="modal-footer"> 
<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button> 
<button type="submit" class="btn btn-outline-primary">Log in</button> 
</div>
 </form> 
 </div> 
 </div> 
 </div> 
 <!--/login modal --> 
 <!-- modal info--> 
 <div class="modal fade" tabindex="-1" id="modalinfo" role="dialog"> 
 <div class="modal-dialog" role="document"> 
 <div class="modal-content"> 
 <div class="modal-header"> 
 <h5 class="modal-title">Informasi</h5> 
 <button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
 <span aria-hidden="true">&times;</span> 
 </button> 
 </div> 
 <div class="modal-body">
 <span class="alert alert-message alert-success">Waktu Pengambilan Buku 1x24 jam dari Booking!!!</span> 
 </div> 
 <div class="modal-footer"> 
 <a class="btn btn-outline-info" href="<?= base_url(); ?>">Ok</a> 
 </div> 
 </div> 
 </div> 
 </div> <!--/modal info -->
 <!-- modal advance search--> 
 <div class="modal fade" tabindex="-1" id="advanceSearch" role="dialog"> 
 <div class="modal-dialog" role="document"> 
 <div class="modal-content">
<div class="modal-header">
<h5 class="modal-title">Menu Pencarian Lebih Lanjut</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
<span aria-hidden="true">&times;</span> 
</button> 
</div> 
<form action="<?php echo base_url('cari')?>" action="GET">
<div class="modal-body">
<div class="form-group row"> 
<label for="kata-kunci" class="col-sm-3 col-form-label">Kata Kunci</label> 
<div class="col-sm-9"> 
<input type="text" class="form-control" id="judul-buku" name="judul-buku" placeholder="Masukan Kata Kunci"> 
</div> 
</div> 
<div class="form-group row"> 
<label for="inputPassword" class="col-sm-3 col-form-label">Berdasarkan</label> 
<div class="col-sm-9"> 
<div class="form-group">
  <select class="form-control" id="sel1">
    <option>Judul Buku</option>
    <option>Penulis</option>
  </select>
</div>
</div> 
</div> 
</div> 
<div class="modal-footer"> 
<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 
<button type="submit" class="btn btn-success">Cari</button> 
</div>
 </form> 
 </div>
 </div> 
 </div> <!--/modal advance search -->
