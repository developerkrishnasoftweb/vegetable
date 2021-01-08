<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Rating_model extends Model{
        protected $table='rating';
        protected $primaryKey='id';
        protected $allowedFields=[
            'customer_id',
            'product_id',
            'score',
            'comment',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
