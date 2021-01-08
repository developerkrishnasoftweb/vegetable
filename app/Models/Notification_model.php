<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Notification_model extends Model{
        protected $table='notification';
        protected $primaryKey='id';
        protected $allowedFields=[
            'delivery_boy_id',
            'order_id',
            'message',
            'type',
            'datetime',
        ];
    }
