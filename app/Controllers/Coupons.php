<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\Coupon_model;

class Coupons extends BaseController
{
    protected $model;
    function __construct()
    {
        session_start();
        if(!isset($_SESSION['ether'])){
            header('location:'.base_url().'/clogin');
            exit;
        }
        $this->model=new Coupon_model();
    }

    function index()
	{
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['coupon']=$this->model->orderBy('id','desc')->findAll();
	    return view('admin/coupon',$data);
	}
    public function insert()
    {
        if($this->request->getVar('student')!="")
            $students=implode(',',$this->request->getVar('student'));
        else
            $students="";
        $data = array(
            'title' => $this->request->getVar('title'),
            'code'  => $this->request->getVar('code'),
            'type'  => $this->request->getVar('type'),
            'limit'  => $this->request->getVar('limit'),
            'value'  => $this->request->getVar('value'),
            'start'  => $this->request->getVar('start'),
            'end'  => $this->request->getVar('end'),
            'minimum'  => $this->request->getVar('minimum'),
            'maximum'  => $this->request->getVar('maximum'),
            'first_time'  => $this->request->getVar('first_time'),
            'inserted'  => date('Y-m-d H:i:s'),
            'inserted_by'  => $_SESSION['ether']['id'],
            'status'  => 'y'
        );
        $save = $this->model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/coupons" );
    }

    public function modify($id = null)
    {
        $data['modify'] = $this->model->where('id', $id)->first();
        echo json_encode($data['modify']);
    }

    public function update()
    {
        if($this->request->getVar('student')!="")
            $students=implode(',',$this->request->getVar('student'));
        else
            $students="";
        $data = array(
            'id' => $this->request->getVar('id'),
            'title' => $this->request->getVar('title'),
            'code'  => $this->request->getVar('code'),
            'type'  => $this->request->getVar('type'),
            'link_to'  => $this->request->getVar('linked'),
            'course_id'  => $this->request->getVar('course'),
            'category_id'  => $this->request->getVar('category'),
            'limit'  => $this->request->getVar('limit'),
            'value'  => $this->request->getVar('value'),
            'start'  => $this->request->getVar('start'),
            'end'  => $this->request->getVar('end'),
            'redeem_type'  => $this->request->getVar('redeem_type'),
            'student_type'  => $this->request->getVar('student_type'),
            'students'  => $students,
            'minimum'  => $this->request->getVar('minimum'),
            'maximum'  => $this->request->getVar('maximum'),
            'first_time'  => $this->request->getVar('first_time'),
            'modified'  => date('Y-m-d H:i:s'),
            'modified_by'  => $_SESSION['ether']['id'],
        );
        $save = $this->model->save($data);
        return redirect()->to( base_url()."/coupons" );
    }

    public function delete($id = null)
    {
        $modify=$this->model->where('id', $id)->first();
        $this->model->where('id', $id)->delete();
        @unlink($modify['image']);
        return redirect()->to( base_url()."/coupons" );
    }
    function status_change(){
        $data=[
            'id' => $this->request->getVar('id'),
            'status' => $this->request->getVar('status')
        ];
        $this->model->save($data);
        echo 'yes';
    }
    function remove_selected(){
        $ids=$this->request->getVar('ids');
        foreach ($ids as $id){
            @$this->model->where('id',$id)->delete();
        }
        echo 'yes';
    }
}
