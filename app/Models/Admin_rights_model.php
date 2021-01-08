<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Admin_rights_model extends Model{
        protected $table='admin_rights';
        protected $primaryKey='id';
        protected $allowedFields=['admin_id','master_id','ins','del','modi'];
        function get_menus($id){
            $response=array();
            if($_SESSION['ether']['type']=="user")
                $ans=$this->query("select m.* from master m,admin_rights ar where ar.master_id=m.id and ar.admin_id=$id and m.parent_id=0 order by m.position")->getResult('array');
            else
                $ans=$this->query('select * from master where parent_id=0 order by `position`')->getResult('array');
            $response['menu']=$ans;
            foreach ($ans as $a){
                if($_SESSION['ether']['type']=="user")
                    $response['submenu'][$a['id']]=$this->query("select m.* from master m,admin_rights ar where ar.master_id=m.id and ar.admin_id=$id and m.parent_id=".$a['id']." order by m.position")->getResult('array');
                else
                    $response['submenu'][$a['id']]=$this->query("select * from master where parent_id=".$a['id']." order by `position`")->getResult('array');
            }
            return $response;
        }
        function get_parent_array(){
            $info=array();
            $res=$this->query("select * from master where parent_id=0")->getResult('array');
            foreach ($res as $r)
                $info[$r['id']]=$r['title'];
            return $info;
        }
        function check_permission($url,$id){
            $resp=$this->query("select ar.* from admin_rights ar,master m,admin a where ar.master_id=m.id and ar.admin_id=a.id and m.link like '%$url'")->getResult('array');
            return $resp;
        }
    }
