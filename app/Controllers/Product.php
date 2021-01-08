<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\Customer_model;
use App\Models\Product_model;
use App\Models\Product_image_model;

class Product extends BaseController {
    protected $model;
    function __construct() {
        session_start();
        if(!isset($_SESSION['ether'])) {
            header('location:'.base_url().'/clogin');
            exit;
        }
        $this->model=new Product_model();
        $this->product_img=new Product_image_model();
    }

    function index() {
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['category']=$this->model->query("select * from category")->getResult('array');
        $data['sub_category']=$this->model->query("select * from sub_category")->getResult('array');
        $data['product']=$this->model->query("select * from product")->getResult('array');
	    return view('admin/product', $data);
    }

    public function insert() {
        helper(['form', 'url']);
        $data = array(
            'category_id' => $this->request->getVar('category_id'),
            'sub_category_id' => $this->request->getVar('sub_category_id'),
            'title' => $this->request->getVar('title'),
            'short_info' => $this->request->getVar('short_info'),
            'long_info' => $this->request->getVar('long_info'),
            'price' => $this->request->getVar('price'),
            'display_price' => $this->request->getVar('display_price'),
            'unit' => $this->request->getVar('unit'),
            'unit_value' => $this->request->getVar('unit_value'),
            'quantity' => $this->request->getVar('quantity'),
            'package_count' => $this->request->getVar('package_count'),
            'featured' => $this->request->getVar('featured'),
            'oos' => $this->request->getVar('oos'),
            'popular' => $this->request->getVar('popular'),
            'home_product' => $this->request->getVar('home_product'),
            'status'  => 'y',
            'inserted_at'  => date('Y-m-d H:i:s'),
            'inserted_by'  => $_SESSION['ether']['id']
        );
        if($_FILES['image']['name']!="") {
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['image']['name']);
            $filename=date('YmdHis').".".$type[count($type)-1];
            $_SESSION['file']=$filename;
            move_uploaded_file($_FILES['image']['tmp_name'],"assets/images/product/".$filename);
            $data['image']="assets/images/product/".$filename;
        }
        $save = $this->model->save($data);
        $_SESSION['inserted']=1;
        $this->_sentProductAddNotification();
        return redirect()->to( base_url()."/product" );
    }

    public function modify($id = null) {
        $data['modify'] = $this->model->where('id', $id)->first();
        echo json_encode($data['modify']);
    }

    public function category() {
        $data = $this->model->query("select * from category")->getResult('array');
        echo json_encode($data);
    }

    public function sub_category($id = null) {
        if($id != NULL) {
            $data = $this->model->query("select * from sub_category where category_id = ?", array($id))->getResult('array');
        } else {
            $data = $this->model->query("select * from sub_category")->getResult('array');
        }
        echo json_encode($data);
    }

    public function update() {
        $data = array(
            'category_id' => $this->request->getVar('category_id'),
            'sub_category_id' => $this->request->getVar('sub_category_id'),
            'id' => $this->request->getVar('id'),
            'title' => $this->request->getVar('title'),
            'short_info' => $this->request->getVar('short_info'),
            'long_info' => $this->request->getVar('long_info'),
            'price' => $this->request->getVar('price'),
            'display_price' => $this->request->getVar('display_price'),
            'unit' => $this->request->getVar('unit'),
            'unit_value' => $this->request->getVar('unit_value'),
            'quantity' => $this->request->getVar('quantity'),
            'package_count' => $this->request->getVar('package_count'),
            'featured' => $this->request->getVar('featured'),
            'oos' => $this->request->getVar('oos'),
            'popular' => $this->request->getVar('popular'),
            'home_product' => $this->request->getVar('home_product'),
            'modified_at'  => date('Y-m-d H:i:s'),
            'modified_by'  => $_SESSION['ether']['id'],
        );
        if($_FILES['image']['name']!="") {
            $_SESSION['ins']=1;
            $type=explode('.',$_FILES['image']['name']);
            $filename=date('YmdHis').".".$type[count($type)-1];
            $_SESSION['file']=$filename;
            move_uploaded_file($_FILES['image']['tmp_name'],"assets/images/product/".$filename);
            $data['image']="assets/images/product/".$filename;
        }
        $save = $this->model->save($data);
        return redirect()->to( base_url()."/product" );
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


    function product_image($id){
        $utility=new \Utilities();
        $data=$utility->validateUser();
        $menu=new Admin_rights_model();
        $data['menus']=$menu->get_menus($_SESSION['ether']['id']);
        $data['product_img']=$this->model->query("select * from product_image where product_id=?", array($id))->getResult('array');
        $data['id']=$id;
        return view('admin/product_gallery',$data);
    }

    function add_product_img(){
        $product_id=$this->request->getVar('product_id');
        $data=array(
            'product_id' => $product_id,
            'status'  => 'y',
            'inserted_at'  => date('Y-m-d H:i:s'),
            'inserted_by'  => $_SESSION['ether']['id']
        );
        $cnt=1;
        foreach ($_FILES['image']['name'] as $key=>$val ){
            $type=explode('.',$_FILES['image']['name'][$key]);
            $names=explode('.',$_FILES['image']['name'][$key]);;
            $name=date('YmdHis')."$cnt.".$type[count($type)-1];
            move_uploaded_file($_FILES['image']['tmp_name'][$key],"assets/images/product/gallery/".$name);
            $data['image']="assets/images/product/gallery/".$name;
            $this->product_img->save($data);
            $cnt++;
        }
        $bid=$_SESSION['businesses']['id'];
        $data['category_img']=$this->product_img->query("select * from product_image where product_id=?", array($product_id))->getResult('array');
        header('location:'.base_url().'/product/product_image/'.$product_id);
        exit;
    }

    function delete_product_image($id){
        $modify=$this->product_img->where('id', $id)->first();
        $this->product_img->where('id', $id)->delete();
        @unlink($modify['image']);
        header('location:'.base_url().'/product/product_image/'.$id);
    }
    function _sentProductAddNotification(){
        $customer=new Customer_model();
        $customer=$customer->findAll();
        $tokens=[];
        foreach ($customer as $c)
        {
            if($c['token']!="")
                $tokens[]=$c['token'];
        }
        $utility=new \Utilities();
        $utility->push_notification('Product Added',$tokens,'A new product is added to Sapt krishi please check the application');
    }
}
