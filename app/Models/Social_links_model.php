<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Social_links_model extends Model{
        protected $table='social_links';
        protected $primaryKey='id';
        protected $allowedFields=['icon', 'link', 'text','status'];
    }
