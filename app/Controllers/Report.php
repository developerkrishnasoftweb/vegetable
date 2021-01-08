<?php
namespace App\Controllers;

use App\Models\Admin_model;
use App\Models\Admin_rights_model;
use App\Models\Order_model;

class Report extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])) {
            header('location:'.base_url().'/clogin');
            exit();
        }
        $this->model=new Order_model();
    }

    function date_wise() {
	    $menu=new Admin_rights_model();
	    $utility=new \Utilities();
	    $data=$utility->validateUser();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
	    return view('admin/report/date_wise',$data);
    }

    function city_wise() {
	    $menu=new Admin_rights_model();
	    $utility=new \Utilities();
	    $data=$utility->validateUser();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
	    return view('admin/report/city_wise',$data);
    }

    function customer_wise() {
	    $menu=new Admin_rights_model();
	    $utility=new \Utilities();
	    $data=$utility->validateUser();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['customer']=$this->model->query('select * from customer')->getResult('array');
	    return view('admin/report/customer_wise',$data);
    }

    function invoice($order_id) {
	    $menu=new Admin_rights_model();
	    $utility=new \Utilities();
        $data=$utility->validateUser();
        $order_data = $this->model->query("select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id and o.id=? order by datetime desc", array($order_id))->getResult('array');
        $data = array();
        foreach($order_data as $order) {
            $order['products'] = $this->model->query("select od.product_id, p.title, p.short_info, p.image, p.unit, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
            $data['order'] = $order;
        }
        $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
	    return view('admin/report/invoice',$data);
    }

    function get_date_wise() {
	    $menu=new Admin_rights_model();
	    $utility=new \Utilities();
	    $data=$utility->validateUser();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['order']=$this->model->query('select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id and o.order_date between ? and ? order by datetime desc', array($this->request->getVar('from_date'), $this->request->getVar('to_date')))->getResult('array');
	    return view('admin/report/report', $data);
    }

    function get_city_wise() {
	    $menu=new Admin_rights_model();
	    $utility=new \Utilities();
	    $data=$utility->validateUser();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['order']=$this->model->query('select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id and LOWER(o.city) = LOWER(?) order by datetime desc', array($this->request->getVar('city')))->getResult('array');
	    return view('admin/report/report', $data);
    }

    function get_customer_wise() {
	    $menu=new Admin_rights_model();
	    $utility=new \Utilities();
	    $data=$utility->validateUser();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['order']=$this->model->query('select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id and o.customer_id = ? order by datetime desc', array($this->request->getVar('customer_id')))->getResult('array');
	    return view('admin/report/report', $data);
    }

}
