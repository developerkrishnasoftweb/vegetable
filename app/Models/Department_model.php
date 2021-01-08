<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Department_model extends Model{
        protected $table='department';
        protected $primaryKey='id';
        protected $allowedFields=[
            'title',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
