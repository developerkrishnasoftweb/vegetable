<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\Category_model;

class Category extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])) {
            header('location:'.base_url().'/clogin');
            exit;
        }
        $this->model=new Category_model();
    }

    function index() {
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['category']=$this->model->query("select d.title as d_title, c.* from category c,department d where c.department_id = d.id")->getResult('array');
        $data['department']=$this->model->query("select * from department where status='y'")->getResult('array');
	    return view('admin/category', $data);
    }

    public function insert() {
        helper(['form', 'url']);
        $data = array(
            'department_id' => $this->request->getVar('department_id'),
            'title' => $this->request->getVar('title'),
            'position' => $this->request->getVar('position'),
            'home_screen' => $this->request->getVar('home_screen'),
            'status'  => 'y',
            'inserted_at'  => date('Y-m-d H:i:s'),
            'inserted_by'  => $_SESSION['ether']['id']
        );
        if($_FILES['image']['name']!="") {
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['image']['name']);
            $filename=date('YmdHis').".".$type[count($type)-1];
            $_SESSION['file']=$filename;
            move_uploaded_file($_FILES['image']['tmp_name'],"assets/images/category/".$filename);
            $data['image']="assets/images/category/".$filename;
        }
        $save = $this->model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/Category" );
    }

    public function modify($id = null) {
        $data['modify'] = $this->model->where('id', $id)->first();
        echo json_encode($data['modify']);
    }

    public function update() {
        $data = array(
            'id' => $this->request->getVar('id'),
            'department_id' => $this->request->getVar('department_id'),
            'title' => $this->request->getVar('title'),
            'position' => $this->request->getVar('position'),
            'home_screen' => $this->request->getVar('home_screen'),
            'modified_at'  => date('Y-m-d H:i:s'),
            'modified_by'  => $_SESSION['ether']['id'],
        );
        if($_FILES['image']['name']!="") {
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['image']['name']);
            $filename=date('YmdHis').".".$type[count($type)-1];
            $_SESSION['file']=$filename;
            move_uploaded_file($_FILES['image']['tmp_name'],"assets/images/category/".$filename);
            $data['image']="assets/images/category/".$filename;
        }
        $save = $this->model->save($data);
        return redirect()->to( base_url()."/Category" );
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
