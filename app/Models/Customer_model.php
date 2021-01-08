<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Customer_model extends Model{
        protected $table='customer';
        protected $primaryKey='id';
        protected $allowedFields=[
            'first_name',
            'last_name',
            'email',
            'mobile',
            'gender',
            'password',
            'image',
            'status',
            'reg_date',
            'token'
        ];
    }
