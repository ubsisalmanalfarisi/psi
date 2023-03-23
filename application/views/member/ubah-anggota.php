<!-- Begin Page Content --> 
<div class="container-fluid"> 
    <div class="row"> 
        <div class="col-lg-9" style="margin:1rem 0px;"> 
            <?= form_open_multipart('member/ubahProfil'); ?> 
            <div class="form-group row mt-3"> 
                <label for="text" class="col-sm-2 col-form-label">NISN</label> 
                <div class="col-sm-10"> 
                    <input type="text" class="form-control" id="nomor_unik" name="nomor_unik" value="<?= $nomor_unik; ?>" readonly> 
                </div> 
            </div> 
            <div class="form-group row"> 
                <label for="nama" class="col-sm-2 col-form-label">Nama Lengkap</label> 
                <div class="col-sm-10"> 
                    <input type="text" class="form-control" id="nama" name="nama" value="<?= $user; ?>" readonly> 
                    <?= form_error('nama', '<small class="text-danger pl-3">', '</small>'); ?> 
                </div> 
            </div> 
            <div class="form-group row"> 
                <div class="col-sm-2">Foto Profil</div> 
                <div class="col-sm-10"> <div class="row"> 
                    <div class="col-sm-3"> 
                        <img src="<?= base_url('assets/img/profile/') . $image; ?>" class="img-thumbnail" alt=""> 
                    </div> 
                    <div class="col-sm-9"> 
                    <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image" name="image">
                                <label class="custom-file-label" for="image">Pilih file</label>
                            </div>
</div> 
                </div> 
            </div> 
        </div> 
        <div class="form-group row justify-content-end"> 
            <div class="col-sm-10"> 
                <button type="submit" class="btn btn-primary">Ubah</button> 
                </form> 
                <button class="btn btn-dark" href="<?php echo base_url('member/myprofil') ?>"> Kembali</button> 
            </div> 
        </div> 

</div> 
</div> 
</div> 
<!-- /.container-fluid --> 
</div> 
<!-- End of Main Content -->
