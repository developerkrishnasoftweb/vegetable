<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Feedback_model extends Model{
        protected $table='feedback';
        protected $primaryKey='id';
        protected $allowedFields=[
            'name',
            'email',
            'mobile',
            'feedback',
            'rating',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by'
        ];
    }
