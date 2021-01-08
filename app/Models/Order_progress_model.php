<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Order_progress_model extends Model{
        protected $table='order_progress';
        protected $primaryKey='id';
        protected $allowedFields=[
            'order_id',
            'order_status',
            'comment',
            'notify',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
