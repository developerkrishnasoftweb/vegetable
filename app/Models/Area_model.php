<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Area_model extends Model{
        protected $table='area';
        protected $primaryKey='id';
        protected $allowedFields=[
            'title',
            'pincode',
            'charge',
            'city_id',
            'state_id',
            'country_id',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
