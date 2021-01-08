<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Important_links_model extends Model{
        protected $table='important_links';
        protected $primaryKey='id';
        protected $allowedFields=['icon', 'link', 'text','status'];
    }
