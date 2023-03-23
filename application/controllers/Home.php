<?php
class Home extends CI_Controller { 
    function __construct() { 
        parent::__construct();
        $this->load->library("pagination");
        $this->load->helper('form');
    } 
    
    public function index() { 
        $data = [ 
            'judul' => "Katalog Buku", 
            'buku' => $this->ModelBuku->getBuku()->result(),
            'kiki' => $this->ModelBuku->getKategori()->result_array(),
        ];     
        
        //jika sudah login dan jika belum login 
        if ($this->session->userdata('nomor_unik')) { 
            $user = $this->ModelUser->cekData(['nomor_unik' => $this->session->userdata('nomor_unik')])->row_array(); 
            $data['user'] = $user['nama'];
            $config["base_url"] = base_url()."page/";
            $config["total_rows"] = $this->ModelBuku->get_count_all();
            $config['first_url'] = '1';
            $config["per_page"] = 8;
            $config["uri_segment"] = 2;
            $config['use_page_numbers'] = true;
            $config['num_links'] = 5;
            $page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0;
            $config['full_tag_open'] = '<ul class="pagination">';        
            $config['full_tag_close'] = '</ul>';        
            $config['first_link'] = 'First';        
            $config['last_link'] = 'Last';        
            $config['first_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['first_tag_close'] = '</span></li>';        
            $config['prev_link'] = '&laquo';        
            $config['prev_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['prev_tag_close'] = '</span></li>';        
            $config['next_link'] = '&raquo';        
            $config['next_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['next_tag_close'] = '</span></li>';        
            $config['last_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['last_tag_close'] = '</span></li>';        
            $config['cur_tag_open'] = '<li class="page-item active"><a class="page-link" href="#">';        
            $config['cur_tag_close'] = '</a></li>';        
            $config['num_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['num_tag_close'] = '</span></li>';
            $this->pagination->initialize($config);
            /*
              end 
              add boostrap class and styles
            */
            $data["links"] = $this->pagination->create_links();
            $data['projects'] = $this->ModelBuku->get_buku($config["per_page"], $page);
            $this->load->view('template/header', $data); 
            $this->load->view('buku/daftarbuku', $data);
            $this->load->view('template/modal', $data); 
            $this->load->view('template/footer', $data); 
        } 
        else {
            $config["base_url"] = base_url()."page/";
            $config["total_rows"] = $this->ModelBuku->get_count_all();
            $config['first_url'] = '1';
            $config["per_page"] = 8;
            $config["uri_segment"] = 2;
            $config['use_page_numbers'] = true;
            $config['num_links'] = 5;
            $page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0;
            $config['full_tag_open'] = '<ul class="pagination">';        
            $config['full_tag_close'] = '</ul>';        
            $config['first_link'] = 'First';        
            $config['last_link'] = 'Last';        
            $config['first_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['first_tag_close'] = '</span></li>';        
            $config['prev_link'] = '&laquo';        
            $config['prev_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['prev_tag_close'] = '</span></li>';        
            $config['next_link'] = '&raquo';        
            $config['next_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['next_tag_close'] = '</span></li>';        
            $config['last_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['last_tag_close'] = '</span></li>';        
            $config['cur_tag_open'] = '<li class="page-item active"><a class="page-link" href="#">';        
            $config['cur_tag_close'] = '</a></li>';        
            $config['num_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['num_tag_close'] = '</span></li>';
            $this->pagination->initialize($config);
            /*
              end 
              add boostrap class and styles
            */
            $data["links"] = $this->pagination->create_links();
            $data['projects'] = $this->ModelBuku->get_buku($config["per_page"], $page);

            $data['user'] = 'Pengunjung'; $this->load->view('template/header', $data);
            $this->load->view('buku/daftarbuku', $data);
            $this->load->view('template/modal', $data); 
            $this->load->view('template/footer', $data); 
        } 
    }

    public function detailBuku() { 
        if ($this->session->userdata('nomor_unik')) { 
        $user = $this->ModelUser->cekData(['nomor_unik' => $this->session->userdata('nomor_unik')])->row_array(); 
        $id = $this->uri->segment(2); 
        $buku = $this->ModelBuku->joinKategoriBuku(['buku.id' => $id])->result(); 
        $data['user'] = $user['nama'];
        $data['kiki'] = $this->ModelBuku->getKategori()->result_array();
        foreach ($buku as $fields) { 
            $data['judul'] = $fields->judul_buku;
            $data['pengarang'] = $fields->pengarang; 
            $data['penerbit'] = $fields->penerbit; 
            $data['kategori'] = $fields->kategori; 
            $data['tahun'] = $fields->tahun_terbit; 
            $data['isbn'] = $fields->isbn; 
            $data['gambar'] = $fields->image; 
            $data['dipinjam'] = $fields->dipinjam; 
            $data['dibooking'] = $fields->dibooking; 
            $data['stok'] = $fields->stok; 
            $data['id'] = $id; 
        } 
            $this->load->view('template/header', $data); 
            $this->load->view('buku/detail-buku', $data);
            $this->load->view('template/modal', $data); 
            $this->load->view('template/footer'); 
    }else{
        $id = $this->uri->segment(2); 
        $buku = $this->ModelBuku->joinKategoriBuku(['buku.id' => $id])->result(); 
        $data['user'] = "Pengunjung"; $data['title'] = "Detail Buku"; 
        $data['kiki'] = $this->ModelBuku->getKategori()->result_array();
        foreach ($buku as $fields) { 
            $data['judul'] = $fields->judul_buku;
            $data['pengarang'] = $fields->pengarang; 
            $data['penerbit'] = $fields->penerbit; 
            $data['kategori'] = $fields->kategori; 
            $data['tahun'] = $fields->tahun_terbit; 
            $data['isbn'] = $fields->isbn; 
            $data['gambar'] = $fields->image; 
            $data['dipinjam'] = $fields->dipinjam; 
            $data['dibooking'] = $fields->dibooking; 
            $data['stok'] = $fields->stok; 
            $data['id'] = $id; 
        } 
            $this->load->view('template/header', $data); 
            $this->load->view('buku/detail-buku', $data);
            $this->load->view('template/modal', $data); 
            $this->load->view('template/footer'); 
    }
    }

    // Index Kategori
    public function daftarKategori() { 
        $id = $this->uri->segment(2);
        $where = ['id_kategori'=> $id];
        $data = [ 
            'judul' => "Katalog Kategori", 
            'buku' => $this->ModelBuku->getBuku()->result(),
            'kategori' => $this->ModelBuku->getKategori()->result_array(),
        ];     
        
        //jika sudah login dan jika belum login 
        if ($this->session->userdata('nik')) { 
            $user = $this->ModelUser->cekData(['nik' => $this->session->userdata('nik')])->row_array(); 
            $data['user'] = $user['nama'];
            $this->load->view('template/header', $data); 
            $this->load->view('buku/daftarbuku', $data);
            $this->load->view('template/modal', $data); 
            $this->load->view('template/footer', $data); 
        } 
        else {
            $config["base_url"] = base_url()."kategori/".$id;
            $config["total_rows"] = $this->ModelBuku->get_count_kategori($where);
            $config['first_url'] = '1';
            $config["per_page"] = 1;
            $config["uri_segment"] = 3;
            $config['use_page_numbers'] = true;
            $config['num_links'] = 5;
            $page = ($this->uri->segment(3)) ? $this->uri->segment(3) : 0;
            $config['full_tag_open'] = '<ul class="pagination">';        
            $config['full_tag_close'] = '</ul>';        
            $config['first_link'] = 'First';        
            $config['last_link'] = 'Last';        
            $config['first_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['first_tag_close'] = '</span></li>';        
            $config['prev_link'] = '&laquo';        
            $config['prev_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['prev_tag_close'] = '</span></li>';        
            $config['next_link'] = '&raquo';        
            $config['next_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['next_tag_close'] = '</span></li>';        
            $config['last_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['last_tag_close'] = '</span></li>';        
            $config['cur_tag_open'] = '<li class="page-item active"><a class="page-link" href="#">';        
            $config['cur_tag_close'] = '</a></li>';        
            $config['num_tag_open'] = '<li class="page-item"><span class="page-link">';        
            $config['num_tag_close'] = '</span></li>';
            $this->pagination->initialize($config);
            $data["links"] = $this->pagination->create_links();
            $data['projects'] = $this->ModelBuku->get_buku_kategori($config["per_page"], $page, $where);
            $data['user'] = 'Pengunjung'; $this->load->view('template/header', $data);
            $this->load->view('buku/daftarbuku', $data);
            $this->load->view('template/modal', $data); 
            $this->load->view('template/footer', $data); 
        } 
    }

    // Fungsi Cari Buku
    public function cariBuku(){
        $data = [ 
            'judul' => "Menu Pencarian", 
            'buku' => $this->ModelBuku->getBuku()->result(),
            'judulbuku' => $this->ModelBuku->cariBuku(),
            'kiki' => $this->ModelBuku->getKategori()->result_array(),
        ];   
        $data['user'] = 'Pengunjung'; $this->load->view('template/header', $data);
            $this->load->view('buku/cari-buku', $data);
            $this->load->view('template/modal', $data); 
            $this->load->view('template/footer', $data); 
        
		
    }

}
