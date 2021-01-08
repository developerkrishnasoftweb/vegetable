<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Cart_model extends Model{
        protected $table='cart';
        protected $primaryKey='id';
        protected $allowedFields=[
            'customer_id',
            'product_id',
            'quantity'
        ];
    }
