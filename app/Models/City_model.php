<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class City_model extends Model{
        protected $table='city';
        protected $primaryKey='id';
        protected $allowedFields=[
            'title',
            'state_id',
            'country_id',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
