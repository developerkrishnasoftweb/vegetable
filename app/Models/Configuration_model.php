<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Configuration_model extends Model{
        protected $table='configuration';
        protected $primaryKey='id';
        protected $allowedFields=['title',
            'logo',
            'contact',
            'email',
            'copyright',
            'address',
            'favicon',
            'meta_description',
            'meta_keywords',
            'pg_charge',
            'currency',
            'timezone',
            'min_order',
            'tax',
            'discount',
            'about',
            'about_meta_description',
            'about_meta_keywords',
            'privacy',
            'privacy_meta_description',
            'privacy_meta_keywords',
            'terms',
            'terms_meta_description',
            'terms_meta_keywords',
            'refund',
            'refund_meta_description',
            'refund_meta_keywords',
            'registration_description',
            'registration_title',
            'checkout_meta_description',
            'checkout_meta_keywords',
            'razorpay_key',
            'razorpay_secret_key',
            'is_offline'
        ];
        function getCount(){
            $res=$this->query("select device_limit from ".$this->table." where id=1")->getResult('array');
            return $res[0]['device_limit'];
        }
        function getPremiumCount(){
            $res=$this->query("select premium_limit from ".$this->table." where id=1")->getResult('array');
            return $res[0]['premium_limit'];
        }
        function getWatchLimit(){
            $res=$this->query("select watch_limit from ".$this->table." where id=1")->getResult('array');
            return $res[0]['watch_limit'];
        }
        function getTypeArray(){
            $type=array();
            $res=$this->query("select * from `type`")->getResult('array');
            foreach ($res as $r)
                $type[$r['id']]=$r['title'];
            return $type;
        }
        function getCityArray(){
            $city=array();
            $res=$this->query("select * from `city`")->getResult('array');
            foreach ($res as $r)
                $city[$r['id']]=$r['name'];
            return $city;
        }
        function getAreaArray(){
            $area=array();
            $res=$this->query("select * from `area`")->getResult('array');
            foreach ($res as $r)
                $area[$r['id']]=$r['name'];
            return $area;
        }

    }
