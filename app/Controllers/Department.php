<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\Category_model;
use App\Models\Department_model;

class Department extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])) {
            header('location:'.base_url().'/clogin');
            exit;
        }
        $this->model=new Department_model();
    }

    function index() {
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['department']=$this->model->query("select * from department")->getResult('array');
	    return view('admin/department', $data);
    }

    public function insert() {
        helper(['form', 'url']);
        $department = explode(',',$this->request->getVar('title'));
        foreach ($department as $d) {
            $data = array(
                'title' => $d,
                'status' => 'y',
                'inserted_at' => date('Y-m-d H:i:s'),
                'inserted_by' => $_SESSION['ether']['id']
            );
            $save = $this->model->save($data);
        }
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/department" );
    }

    public function modify($id = null) {
        $data['modify'] = $this->model->where('id', $id)->first();
        echo json_encode($data['modify']);
    }

    public function update() {
        $data = array(
            'id' => $this->request->getVar('id'),
            'title' => $this->request->getVar('title'),
            'modified_at'  => date('Y-m-d H:i:s'),
            'modified_by'  => $_SESSION['ether']['id'],
        );
        $save = $this->model->save($data);
        return redirect()->to( base_url()."/department" );
    }

    public function delete($id = null) {
        $this->model->where('id', $id)->delete();
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
