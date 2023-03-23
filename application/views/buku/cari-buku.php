<?= $this->session->flashdata('pesan'); ?> 
<div style="padding: 25px;"> 
<div class="x_panel"> 
<div class="x_content"> 
<!-- Tampilkan semua produk -->
<div class="card">
<div class="card-header">Berikut hasil pencarian judul buku berdasarkan kata kunci.. <b><?php echo $this->input->GET('cari') ;?></b></div>
</div>
<br>
<div class="row">
<?php if (count($judulbuku)>0) :?>
    <!-- looping products -->
<?php foreach ($judulbuku as $projects) { ?> 
<div class="col-md-2 col-md-3 bg-kolom"> 
<div class="thumbnail"> 
<img src="<?php echo base_url(); ?>assets/img/upload/<?= $projects->image; ?>" style="height: 282px; width: 200px;padding: 5px; border: 1px solid #dfd9d9;"> 
<div class="caption"> 
<p> <?php if ($projects->stok < 1) { 
    echo "<i style='background:#593532;' class='btn btn text-white fas fw fa-shopping-cart btn-size'> Booking 0</i>"; 
    } 
    else { 
        echo "<a style='background:#593532;' class=' btn-size btn btn fas fw fa-shopping-cart text-white' href='" . base_url('booking/tambahBooking/' . $projects->id) . "'> Booking</a>"; 
        } 
        ?> 
<a style='background:#6F936D;' class="btn text-white btn fas fw fa-search btn-size" href="<?= base_url('detail-buku/' . $projects->id); ?>"> Detail</a>
</p> 
</div> 
</div> 
</div> 
<?php } ?>
<!-- end looping -->
<?php else :?>
      <!-- 404 Error Text -->
      <div id="main" class="col-md-12">
    	<div class="fof">
        		<h1>Error 404</h1>
                <br><br>
                <p>Halaman Tidak Ditemukan, Silahkan kembali ke halaman utama <a href="<?php echo base_url('') ?>">Klik Disini</a>.</p>
    	</div>
</div>
<?php endif ?>
<div class="row">
    <div class="col-md-12"><p><?php echo 'Ini Pagination Search'; ?><p></div>
</div>
</div> 
</div> 
</div>
</div>
