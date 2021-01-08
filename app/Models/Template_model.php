<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Template_model extends Model{
        protected $table='template';
        protected $primaryKey='id';
        protected $allowedFields=[
            'template',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
