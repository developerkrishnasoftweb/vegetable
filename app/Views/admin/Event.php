<?php
namespace App\Controllers;

use App\Models\Admin_model;
use App\Models\Admin_rights_model;
use App\Models\Blogs_model;
use App\Models\Category_model;
use App\Models\Event_Image_model;
use App\Models\Event_model;
use App\Models\Student_model;

class Event extends BaseController
{
    protected $model;
    function __construct()
    {
        session_start();
        if(!isset($_SESSION['donation'])){
            header('location:'.base_url().'/clogin');
            exit;
        }
        $this->model=new Event_model();
        $this->event_img=new Event_Image_model();
    }

    function index()
	{
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['donation']['id']);
        $data['event']=$this->model->orderBy('id','desc')->findAll();
	    return view('admin/event',$data);
	}
    public function insert()
    {
        helper(['form', 'url']);
        $data = array(
            'title' => $this->request->getVar('title'),
            'short_details' => $this->request->getVar('short_details'),
            'long_details' => $this->request->getVar('long_details'),
            'image' => 'assets/images/noimage.png',
            'date' =>  $this->request->getVar('date'),
            'start_time' =>  $this->request->getVar('start_time'),
            'end_time' =>  $this->request->getVar('end_time'),
            'venue' =>  $this->request->getVar('venue'),
            'inserted'  => date('Y-m-d H:i:s'),
            'status'  => 'y'
        );
        //print_r($data);
        if($_FILES['image']['name']!=""){
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['image']['name']);
            $filename=date('YmdHis').".".$type[count($type)-1];
            $_SESSION['file']=$filename;
            move_uploaded_file($_FILES['image']['tmp_name'],"assets/images/".$filename);
            $data['image']="assets/images/".$filename;
        }
        $save = $this->model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/event" );
    }

    public function modify($id = null)
    {
        $data['modify'] = $this->model->where('id', $id)->first();
        echo json_encode($data['modify']);
    }

    public function update()
    {
        $data = array(
            'id' => $this->request->getVar('id'),
            'title' => $this->request->getVar('title'),
            'short_details' => $this->request->getVar('short_details'),
            'long_details' => $this->request->getVar('long_details'),
            'image' => 'assets/images/noimage.png',
            'date' =>  $this->request->getVar('date'),
            'start_time' =>  $this->request->getVar('start_time'),
            'end_time' =>  $this->request->getVar('end_time'),
            'venue' =>  $this->request->getVar('venue'),
            'modified'  => date('Y-m-d H:i:s'),
            'status'  => 'y'
        );
        if($_FILES['image']['name']!=""){
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['image']['name']);
            $filename=date('YmdHis').".".$type[count($type)-1];
            $_SESSION['file']=$filename;
            move_uploaded_file($_FILES['image']['tmp_name'],"assets/images/".$filename);
            $data['image']="assets/images/".$filename;
        }
        $save = $this->model->save($data);
        return redirect()->to( base_url()."/event" );
    }

    public function delete($id = null)
    {
        $modify=$this->model->where('id', $id)->first();
        $this->model->where('id', $id)->delete();
        @unlink($modify['image']);
        return 'yes';
    }
    function status_change(){
        $data=[
            'id' => $this->request->getVar('id'),
            'status' => $this->request->getVar('status')
        ];
        $this->model->save($data);
        echo 'yes';
    }
    function remove_all(){
        $this->model->truncate();
        return 'yes';
    }
    function remove_selected(){
        $ids=$this->request->getVar('ids');
        foreach ($ids as $id){
            @$this->model->where('id',$id)->delete();
        }
        echo 'yes';
    }
    function event_gallery($id){
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['donation']['id']);
        $data['event_img']=$this->event_img->query("select * from event_gallery where event_id=$id")->getResult('array');
        $data['id']=$id;
        return view('admin/event_gallery',$data);
    }
    function add_event_img(){
        $hid=$this->request->getVar('hid');
        $data=array(
            'event_id' => $hid,
        );
        $cnt=1;
        foreach ($_FILES['image']['name'] as $key=>$val ){
            $type=explode('.',$_FILES['image']['name'][$key]);
            $names=explode('.',$_FILES['image']['name'][$key]);;
            $name=date('YmdHis')."$cnt.".$type[count($type)-1];
            move_uploaded_file($_FILES['image']['tmp_name'][$key],"assets/images/".$name);
            $data['image']="assets/images/".$name;
            $this->event_img->save($data);
            $cnt++;
        }
        $bid=$_SESSION['businesses']['id'];
        $data['category_img']=$this->event_img->query("select * from event_gallery where event_id=$hid")->getResult('array');
        header('location:'.base_url().'/event/event_gallery/'.$hid);
        exit;
    }
    function delete_event_image($id){
        $hid=$this->request->getVar('id');
        $modify=$this->event_img->where('id', $id)->first();
        $this->event_img->where('id', $id)->delete();
        @unlink($modify['image']);
        header('location:'.base_url().'/event/event_gallery/'.$hid);
    }
}
