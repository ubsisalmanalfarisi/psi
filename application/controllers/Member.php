<?php class Member extends CI_Controller { 
    function __construct() { 
        parent::__construct(); 
    } 
    public function index() { 
        $this->_login(); 
    } 
    
    private function _login() { 
        $nomorunik = $this->input->post('nomor-unik', true);
        $password = $this->input->post('password', true); 
        $user = $this->ModelUser->cekData(['nomor_unik' => $nomorunik])->row_array(); 
        //jika usernya ada 
        if ($user) { 
            //jika user sudah aktif 
            if ($user['is_active'] == 1) { 
                //cek password 
                if (password_verify($password, $user['password'])) { 
                    $data = [ 
                        'nomor_unik' => $user['nomor_unik'], 
                        'role_id' => $user['role_id'], 
                        'id_user' => $user['id'], 
                        'user' => $user['nama'],
                    ];
                    $this->session->set_flashdata('pesan', '<div class="mt-3 alert alert-success alert-message" role="alert">Selamat Anda berhasil masuk</div>'); 
                    $this->session->set_userdata($data); redirect('home'); 
                } 
                else {
                    $this->session->set_flashdata('pesan', '<div class="alert alert-danger alert-message" role="alert">Password salah!!</div>'); 
                    redirect('home'); 
                } 
            } 
            else { 
                $this->session->set_flashdata('pesan', '<div class="alert alert-danger alert-message" role="alert">User belum diaktifasi!!</div>'); 
                redirect('home'); 
            } 
        } 
        else { $this->session->set_flashdata('pesan', '<div class="alert alert-danger alert-message" role="alert">NISN Tidak Terdaftar, Silahkan Hubungi Adminstrator</div>'); 
            redirect('home'); 
        } 
    }

    public function daftar() { 
        $this->form_validation->set_rules('nama', 'Nama Lengkap', 'required', [ 'required' => 'Nama Belum diis!!' ]); 
       $this->form_validation->set_rules('email', 'Alamat Email', 'required|trim|valid_email|is_unique[user.email]', [ 'valid_email' => 'Email Tidak Benar!!', 'required' => 'Email Belum diisi!!','is_unique' => 'Email Sudah Terdaftar!' ]); 
        $this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[3]|matches[password2]', [ 'matches' => 'Password Tidak Sama!!', 'min_length' => 'Password Terlalu Pendek' ]); 
        $this->form_validation->set_rules('password2', 'Repeat Password', 'required|trim|matches[password1]'); 
        $email = $this->input->post('email', true); 
        $data = [ 
            'nama' => htmlspecialchars($this->input->post('nama', true)), 
            'email' => htmlspecialchars($email), 
            'image' => 'default.jpg', 
            'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT), 
            'role_id' => 2, 
            'is_active' => 1, 
            'tanggal_input' => date('d')]; 
        $this->ModelUser->simpanData($data); 
        $this->session->set_flashdata('pesan', '<div class="alert alert-success alert-message" role="alert">Selamat!! akun anggota anda sudah dibuat.</div>'); 
        redirect(base_url()); 
    }
    public function myProfil() { 
        $user = $this->ModelUser->cekData(['nomor_unik' => $this->session->userdata('nomor_unik')])->row_array(); 
        foreach ($user as $a) { 
            $data = [ 
                'image' => $user['image'],
                'user' => $user['nama'], 
                'nomor_unik' => $user['nomor_unik'], 
                'kelas' => $user['kelas'],
                'tgl_lahir' => $user['tgl_lahir'],
                'judul'=> 'Profil Saya',
                 ]; 
        } 
        $this->load->view('template/header', $data); 
        $this->load->view('member/index', $data); 
        $this->load->view('template/modal'); 
        $this->load->view('template/footer', $data); 
    }

    public function ubahProfil() { 

        $user = $this->ModelUser->cekData(['nomor_unik' => $this->session->userdata('nomor_unik')])->row_array(); 
        $this->form_validation->set_rules(
            'nama',
            'Nama Lengkap',
            'required|trim', ['required' => 'Nama tidak Boleh Kosong']);

        //Form validasi
        foreach ($user as $a) { 
            $data = [ 'image' => $user['image'], 'user' => $user['nama'], 'nomor_unik' => $user['nomor_unik'],'judul'=> 'Ubah Profil Saya',]; 
        }
        if ($this->form_validation->run() == false) { 
            $this->load->view('template/header', $data); 
            $this->load->view('member/ubah-anggota', $data);
            $this->load->view('template/modal'); 
            $this->load->view('template/footer', $data); 
        } 
        else {
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
                    $gambar_lama = $user['image'];

                    if ($gambar_lama != 'default.jpg') { unlink(FCPATH . 'assets/img/profile/' .$gambar_lama); }

                    $gambar_baru = $this->upload->data('file_name');
                    $this->db->set('image', $gambar_baru);
                } else { }
            }
            $this->db->set('nama', $nama);
            $this->db->where('nomor_unik', $nomor_unik);
            $this->db->update('user');
            $this->session->set_flashdata('pesan', '<div class="alert alert-success alert-message" role="alert">Profil Berhasil diubah </div>'); 
            redirect('member/myprofil'); 
        } 
    }

    public function logout() { 
        $this->session->unset_userdata('nomor_unik'); 
        $this->session->unset_userdata('role_id'); 
        $this->session->set_flashdata('pesan', '<div class="mt-3 alert alert-success alert-message" role="alert">Anda telah logout!!</div>');
        redirect(''); 
}


}
