<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Sub_category_model extends Model{
        protected $table='sub_category';
        protected $primaryKey='id';
        protected $allowedFields=[
            'title',
            'image',
            'category_id',
            'position',
            'home_screen',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
