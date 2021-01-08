<?php
namespace App\Controllers;

use App\Models\Admin_model;
use App\Models\Admin_rights_model;
use App\Models\Master_model;
use App\Models\Student_model;

class Master extends BaseController
{
    protected $model;
    function __construct()
    {
        session_start();
        if(!isset($_SESSION['ether'])){
            header('location:'.base_url().'/clogin');
            exit();
        }
        $this->model=new Master_model();
    }

    function index()
	{
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['master']=$this->model->orderBy('id','desc')->findAll();
        $data['parent']=$menu->get_parent_array();
	    return view('admin/master',$data);
	}
    public function insert()
    {
        helper(['form', 'url']);
        $data = array(
            'title' => $this->request->getVar('title'),
            'link'  => $this->request->getVar('link'),
            'parent_id'  => $this->request->getVar('parent'),
            'icon'  => $this->request->getVar('icon'),
            'position'  => $this->request->getVar('position'),
            'inserted_at'  => date('Y-m-d H:i:s'),
            'inserted_by'  => $_SESSION['ether']['id'],
            'status'  => 'y'
        );
        $save = $this->model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/master" );
    }

    public function modify($id = null)
    {
        $data['modify'] = $this->model->where('id', $id)->first();
//        $this->model->query("insert into student(`name`,`email`,`mobile`) values('Deepak','deepakprn78@gmail.com','7878868606')",false);
//        $data['users']=$this->model->query("select * from users order by id desc",false)->getResult('array');
        echo json_encode($data['modify']);
    }

    public function update()
    {
        $data = array(
            'id' => $this->request->getVar('hid'),
            'title' => $this->request->getVar('title'),
            'link'  => $this->request->getVar('link'),
            'parent_id'  => $this->request->getVar('parent'),
            'icon'  => $this->request->getVar('icon'),
            'position'  => $this->request->getVar('position'),
            'modified_at'  => date('Y-m-d H:i:s'),
            'modified_by'  => $_SESSION['ether']['id'],
        );
        $save = $this->model->save($data);
        return redirect()->to( base_url()."/master" );
    }

    public function delete($id = null)
    {
        $modify=$this->model->where('id', $id)->first();
        $this->model->where('id', $id)->delete();
        return redirect()->to( base_url()."/master" );
    }
    function status_change(){
        $data=[
            'id' => $this->request->getVar('id'),
            'status' => $this->request->getVar('status')
        ];
        $this->model->save($data);
        echo 'yes';
    }
    function get_admin_rights($admin){
        $model=new Admin_rights_model();
        $rights=$model->query("select * from admin_rights where admin_id=$admin");
        $all=array();
        foreach ($rights as $r)
            $all[]=$r['master_id'];
        echo implode('^',$all);
    }
    function save_rights(){
        $model=new Admin_rights_model();
        $admin=$this->request->getVar('admin');
        $rights=$this->request->getVar('rights');
        $model->query("delete from admin_rights where admin_id=$admin");
        foreach ($rights as $r)
            $model->save(array('admin_id' => $admin , 'master_id' => $r));
        echo 'yes';
    }
}
