<?php
    namespace App\Models;
    use CodeIgniter\Database\ConnectionInterface;
    use CodeIgniter\Model;

    class Coupon_model extends  Model{
        protected $table='coupons';
        protected $primaryKey='id';
        protected $allowedFields=['title','code','type','value','link_to','course_id','category_id','limit','start','end','inserted','inserted_by','modified','modified_by','status','redeem_type','minimum','maximum','first_time','student_type','students'];
    }
