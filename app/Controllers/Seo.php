<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\Configuration_model;
use App\Models\Social_links_model;
use App\Models\Important_links_model;

class Seo extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])){
            header('location:'.base_url().'/clogin');
            exit;
        }
        $this->model=new Configuration_model();
        $this->social_model=new Social_links_model();
        $this->important_model=new Important_links_model();
    }

    public function home() {
        if($this->request->getVar('description')) {
            $data = array(
                'id' => '1',
                'meta_description' => $this->request->getVar('description'),
                'meta_keywords' => $this->request->getVar('keywords')
            );
            $save = $this->model->save($data);
            $_SESSION['inserted']=1;
            return redirect()->to( base_url()."/seo/home");
        } else {
            $utility=new \Utilities();
            $data=$utility->validateUser();
            $menu=new Admin_rights_model();
            $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
            $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
            return view('admin/seo/home',$data);
        }
    }

    public function about_us() {
        if($this->request->getVar('description')) {
            $data = array(
                'id' => '1',
                'about_meta_description' => $this->request->getVar('description'),
                'about_meta_keywords' => $this->request->getVar('keywords')
            );
            $save = $this->model->save($data);
            $_SESSION['inserted']=1;
            return redirect()->to( base_url()."/seo/about_us");
        } else {
            $utility=new \Utilities();
            $data=$utility->validateUser();
            $menu=new Admin_rights_model();
            $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
            $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
            return view('admin/seo/about',$data);
        }
    }

    public function privacy_policy() {
        if($this->request->getVar('description')) {
            $data = array(
                'id' => '1',
                'privacy_meta_description' => $this->request->getVar('description'),
                'privacy_meta_keywords' => $this->request->getVar('keywords')
            );
            $save = $this->model->save($data);
            $_SESSION['inserted']=1;
            return redirect()->to( base_url()."/seo/privacy_policy");
        } else {
            $utility=new \Utilities();
            $data=$utility->validateUser();
            $menu=new Admin_rights_model();
            $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
            $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
            return view('admin/seo/privacy',$data);
        }
    }

    public function terms_and_condition() {
        if($this->request->getVar('description')) {
            $data = array(
                'id' => '1',
                'terms_meta_description' => $this->request->getVar('description'),
                'terms_meta_keywords' => $this->request->getVar('keywords')
            );
            $save = $this->model->save($data);
            $_SESSION['inserted']=1;
            return redirect()->to( base_url()."/seo/terms_and_condition");
        } else {
            $utility=new \Utilities();
            $data=$utility->validateUser();
            $menu=new Admin_rights_model();
            $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
            $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
            return view('admin/seo/terms',$data);
        }
    }

    public function refund_policy() {
        if($this->request->getVar('description')) {
            $data = array(
                'id' => '1',
                'refund_meta_description' => $this->request->getVar('description'),
                'refund_meta_keywords' => $this->request->getVar('keywords')
            );
            $save = $this->model->save($data);
            $_SESSION['inserted']=1;
            return redirect()->to( base_url()."/seo/refund_policy");
        } else {
            $utility=new \Utilities();
            $data=$utility->validateUser();
            $menu=new Admin_rights_model();
            $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
            $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
            return view('admin/seo/refund',$data);
        }
    }

    public function checkout() {
        if($this->request->getVar('description')) {
            $data = array(
                'id' => '1',
                'checkout_meta_description' => $this->request->getVar('description'),
                'checkout_meta_keywords' => $this->request->getVar('keywords')
            );
            $save = $this->model->save($data);
            $_SESSION['inserted']=1;
            return redirect()->to( base_url()."/seo/checkout");
        } else {
            $utility=new \Utilities();
            $data=$utility->validateUser();
            $menu=new Admin_rights_model();
            $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
            $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
            return view('admin/seo/checkout',$data);
        }
    }
}
