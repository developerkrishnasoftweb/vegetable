<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Master_model extends Model{
        protected $table='master';
        protected $primaryKey='id';
        protected $allowedFields=['title','text','link','icon','status','inserted_at','inserted_by','modified_at','modified_by','position','parent_id'];
    }
