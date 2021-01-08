<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Banner_model extends Model{
        protected $table='banner';
        protected $primaryKey='id';
        protected $allowedFields=[
            'title',
            'image',
            'category_id',
            'position',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
