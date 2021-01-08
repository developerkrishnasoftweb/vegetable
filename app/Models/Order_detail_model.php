<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Order_detail_model extends Model{
        protected $table='order_detail';
        protected $primaryKey='id';
        protected $allowedFields=[
            'order_id',
            'product_id',
            'product_title',
            'quantity',
            'total',
            'price'
        ];
    }
