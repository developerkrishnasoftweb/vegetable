<?php
namespace App\Controllers;

use App\Models\Admin_model;
use App\Models\Admin_rights_model;
use App\Models\Delivery_boy_model;

class Delivery_boy extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])) {
            header('location:'.base_url().'/clogin');
            exit();
        }
        $this->model=new Delivery_boy_model();
    }

    function index() {
	    $menu=new Admin_rights_model();
	    $utility=new \Utilities();
	    $data=$utility->validateUser();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['delivery_boy']=$this->model->orderBy('id','desc')->findAll();
	    return view('admin/delivery_boy',$data);
    }
    function insert() {
        $data = array(
            'first_name' => $this->request->getVar('first_name'),
            'last_name'  => $this->request->getVar('last_name'),
            'email'  => $this->request->getVar('email'),
            'mobile'  => $this->request->getVar('mobile'),
            'image'  => 'assets/images/noimage.png',
            'password'  => $this->request->getVar('password'),
            'gender'  => $this->request->getVar('gender'),
            'inserted_at'  => date('Y-m-d H:i:s'),
            'inserted_by'  => $_SESSION['ether']['id'],
            'status'  => 'y'
        );
        if($_FILES['image']['name']!=""){
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['image']['name']);
            $filename=date('YmdHis').".".$type[count($type)-1];
            $_SESSION['file']=$filename;
            move_uploaded_file($_FILES['image']['tmp_name'],"assets/images/admin/".$filename);
            $data['image']="assets/images/admin/".$filename;
        }
        $save = $this->model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/delivery_boy" );
    }
    public function delete($id = null) {
        $modify=$this->model->where('id', $id)->first();
        $this->model->where('id', $id)->delete();
        if(basename($modify['image']!="noimage.png"))
            @unlink($modify['image']);
        echo 'yes';
    }
    public function modify($id = null)
    {
        $data['modify'] = $this->model->where('id', $id)->first();
//        $this->model->query("insert into student(`name`,`email`,`mobile`) values('Deepak','deepakprn78@gmail.com','7878868606')",false);
//        $data['users']=$this->model->query("select * from users order by id desc",false)->getResult('array');
        echo json_encode($data['modify']);
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
