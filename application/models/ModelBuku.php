<?php
defined('BASEPATH') or exit('No direct script access allowed');
class ModelBuku extends CI_Model
{
    //manajemen buku
    public function getBuku() { return $this->db->get('buku'); }
    public function bukuWhere($where) { return $this->db->get_where('buku', $where); }
    public function simpanBuku($data = null) { $this->db->insert('buku',$data); }
    public function updateBuku($where = null, $data = null) { $this->db->update('buku', $data, $where); }
    public function hapusBuku($where = null) { $this->db->delete('buku', $where); }
    
    public function total($field, $where) 
    {
        $this->db->select_sum($field);
        if(!empty($where) && count($where) > 0) { $this->db->where($where); }
        $this->db->from('buku');
        return $this->db->get()->row($field);
    }
    
    //manajemen kategori
    public function getKategori() { return $this->db->get('kategori'); }
    public function kategoriWhere($where) { return $this->db->get_where('kategori', $where); }
    public function simpanKategori($data = null) { $this->db->insert('kategori', $data); }
    public function hapusKategori($where = null) { $this->db->delete('kategori', $where); }
    public function updateKategori($where = null, $data = null) { $this->db->update('kategori', $data, $where); }
    
    //join
    public function joinKategoriBuku($where) { 
        $this->db->from('buku'); 
        $this->db->join('kategori','kategori.id = buku.id_kategori'); 
        $this->db->where($where); 
        return $this->db->get(); 
    }

    public function getLimitBuku() { 
    $this->db->limit(5); 
    return $this->db->get('buku'); 
}
    //Check Jumlah Data
    public function get_count_all() {
        return $this->db->count_all('buku');
    }
    // Get Data Buku
    public function get_buku($limit, $start) {
        $this->db->limit($limit, $start);
        $query = $this->db->get('buku');
 
        return $query->result();
    }
    // Get Data Buku Berdasarkan Kategori
    public function get_buku_kategori($limit, $start, $where) {
        $this->db->where($where);
        $this->db->limit($limit, $start);
        $query = $this->db->get('buku'); 
        return $query->result();
    }

    public function get_count_kategori($where){
        $this->db->select('*');
        $this->db->from('buku');
        $this->db->where($where);
        return $this->db->count_all_results();
    }

    // Model Pencarian

    public function cariBuku()
	{
		$cari = $this->input->GET('judul-buku', TRUE);
		$data = $this->db->query("SELECT * from buku where judul_buku like '%$cari%' ");
		return $data->result();
	}
 

}
