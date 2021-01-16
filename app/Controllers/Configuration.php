<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\Configuration_model;
use App\Models\Social_links_model;
use App\Models\Important_links_model;

class Configuration extends BaseController {
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

    function index() {
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
	    return view('admin/configuration/web_configuration',$data);
    }

    public function insert() {
        $data = array(
            'id' => '1',
            'title' => $this->request->getVar('title'),
            'contact' => $this->request->getVar('contact'),
            'email' => $this->request->getVar('email'),
            'copyright' => $this->request->getVar('copyright'),
            'address' => $this->request->getVar('address'),
            'meta_description' => $this->request->getVar('description'),
            'meta_keywords' => $this->request->getVar('keywords'),
            'analytic_key' => $this->request->getVar('analytic_key'),
            'currency' => $this->request->getVar('currency'),
            'timezone' => $this->request->getVar('timezone'),
            'min_order' => $this->request->getVar('min_order'),
            'tax' => $this->request->getVar('tax'),
            'discount' => $this->request->getVar('discount'),
            'razorpay_key' => $this->request->getVar('razorpay_key'),
            'razorpay_secret_key' => $this->request->getVar('razorpay_secret_key'),
            'is_offline' => $this->request->getVar('is_offline'),
        );
        if($_FILES['logo']['name']!=""){
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['logo']['name']);
            $filename=date('YmdHis').".".$type[count($type)-1];
            move_uploaded_file($_FILES['logo']['tmp_name'],"assets/images/".$filename);
            $data['logo']="assets/images/".$filename;
        }
        if($_FILES['favicon']['name']!=""){
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['favicon']['name']);
            $filename=date('YmdHis')."favicon.".$type[count($type)-1];
            move_uploaded_file($_FILES['favicon']['tmp_name'],"assets/images/".$filename);
            $data['favicon']="assets/images/".$filename;
        }
        $save = $this->model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/configuration");
    }

    public function about() {
        if($this->request->getVar('about')) {
            $data = array(
                'id' => '1',
                'about_meta_description' => $this->request->getVar('description'),
                'about_meta_keywords' => $this->request->getVar('keywords'),
                'about' => $this->request->getVar('about')
            );
            $save = $this->model->save($data);
            $_SESSION['inserted']=1;
            return redirect()->to( base_url()."/configuration/about");
        } else {
            $utility=new \Utilities();
            $data=$utility->validateUser();
            $menu=new Admin_rights_model();
            $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
            $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
            return view('admin/configuration/about',$data);
        }
    }

    public function privacy() {
        if($this->request->getVar('privacy')) {
            $data = array(
                'id' => '1',
                'privacy_meta_description' => $this->request->getVar('description'),
                'privacy_meta_keywords' => $this->request->getVar('keywords'),
                'privacy' => $this->request->getVar('privacy'),
            );
            $save = $this->model->save($data);
            $_SESSION['inserted']=1;
            return redirect()->to( base_url()."/configuration/privacy");
        } else {
            $utility=new \Utilities();
            $data=$utility->validateUser();
            $menu=new Admin_rights_model();
            $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
            $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
            return view('admin/configuration/privacy',$data);
        }
    }

    public function terms() {
        if($this->request->getVar('terms')) {
            $data = array(
                'id' => '1',
                'terms_meta_description' => $this->request->getVar('description'),
                'terms_meta_keywords' => $this->request->getVar('keywords'),
                'terms' => $this->request->getVar('terms'),
            );
            $save = $this->model->save($data);
            $_SESSION['inserted']=1;
            return redirect()->to( base_url()."/configuration/terms");
        } else {
            $utility=new \Utilities();
            $data=$utility->validateUser();
            $menu=new Admin_rights_model();
            $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
            $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
            return view('admin/configuration/terms',$data);
        }
    }

    public function refund() {
        if($this->request->getVar('refund')) {
            $data = array(
                'id' => '1',
                'refund_meta_description' => $this->request->getVar('description'),
                'refund_meta_keywords' => $this->request->getVar('keywords'),
                'refund' => $this->request->getVar('refund'),
            );
            $save = $this->model->save($data);
            $_SESSION['inserted']=1;
            return redirect()->to( base_url()."/configuration/refund");
        } else {
            $utility=new \Utilities();
            $data=$utility->validateUser();
            $menu=new Admin_rights_model();
            $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
            $data['configuration']=$this->model->query("select * from configuration where id='1'")->getResult('array');
            return view('admin/configuration/refund',$data);
        }
    }


    // Social Links
    public function SocialLinks() {
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['social']=$this->social_model->query("select * from social_links")->getResult('array');
	    return view('admin/configuration/social_links', $data);
    }

    public function insertSocialLinks() {
        helper(['form', 'url']);
        $data = array(
            'icon' => $this->request->getVar('icon'),
            'link' => $this->request->getVar('link'),
            'status'  => 'y'
        );
        $save = $this->social_model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/Configuration/SocialLinks" );
    }

    public function modifySocialLinks($id = null) {
        $data['modify'] = $this->social_model->where('id', $id)->first();
        echo json_encode($data['modify']);
    }

    public function updateSocialLinks() {
        $data = array(
            'id' => $this->request->getVar('id'),
            'icon' => $this->request->getVar('icon'),
            'link' => $this->request->getVar('link'),
        );
        $save = $this->social_model->save($data);
        return redirect()->to( base_url()."/Configuration/SocialLinks" );
    }

    public function deleteSocialLinks($id = null) {
        $modify=$this->social_model->where('id', $id)->first();
        $this->social_model->where('id', $id)->delete();
        @unlink($modify['image']);
        return 'yes';
    }

    function social_links_status_change() {
        $data=[
            'id' => $this->request->getVar('id'),
            'status' => $this->request->getVar('status')
        ];
        $this->social_model->save($data);
        echo 'yes';
    }

    function social_links_remove_selected() {
        $ids=$this->request->getVar('ids');
        foreach ($ids as $id){
            @$this->social_model->where('id',$id)->delete();
        }
        echo 'yes';
    }


    // Social Links
    public function ImportantLinks() {
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['important']=$this->important_model->query("select * from important_links")->getResult('array');
	    return view('admin/configuration/important_links', $data);
    }

    public function insertImportantLinks() {
        helper(['form', 'url']);
        $data = array(
            'icon' => $this->request->getVar('icon'),
            'text' => $this->request->getVar('text'),
            'link' => $this->request->getVar('link'),
            'status'  => 'y'
        );
        $save = $this->important_model->save($data);
        $_SESSION['inserted']=1;
        return redirect()->to( base_url()."/Configuration/ImportantLinks" );
    }

    public function modifyImportantLinks($id = null) {
        $data['modify'] = $this->important_model->where('id', $id)->first();
        echo json_encode($data['modify']);
    }

    public function updateImportantLinks() {
        $data = array(
            'id' => $this->request->getVar('id'),
            'icon' => $this->request->getVar('icon'),
            'text' => $this->request->getVar('text'),
            'link' => $this->request->getVar('link'),
        );
        $save = $this->important_model->save($data);
        return redirect()->to( base_url()."/Configuration/ImportantLinks" );
    }

    public function deleteImportantLinks($id = null) {
        $modify=$this->important_model->where('id', $id)->first();
        $this->important_model->where('id', $id)->delete();
        @unlink($modify['image']);
        return 'yes';
    }

    function Important_links_status_change() {
        $data=[
            'id' => $this->request->getVar('id'),
            'status' => $this->request->getVar('status')
        ];
        $this->important_model->save($data);
        echo 'yes';
    }

    function Important_links_remove_selected() {
        $ids=$this->request->getVar('ids');
        foreach ($ids as $id){
            @$this->important_model->where('id',$id)->delete();
        }
        echo 'yes';
    }
}
