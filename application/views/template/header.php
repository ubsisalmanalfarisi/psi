<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<title>Pustaka-Booking | <?=$judul;?></title> 
<link href="<?= base_url('assets/'); ?>perpustakaan.png" rel="icon">
<link rel="stylesheet" href="<?= base_url('assets/'); ?>user/css/bootstrap.css">
<link href="<?= base_url('assets/'); ?>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> 
<link href="<?= base_url('assets/'); ?>datatable/datatables.css" rel="stylesheet" type="text/css"> 
<style>
  body{
    background: #f2ffe4;
  }
    .nav-link:hover{
        background: #4a604ad6; border-radius: 10px;
        transition: all ease 0.5s;
    }
    .bg-container{
        background: #fbfbfb;
        border: 1px solid #f1f1f1;
        box-shadow: 0px 0px 5px #9E9E9E;
        margin-bottom: 3rem;
    }
    .bg-kolom{
        background: ;
    }
    .btn-size{
        width: 98px;
        padding:5px;
        margin: 10px 0px;
    }
    .btn-size:hover{
        background:red;
    }.footer-bottom {
      padding: 40px 0 30px;
    background: #304a2e;
}
.copyright-text p {
    color: #fff;
    margin-top: 9px;
    margin-bottom: 0;
}
.social-link li {
    display: inline-block;
    margin: 0 5px;
}
.social-link li a {
    color: #ccc;
    border: 1px solid #ccc;
    width: 40px;
    height: 40px;
    line-height: 40px;
    border-radius: 50%;
    text-align: center;
    display: inline-block;
    font-size: 14px;
    transition: .5s;
}
#main{
    display: table;
    width: 100%;
    height: 45vh;
    text-align: center;
}

.fof{
	  display: table-cell;
	  vertical-align: middle;
}

.fof h1{
	  font-size: 120px;
	  display: inline-block;
	  padding-right: 12px;
	  animation: type .5s alternate infinite;
}

@keyframes type{
	  from{box-shadow: inset -3px 0px 0px #888;}
	  to{box-shadow: inset -3px 0px 0px transparent;}
}
</style>
</head> 
<body> 
<nav class="navbar navbar-expand-lg navbar-light" style="background: #304a2e;"> 
<div class="container"> 
<a class="navbar-brand text-white" href="<?= base_url(); ?>">Pustaka E-Booking</a> 
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation"> 
<span class="navbar-toggler-icon"></span> 
</button>
 <div class="collapse navbar-collapse" id="navbarNavAltMarkup"> 
 <div class="navbar-nav"> 
 <a class="nav-item nav-link active text-white" href="<?= base_url(); ?>">Beranda <span class="sr-only">(current)</span></a> <?php if (!empty($this->session->userdata('nomor_unik'))) { ?> 
 <a class="nav-item nav-link text-white" href="<?=base_url('booking');?>">Booking <b><?=$this->ModelBooking->getDataWhere('temp',['nomor_unik' => $this->session->userdata('nomor_unik')])->num_rows();?></b> Buku</a> <a class="nav-item nav-link text-white" href="<?= base_url('member/myprofil'); ?>">Profil Saya</a> 
 <a class="nav-item nav-link text-white" href="<?= base_url('member/logout'); ?>"><i class="fas fw fa-login"></i> Log out</a> 
 <?php } else { ?> 
 <a class="nav-item nav-link text-white" data-toggle="modal" data-target="#loginModal" href="#"><i class="fas fw fa-login"></i> Log in</a> 
 <?php } ?> 
 <span class="nav-item nav-link nav-right text-white" style="display:block; margin-left:20px;">Selamat Datang <b><?= $user; ?></b></span>
</div> 
</div> 
</nav>
<div class="container mt-5">
  <center>
<div class="col-md-8">
  <form action="<?php echo base_url('cari')?>" action="GET">
<div class="input-group">
  <input type="text" name="judul-buku" id="judul-buku" class="form-control" placeholder="Masukan Judul Buku yang Ingin Anda Cari..">
  <div class="input-group-append">
    <button type="submit" class="btn btn-success">Cari</button>
 </form>
    <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <span class="sr-only">Toggle Dropdown</span>
    </button>
    <div class="dropdown-menu">
    <?php foreach ($kiki as $k) { ?>
      <a class="dropdown-item" href="<?php echo base_url('kategori/'. $k['id']) ?>"><?= $k['kategori']; ?></a>
   <?php } ?>
      <div role="separator" class="dropdown-divider"></div>
      <a class="dropdown-item" data-toggle="modal" data-target="#advanceSearch" href="#" href="#">Advance Search</a>
    </div>
  </div>
</div>
</div>
    </center>
 </div>
<div class="container mt-5 bg-container">
    
