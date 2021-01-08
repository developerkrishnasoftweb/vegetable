<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Category_model extends Model{
        protected $table='category';
        protected $primaryKey='id';
        protected $allowedFields=[
            'department_id',
            'title',
            'image',
            'position',
            'home_screen',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
