<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Product_image_model extends Model{
        protected $table='product_image';
        protected $primaryKey='id';
        protected $allowedFields=[
            'product_id',
            'image',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by',
        ];
    }
