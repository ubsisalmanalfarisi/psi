<?= $this->session->flashdata('pesan'); ?> 
<div style="padding: 25px;"> 
<div class="x_panel"> 
<div class="x_content"> 
<!-- Tampilkan semua produk -->
<div class="row">
<!-- looping products --> 
<?php foreach ($projects as $projects) { ?> 
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
<?php }?> 
<!-- end looping -->
</div>
<div class="row">
    <div class="col-md-12"><p><?php echo $links; ?><p></div>
</div>
</div> 
</div> 
</div>
