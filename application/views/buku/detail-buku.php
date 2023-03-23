<div class="x_panel">
<div class="x_content"> 
<div class="row"> 
<div class="col-sm-4 col-md-4"> 
<div class="thumbnail"> 
<img src="<?php echo base_url(); ?>assets/img/upload/<?= $gambar; ?>" style="width: 100%;
    padding: 10px;
    height: 330px;" class="card-image"> 
</div></div>
<div class="col-sm-8 col-md-8">
<table class="table table-striped table-bordered" style="margin-top: 10px;"> 
<tr> 
<th nowrap>Judul Buku: </th> <td nowrap><?= $judul; ?></td>
<th>Kategori: </th> <td><?= $kategori ?></td> </tr> 
<tr> 
<th nowrap>Penerbit: </th> <td><?= $penerbit ?></td>
<th>Dipinjam: </th> <td><?= $dipinjam ?></td>
</tr>
<tr> 
<th nowrap>Tahun Terbit: </th> 
<td><?= substr($tahun, 0, 4) ?></td> 
<th>Dibooking: </th> 
<td><?= $dibooking ?></td> 
</tr> 
<tr> 
<th>ISBN: </th><td><?= $isbn ?></td> 
<th>Tersedia: </th> <td><?= $stok ?></td> 
</tr> 
</table> 
<?php if($stok==0) : ?>
    <p><a class="btn btn-outline-primary fas fw fa-shopping-cart disabled" href="#"> Booking</a> <span class="btn btn-outline-secondary fas fw fa-reply" onclick="window.history.go(-1)"> Kembali</span> </p>
    <?php else : ?>
    <p><a class="btn btn-outline-primary fas fw fa-shopping-cart" href="<?= base_url('booking/tambahBooking/' . $id); ?>"> Booking</a> <span class="btn btn-outline-secondary fas fw fa-reply" onclick="window.history.go(-1)"> Kembali</span> </p> 
<?php endif; ?>
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading" style="background: #eeeeee;
    padding: 5px;
    font-weight: 600;
    color: #212529;">Panel heading</div>
  <div class="panel-body">
    <p>...</p>
  </div>

</div>
</div>
</div>
</div>
    </div>
