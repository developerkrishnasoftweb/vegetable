<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Product_model extends Model{
        protected $table='product';
        protected $primaryKey='id';
        protected $allowedFields=[
            'category_id',
            'sub_category_id',
            'seller_id',
            'title',
            'short_info',
            'long_info',
            'image',
            'price',
            'display_price',
            'unit',
            'unit_value',
            'quantity',
            'package_count',
            'featured',
            'oos',
            'popular',
            'home_product',
            'status',
            'inserted_at',
            'inserted_by',
            'modified_at',
            'modified_by',
        ];
        function getProductTitle($product){
            $res=$this->where('id',$product)->first();
            return $res['title'];
        }
    }
