<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar" style="transition: all 1s ease;">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<?= base_url('admin'); ?>">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-book"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Pustaka Booking</div>
    </a>
    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Looping Menu-->

    <!-- Heading -->
    <div class="sidebar-heading">
        Master Data
    </div>
    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link pb-0" href="<?= base_url('admin'); ?>">
                <i class="fa fa-fw fa-cogs"></i>
                <span>Dashboard</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link pb-0" href="<?= base_url('user'); ?>">
                <i class="fa fa-fw fa-user"></i>
                <span>Profil</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link pb-0" href="<?= base_url('buku/kategori'); ?>">
                <i class="fa fa-fw fa-tag"></i>
                <span>Kategori</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link pb-0" href="<?= base_url('buku'); ?>">
                <i class="fa fa-fw fa-book"></i>
                <span>Data Buku</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link pb-0" href="<?= base_url('user/anggota'); ?>">
                <i class="fa fa-fw fa-users"></i>
                <span>Data Anggota</span></a>
        </li>
        <hr class="sidebar-divider">
<div class="sidebar-heading">Transaksi</div>
<li class="nav-item">
        <a class="nav-link" href="<?=base_url('pinjam');?>">
          <i class="fas fa-fw fa-shopping-cart"></i>
          <span>Data Peminjaman</span></a>
</li>
<li class="nav-item">
<a class="nav-link" href="<?=base_url('pinjam/DaftarBooking');?>">
          <i class="fas fa-fw fa-list"></i>
          <span>Data Booking</span></a>
</li>
<hr class="sidebar-divider">
<div class="sidebar-heading">Laporan</div>
<li class="nav-item">
        <a class="nav-link" href="<?=base_url('laporan/laporan_buku');?>">
          <i class="fas fa-fw fa-address-book"></i>
          <span>Laporan Data Buku</span></a>
</li>
<li class="nav-item">
<a class="nav-link" href="<?=base_url('laporan/laporan_anggota');?>">
          <i class="fas fa-fw fa-address-book"></i>
          <span>Laporan Data Anggota</span></a>
</li>
<li class="nav-item">
<a class="nav-link" href="<?=base_url('laporan/laporan_pinjam ');?>">
          <i class="fas fa-fw fa-address-book"></i>
          <span>Laporan Data Pinjam</span></a>
</li>

    </li>
    <!-- Divider -->
    <hr class="sidebar-divider mt-3">
    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button onclick="myFunction()" class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>
</ul>
<!-- End of Sidebar -->
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
