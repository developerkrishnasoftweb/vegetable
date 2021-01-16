<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Order_model extends Model{
        protected $table='order';
        protected $primaryKey='id';
        protected $allowedFields=[
            'order_no',
            'delivery_boy_id',
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
            'order_date',
            'order_time',
            'total_price',
            'converted_amount',
            'currency',
            'order_type',
            'payment_mode',
            'payment_status',
            'transaction_type',
            'reference_no',
            'transaction_date',
            'transaction_time',
            'comment',
            'order_status',
        ];
        function getDeliveryBoysArray(){
            $return=[];
            $resp=$this->query("select * from delivery_boy")->getResult('array');
            foreach ($resp as $r)
                $return[$r['id']]=$r['first_name']." ".$r['last_name'];
            return $return;
        }
    }
