<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class State_model extends Model{
        protected $table='state';
        protected $primaryKey='id';
        protected $allowedFields=[
            'title',
            'country_id',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
