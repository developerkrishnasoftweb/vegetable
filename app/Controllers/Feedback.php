<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\Feedback_model;

class Feedback extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])){
            header('location:'.base_url().'/clogin');
            exit;
        }
        $this->model=new Feedback_model();
    }

    function index() {
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['feedback']=$this->model->query("select * from feedback")->getResult('array');
	    return view('admin/feedback', $data);
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
