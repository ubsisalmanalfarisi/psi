<?php

defined('BASEPATH') or exit('No direct script access allowed');
class User extends CI_Controller
{
   public function __construct()
    {
        parent::__construct();
        $this->load->helper('pustaka_helper');
        cek_login();
        cek_user();
    }

    public function index()
    {
        $data['judul'] = 'Profil Saya';
        $data['user'] = $this->ModelUser->cekData(['nomor_unik' => $this->session->userdata('nomor_unik')])->row_array();
        $this->load->view('admin/header', $data);
        $this->load->view('admin/sidebar', $data);
        $this->load->view('admin/topbar', $data);
        $this->load->view('user/index', $data);
        $this->load->view('admin/footer');
    }
    
    public function anggota()
    {

        $data['judul'] = 'Data Anggota';
        $data['user'] = $this->ModelUser->cekData(['nomor_unik' => $this->session->userdata('nomor_unik')])->row_array();
        $this->db->where('role_id', 2);
        $data['anggota'] = $this->db->get('user')->result_array();
        $this->load->view('admin/header', $data);
        $this->load->view('admin/sidebar', $data);
        $this->load->view('admin/topbar', $data);
        $this->load->view('user/anggota', $data);
        $this->load->view('admin/footer');
    }

    public function hapusAnggota()
    {

        $where = ['id' => $this->uri->segment(3)];
        $this->ModelUser->hapusAnggota($where);
        $this->session->set_flashdata('pesan', '<div class="alert alert-danger alert-message" role="alert">Anggota Telah dihapus !</div>');
        redirect('user/anggota');
    }

    // Fungsi Update Status Anggota
    public function ubahAnggota()
    {
        // Menambahkan Fungsi Check Admin | Agar Halaman Hanya Bisa diakses oleh admin
        $data['judul'] = 'Ubah Status Anggota';
        $data['user'] = $this->ModelUser->cekData(['email' => $this->session->userdata('email')])->row_array();

        $where = ['id' =>  $this->uri->segment(3)];
        $data['username'] = $this->ModelUser->getUserWhere($where)->row_array();
        $this->form_validation->set_rules(
            'is_active', 
            'Status Anggota',
            'required', [
                'required' => 'Status Anggota harus diisi'
            ]);

        if ($this->form_validation->run() == false) 
        {
            $this->load->view('admin/header', $data);
            $this->load->view('admin/sidebar', $data);
            $this->load->view('admin/topbar', $data);
            $this->load->view('user/ubah-anggota', $data);
            $this->load->view('admin/footer');
        } else {
            $id = $this->input->post('id_user', true);
            $active = $this->input->post('is_active', true);
            $this->db->set('is_active', $active);
            $this->db->where('id', $id);
            $this->db->update('user');
            $this->session->set_flashdata('pesan', '<div class="alert alert-success alert-message" role="alert">Status Keanggotaan Berhasil dirubah !</div>');
            redirect('user/anggota/');
        }
    }

    public function ubahProfil()
    {
        $data['judul'] = 'Ubah Profil';
        $data['user'] = $this->ModelUser->cekData(['nomor_unik' => $this->session->userdata('nomor_unik')])->row_array();

        $this->form_validation->set_rules(
            'nama',
            'Nama Lengkap',
            'required|trim', ['required' => 'Nama tidak Boleh Kosong']);

        //Form validasi
        if ($this->form_validation->run() == false) 
        {
            $this->load->view('admin/header', $data);
            $this->load->view('admin/sidebar', $data);
            $this->load->view('admin/topbar', $data);
            $this->load->view('user/ubah-profile', $data);
            $this->load->view('admin/footer');
        } else {
            $nama = $this->input->post('nama', true);
            $nomor_unik = $this->input->post('nomor_unik', true);

            //jika ada gambar yang akan diupload
            $upload_image = $_FILES['image']['name'];

            //Cek kalau image exist
            if ($upload_image) 
            {
                //Eksekusi script
                $config['upload_path'] = './assets/img/profile/';
                $config['allowed_types'] = 'gif|jpg|png';
                $config['max_size'] = '3000';
                $config['max_width'] = '3000';
                $config['max_height'] = '3000';
                $config['file_name'] = 'pro' . time();
                $this->load->library('upload', $config);

                if ($this->upload->do_upload('image')) 
                {
                    $gambar_lama = $data['user']['image'];

                    if ($gambar_lama != 'default.jpg') { unlink(FCPATH . 'assets/img/profile/' .$gambar_lama); }

                    $gambar_baru = $this->upload->data('file_name');
                    $this->db->set('image', $gambar_baru);
                } else { }
            }

            $this->db->set('nama', $nama);
            $this->db->where('nomor_unik', $nomor_unik);
            $this->db->update('user');
            $this->session->set_flashdata('pesan', '<div class="alert alert-success alert-message" role="alert">Profil Berhasil diubah </div>');
            redirect('user');
        }
    }
}
/* Copyright - Kelompok 3 ~ 13.2A.21 ~  Universitas Bina Sarana Informatika Purwokerto */
