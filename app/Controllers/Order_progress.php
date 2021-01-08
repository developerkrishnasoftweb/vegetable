<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\Order_progress_model;

class Order_progress extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])){
            header('location:'.base_url().'/clogin');
            exit;
        }
        $this->model=new Order_progress_model();
    }

    function index() {
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['order']=$this->model->query('select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id order by datetime desc')->getResult('array');
        $data['order_status']=$this->model->query("select * from order_status")->getResult('array');
        $data['order_progress']=$this->model->query("select o.order_no, op.*, od.product_id, od.product_title, od.quantity, od.total from `order` o, order_progress op, order_detail od where op.order_id=od.order_id and op.order_id=o.id")->getResult('array');
        return view('admin/order_progress', $data);
    }

    public function insert() {
        helper(['form', 'url']);
        $data = array(
            'order_id' => $this->request->getVar('order_id'),
            'order_status' => $this->request->getVar('order_status'),
            'comment' => $this->request->getVar('comment'),
            'notify' => $this->request->getVar('notify'),
            'status'  => 'y',
            'inserted_at'  => date('Y-m-d H:i:s'),
            'inserted_by'  => $_SESSION['ether']['id']
        );
        $save = $this->model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/order_progress" );
    }

    public function modify($id = null) {
        $data['modify'] = $this->model->where('id', $id)->first();
        echo json_encode($data['modify']);
    }

    public function update() {
        $data = array(
            'id' => $this->request->getVar('id'),
            'order_id' => $this->request->getVar('order_id'),
            'order_status' => $this->request->getVar('order_status'),
            'comment' => $this->request->getVar('comment'),
            'notify' => $this->request->getVar('notify'),
            'modified_at'  => date('Y-m-d H:i:s'),
            'modified_by'  => $_SESSION['ether']['id'],
        );
        $save = $this->model->save($data);
        return redirect()->to( base_url()."/order_progress" );
    }

    public function delete($id = null) {
        $modify=$this->model->where('id', $id)->first();
        $this->model->where('id', $id)->delete();
        @unlink($modify['image']);
        return 'yes';
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
}
