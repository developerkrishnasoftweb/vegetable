<?php
namespace App\Controllers;

use App\Models\Admin_model;
use App\Models\Admin_rights_model;
use App\Models\Customer_model;

class Customer extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])) {
            header('location:'.base_url().'/clogin');
            exit();
        }
        $this->model=new Customer_model();
    }

    function index() {
	    $menu=new Admin_rights_model();
	    $utility=new \Utilities();
	    $data=$utility->validateUser();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['customer']=$this->model->orderBy('id','desc')->findAll();
	    return view('admin/customer',$data);
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
}
