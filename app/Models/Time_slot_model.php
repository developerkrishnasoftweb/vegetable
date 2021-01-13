<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Time_slot_model extends Model{
        protected $table='time_slot';
        protected $primaryKey='id';
        protected $allowedFields=[
            'title',
            'start_time',
            'end_time',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
