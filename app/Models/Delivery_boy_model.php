<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Delivery_boy_model extends Model{
        protected $table='delivery_boy';
        protected $primaryKey='id';
        protected $allowedFields=[
            'first_name',
            'last_name',
            'email',
            'mobile',
            'gender',
            'password',
            'image',
            'available',
            'status',
            'reg_date'
        ];
    }
