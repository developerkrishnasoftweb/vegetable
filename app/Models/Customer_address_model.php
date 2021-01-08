<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Customer_address_model extends Model{
        protected $table='customer_address';
        protected $primaryKey='id';
        protected $allowedFields=[
            'customer_id',
            'name',
            'email',
            'mobile',
            'address1',
            'address2',
            'landmark',
            'area',
            'pincode',
            'state',
            'city',
            'type',
            'status'
        ];
    }
