<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\City_model;

class City extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])){
            header('location:'.base_url().'/clogin');
            exit;
        }
        $this->model=new City_model();
    }

    function index() {
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['country']=$this->model->query("select * from country")->getResult('array');
        $data['state']=$this->model->query("select * from state")->getResult('array');
        $data['city']=$this->model->query("select c.*, s.title as state, co.title as country from city c, state s, country co where c.state_id = s.id and c.country_id = co.id")->getResult('array');
	    return view('admin/city', $data);
    }
    
    public function insert() {
        helper(['form', 'url']);
        $data = array(
            'title' => $this->request->getVar('title'),
            'state_id' => $this->request->getVar('state_id'),
            'country_id' => $this->request->getVar('country_id'),
            'status'  => 'y',
            'inserted_at'  => date('Y-m-d H:i:s'),
            'inserted_by'  => $_SESSION['ether']['id']
        );
        $save = $this->model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/city" );
    }

    public function modify($id = null) {
        $data['modify'] = $this->model->where('id', $id)->first();
        echo json_encode($data['modify']);
    }

    public function country() {
        $data = $this->model->query("select * from country")->getResult('array');
        echo json_encode($data);
    }

    public function state($id = null) {
        if($id != NULL) {
            $data = $this->model->query("select * from state where country_id = ?", array($id))->getResult('array');
        } else {
            $data = $this->model->query("select * from state")->getResult('array');
        }
        echo json_encode($data);
    }

    public function update() {
        $data = array(
            'id' => $this->request->getVar('id'),
            'title' => $this->request->getVar('title'),
            'state_id' => $this->request->getVar('state_id'),
            'country_id' => $this->request->getVar('country_id'),
            'modified_at'  => date('Y-m-d H:i:s'),
            'modified_by'  => $_SESSION['ether']['id'],
        );
        $save = $this->model->save($data);
        return redirect()->to( base_url()."/city" );
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
