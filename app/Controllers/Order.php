<?php
namespace App\Controllers;

use App\Models\Admin_model;
use App\Models\Admin_rights_model;
use App\Models\Customer_model;
use App\Models\Order_model;
use App\Models\Order_progress_model;

class Order extends BaseController {
    protected $model,$utilities;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])) {
            header('location:'.base_url().'/clogin');
            exit();
        }
        $this->model=new Order_model();
        $this->utilities=new \Utilities();
    }

    function index() {
	    $menu=new Admin_rights_model();
	    $utility=new \Utilities();
	    $data=$utility->validateUser();
	    $data['boys']=$this->model->getDeliveryBoysArray();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['order']=$this->model->query('select o.*,c.first_name,c.last_name,c.mobile,c.email from `order` o,customer c where o.customer_id=c.id order by o.id desc')->getResult('array');
	    return view('admin/order',$data);
    }

    public function delete($id = null) {
        $modify=$this->model->where('id', $id)->first();
        $this->model->where('id', $id)->delete();
        @unlink($modify['image']);
        echo 'yes';
    }

    function status_change() {
        $data=[
            'id' => $this->request->getVar('id'),
            'status' => $this->request->getVar('status')
        ];
        $this->model->save($data);
        echo 'yes';
    }

    function remove_selected() {
        $ids=$this->request->getVar('ids');
        foreach ($ids as $id){
            @$this->model->where('id',$id)->delete();
        }
        echo 'yes';
    }
    function update_status(){
        $data=[
            'order_id' => $this->request->getVar('hid'),
            'order_status' => $this->request->getVar('orderStatus'),
            'comment' => $this->request->getVar('message'),
            'notify' => $this->request->getVar('notify')=="y"?"y":"n",
            'inserted_at' => date('Y-m-d H:i:s'),
            'inserted_by' => isset($_SESSION['ether']['id'])?$_SESSION['ether']['id']:0
        ];
        $model=new Order_progress_model();
        $model->save($data);
        $orderDetail=$this->model->where('id',$data['order_id'])->first();
        $cust=new Customer_model();
        $customer=$cust->where('id',$orderDetail['customer_id'])->first();
        $this->model->save(array('id' => $data['order_id'],'order_status' => $data['order_status']));
        if($data['notify']=='y'){
            $this->utilities->push_notification('Hurray Update on your Order',array($customer['token']),$data['comment']);
        }
        echo json_encode(array('status' => 'true'));
    }
    function assign_order(){
        $data=[
            'id' => $this->request->getVar('orderId'),
            'delivery_boy_id' => $this->request->getVar('delivery_boy')
        ];
        $this->model->save($data);
        echo json_encode(array('status' => 'true'));
    }
}
