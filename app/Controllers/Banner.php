<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\Banner_model;

class Banner extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])) {
            header('location:'.base_url().'/clogin');
            exit;
        }
        $this->model=new Banner_model();
    }

    function index() {
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['category']=$this->model->query("select * from category")->getResult('array');
        $data['banner']=$this->model->query("select b.*, c.title as category from banner b, category c where b.category_id=c.id")->getResult('array');
	    return view('admin/banner', $data);
    }

    public function insert() {
        helper(['form', 'url']);
        $data = array(
            'title' => $this->request->getVar('title'),
            'category_id' => $this->request->getVar('category_id'),
            'position' => $this->request->getVar('position'),
            'status'  => 'y',
            'inserted_at'  => date('Y-m-d H:i:s'),
            'inserted_by'  => $_SESSION['ether']['id']
        );
        if($_FILES['image']['name']!="") {
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['image']['name']);
            $filename=date('YmdHis').".".$type[count($type)-1];
            $_SESSION['file']=$filename;
            move_uploaded_file($_FILES['image']['tmp_name'],"assets/images/banner/".$filename);
            $data['image']="assets/images/banner/".$filename;
        }
        $save = $this->model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/banner" );
    }

    public function modify($id = null) {
        $data['modify'] = $this->model->where('id', $id)->first();
        echo json_encode($data['modify']);
    }

    public function update() {
        $data = array(
            'id' => $this->request->getVar('id'),
            'title' => $this->request->getVar('title'),
            'category_id' => $this->request->getVar('category_id'),
            'position' => $this->request->getVar('position'),
            'modified_at'  => date('Y-m-d H:i:s'),
            'modified_by'  => $_SESSION['ether']['id'],
        );
        if($_FILES['image']['name']!="") {
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['image']['name']);
            $filename=date('YmdHis').".".$type[count($type)-1];
            $_SESSION['file']=$filename;
            move_uploaded_file($_FILES['image']['tmp_name'],"assets/images/banner/".$filename);
            $data['image']="assets/images/banner/".$filename;
        }
        $save = $this->model->save($data);
        return redirect()->to( base_url()."/banner" );
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
