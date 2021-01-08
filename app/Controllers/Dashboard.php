<?php
namespace App\Controllers;

use App\Models\Admin_model;
use App\Models\Admin_rights_model;
use App\Models\Configuration_model;
use App\Models\Contact_model;
use App\Models\Course_model;
use App\Models\Course_video_model;
use App\Models\Hit_count_model;
use App\Models\Payments_model;
use App\Models\Pending_payment_model;
use App\Models\Student_course_model;
use App\Models\Student_model;
use App\Models\Support_messages_model;
use App\Models\Support_model;
use App\Models\Teacher_model;
use App\Models\Transactions_model;

class Dashboard extends BaseController
{
    function __construct()
    {
        session_start();
        if(!isset($_SESSION['ether'])){
            header('location:'.base_url().'/clogin');
            exit();
        }
    }
    function index()
	{
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['visit']=$menu->query("select count(*) as total from hit_count where `date`='".date('Y-m-d')."'")->getResult('array');
        $data['visitor']=$menu->query("select count(*) as total from hit_count")->getResult('array');
	    return view('admin/dashboard',$data);
	}
    function web_hits(){
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['my3skill']['id']);
        return view('admin/hits',$data);
    }
    public function get_hits(){
        $model=new Hit_count_model();
        $from=$this->request->getVar('from');
        $to=$this->request->getVar('to');
        $data['hits']=$model->query("select * from hit_count where `date` >= '$from' and `date` <= '$to'")->getResult('array');
        return view('admin/feed_hits',$data);
    }
}
