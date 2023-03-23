</div>
<div class="footer-bottom">
<div class="container">
					<div class="row">
						<div class="col-sm-12 ">
							<div class="copyright-text">
								<p>Copyright © 2023 | Perpusatakaan E-Booking | SMP Gunung Jati 1, Kedungwuluh, Purwokerto Barat</p>
							</div>
						</div> <!-- End Col -->
					</div>
				</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="<?= base_url(); ?>assets/user/js/bootstrap.js"></script> 
<script src="<?= base_url('assets/'); ?>vendor/jquery/jquery.min.js"></script> 
<script src="<?= base_url('assets/'); ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<!-- Core plugin JavaScript--> 
<script src="<?= base_url('assets/'); ?>vendor/jqueryeasing/jquery.easing.min.js"></script> 
<!-- Custom scripts for all pages--> 
<script src="<?= base_url('assets/'); ?>js/sb-admin-2.min.js"></script> 
<script> $('.alert').alert().delay(3000).slideUp('slow'); </script>
<script>$('.dropdown-toggle').dropdown()</script> 
<script>
    $('.custom-file-input').on('change', function() {
        let fileName = $(this).val().split('\\').pop();
        $(this).next('.custom-file-label').addClass("selected").html(fileName);
    });
    $(document).ready(function() {
        $("#table-datatable").dataTable();
    });
    $('.alert-message').alert().delay(2500).slideUp('slow');
    $('.alert-danger').alert().delay(2500).slideUp('slow');
    $('.alert-success').alert().delay(2500).slideUp('slow');
</script>
</body> 
</html>
