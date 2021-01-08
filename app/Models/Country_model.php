<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Country_model extends Model{
        protected $table='country';
        protected $primaryKey='id';
        protected $allowedFields=[
            'title',
            'code',
            'dial_code',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
