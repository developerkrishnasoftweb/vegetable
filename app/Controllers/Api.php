<?php
namespace App\Controllers;

use App\Models\City_model;
use App\Models\Coupon_model;
use App\Models\Customer_model;
use App\Models\Delivery_boy_model;
use App\Models\Department_model;
use App\Models\Feedback_model;
use App\Models\Notification_model;
use App\Models\Order_model;
use App\Models\Order_detail_model;
use App\Models\Order_progress_model;
use App\Models\Product_model;
use App\Models\Rating_model;
use App\Models\Customer_address_model;
use App\Models\Cart_model;
use Utilities;

class Api extends BaseController {
    protected $model,$utilities,$customer;
    function __construct() {
        $this->model=new City_model();
        $this->product=new Product_model();
        $this->customer=new Customer_model();
        $this->delivery_boy=new Delivery_boy_model();
        $this->feedback=new Feedback_model();
        $this->order=new Order_model();
        $this->order_detail=new Order_detail_model();
        $this->order_progress=new Order_progress_model();
        $this->rating=new Rating_model();
        $this->customer_address=new Customer_address_model();
        $this->cart=new Cart_model();
        $this->utilities=new Utilities();
        $this->notification=new Notification_model();
    }

    public function country() {
        if($this->request->getVar('country_id')) {
            $res['data'] = $this->model->query("select * from country where id = ? and status = 'y'", array($this->request->getVar('country_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from country where status = 'y'")->getResult('array');
        }
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function state() {
        if($this->request->getVar('state_id')) {
            $res['data'] = $this->model->query("select * from state where id = ? and status = 'y'", array($this->request->getVar('state_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from state where status = 'y'")->getResult('array');
        }
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function city() {
        if($this->request->getVar('city_id')) {
            $res['data'] = $this->model->query("select * from city where id = ? and status = 'y'", array($this->request->getVar('city_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from city where status = 'y'")->getResult('array');
        }
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function area() {
        if($this->request->getVar('area_id')) {
            $res['data'] = $this->model->query("select * from area where id = ? and status = 'y'", array($this->request->getVar('area_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from area where status = 'y'")->getResult('array');
        }
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function departments(){
        $model=new Department_model();
        $res['data'] = [];
        $res['status'] = 1;
        $res['message'] = 'Data Found';
        $data['departments']=$model->where('status','y')->find();
        $cnt=0;
        foreach ($data['departments'] as $d)
            $data['departments'][$cnt++]['categories']=$this->model->query("select *, (select count(*) from sub_category where category_id = category.id and status='y') as total_sub_category, (select count(*) from product where category_id = category.id and status='y') as total_product from category where department_id = ? and status = 'y'", array($d['id']))->getResult('array');
        $res['data']=$data;
        echo json_encode($res);
    }

    public function category() {
        if($this->request->getVar('category_id')) {
            $res['data'] = $this->model->query("select *, (select count(*) from sub_category where category_id = category.id and status='y') as total_sub_category, (select count(*) from product where category_id = category.id and status='y') as total_product from category where id = ? and status = 'y' order by position asc", array($this->request->getVar('category_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select *, (select count(*) from sub_category where category_id = category.id and status='y') as total_sub_category, (select count(*) from product where category_id = category.id and status='y') as total_product from category where status = 'y' order by position asc")->getResult('array');
        }
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function sub_category() {
        if($this->request->getVar('sub_category_id')) {
            $res['data'] = $this->model->query("select *, (select count(*) from product where sub_category_id = sub_category.id) as total_product from sub_category where id = ? and status = 'y' order by position asc", array($this->request->getVar('sub_category_id')))->getResult('array');
        } else if($this->request->getVar('category_id')) {
            $res['data'] = $this->model->query("select *, (select count(*) from product where sub_category_id = sub_category.id) as total_product from sub_category where category_id = ? and status = 'y' order by position asc", array($this->request->getVar('category_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select *, (select count(*) from product where sub_category_id = sub_category.id) as total_product from sub_category where status = 'y' order by position asc")->getResult('array');
        }
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function banner() {
        if($this->request->getVar('banner_id')) {
            $res['data'] = $this->model->query("select b.*, c.title as category from banner b, category c where b.category_id=c.id and b.id = ? and b.status = 'y'", array($this->request->getVar('banner_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select b.*, c.title as category from banner b, category c where b.category_id=c.id and b.status = 'y' order by b.position asc")->getResult('array');
        }
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function timeslot() {
        if($this->request->getVar('timeslot_id')) {
            $res['data'] = $this->model->query("select * from time_slot where id = ? and status = 'y'", array($this->request->getVar('timeslot_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from time_slot where status = 'y' order by start_time asc")->getResult('array');
        }
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function check($action) {
        if(strtolower($action)=='mobile') {
            $mobile = $this->model->query("select * from customer where mobile = ?", array($this->request->getVar('mobile')))->getResult('array');
            if(is_array($mobile) && count($mobile) > 0) {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = "Mobile is already registered!";
            } else {
                $res['data'] = [];
                $res['status'] = 1;
                $res['message'] = "Mobile is not registered!";
            }
        } else if(strtolower($action)=='email') {
            $email = $this->model->query("select * from customer where email = ?", array($this->request->getVar('email')))->getResult('array');
            if(is_array($email) && count($email) > 0) {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = "Email is already registered!";
            } else {
                $res['data'] = [];
                $res['status'] = 1;
                $res['message'] = "Email is not registered!";
            }
        }
        echo json_encode($res);
    }

    public function customer($action) {
        if(strtolower($action)=='signup') {
            $email = $this->model->query("select * from customer where email = ?", array($this->request->getVar('email')))->getResult('array');
            $mobile = $this->model->query("select * from customer where mobile = ?", array($this->request->getVar('mobile')))->getResult('array');
            if(is_array($email) && count($email) > 0) {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = "Email is already registered!";
            } else if(is_array($mobile) && count($mobile) > 0) {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = "Mobile is already registered!";
            } else {
                $data = array(
                    'first_name' => $this->request->getVar('first_name'),
                    'last_name' => $this->request->getVar('last_name'),
                    'email' => $this->request->getVar('email'),
                    'mobile' => $this->request->getVar('mobile'),
                    'gender' => $this->request->getVar('gender'),
                    'image' => 'assets/images/noimage.png',
                    'password' => $this->request->getVar('password'),
                    'token' => $this->request->getVar('token'),
                    'status' => 'y'
                );
                if($_FILES['image']['name']!=""){
                    $type = explode('.',$_FILES['image']['name']);
                    $filename = date('YmdHis').".".$type[count($type)-1];
                    move_uploaded_file($_FILES['image']['tmp_name'], "assets/images/customer/".$filename);
                    $data['image']="assets/images/customer/".$filename;
                }
                $save = $this->customer->save($data);
                if($save) {
                    $res['data'] = [];
                    $res['status'] = 1;
                    $res['message'] = 'Registration Successfull';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Registration failed';
                }
            }
        } else if(strtolower($action)=='login') {
            $email = $this->request->getVar('email');
            $password = $this->request->getVar('password');
            $customer = $this->model->query("select * from customer where (email = ? or mobile = ?) and password = ?", array($email, $email, $password))->getResult('array');
            if (count($customer) == 1) {
                $this->customer->save(array('id' => $customer[0]['id'],'token' => $this->request->getVar('token')));
                $res['data'] = $customer;
                $res['status'] = 1;
                $res['message'] = 'Login Successful';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Login Failed';
            }
        } else if(strtolower($action)=='change_password') {
            $customer = $this->model->query("select * from customer where id = ? and password = ?", array($this->request->getVar('customer_id'), $this->request->getVar('old_password')))->getResult('array');
            if (count($customer) == 1) {
                $data = array(
                    'id' => $this->request->getVar('customer_id'),
                    'password' => $this->request->getVar('new_password')
                );
                $save = $this->customer->save($data);
                if($save) {
                    $res['data'] = [];
                    $res['status'] = 1;
                    $res['message'] = 'Password changed Successfull';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Password not changed failed';
                }
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Password not matched';
            }
        } else if(strtolower($action)=='add_address') {
            if($this->request->getVar('customer_id')) {
                $data = array(
                    'customer_id' => $this->request->getVar('customer_id'),
                    'name' => $this->request->getVar('name'),
                    'email' => $this->request->getVar('email'),
                    'mobile' => $this->request->getVar('mobile'),
                    'address1' => $this->request->getVar('address1'),
                    'address2' => $this->request->getVar('address2'),
                    'landmark' => $this->request->getVar('landmark'),
                    'area' => $this->request->getVar('area'),
                    'pincode' => $this->request->getVar('pincode'),
                    'state' => $this->request->getVar('state'),
                    'city' => $this->request->getVar('city'),
                    'type' => $this->request->getVar('type'),
                    'status' => 'y'
                );
                $save = $this->customer_address->save($data);
                if($save) {
                    $res['data'] = [];
                    $res['status'] = 1;
                    $res['message'] = 'Address added successfully';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Address not added';
                }
            }
        } else if(strtolower($action)=='update_address') {
            if($this->request->getVar('customer_id')) {
                $data = array(
                    'id' => $this->request->getVar('address_id'),
                    'customer_id' => $this->request->getVar('customer_id'),
                    'name' => $this->request->getVar('name'),
                    'email' => $this->request->getVar('email'),
                    'mobile' => $this->request->getVar('mobile'),
                    'address1' => $this->request->getVar('address1'),
                    'address2' => $this->request->getVar('address2'),
                    'landmark' => $this->request->getVar('landmark'),
                    'area' => $this->request->getVar('area'),
                    'pincode' => $this->request->getVar('pincode'),
                    'state' => $this->request->getVar('state'),
                    'city' => $this->request->getVar('city'),
                    'type' => $this->request->getVar('type'),
                    'status' => 'y'
                );
                $save = $this->customer_address->save($data);
                if($save) {
                    $res['data'] = [];
                    $res['status'] = 1;
                    $res['message'] = 'Address updated successfully';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Address not updated';
                }
            }
        } else if(strtolower($action)=='delete_address') {
            if ($this->customer_address->where('id', $this->request->getVar('address_id'))->delete()) {
                $res['data'] = [];
                $res['status'] = 1;
                $res['message'] = 'Address deleted';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Address not deleted';
            }
        } else if(strtolower($action)=='get_address') {
            if($this->request->getVar('customer_id')) {
                $res['data'] = $this->model->query("select * from customer_address where customer_id = ?", array($this->request->getVar('customer_id')))->getResult('array');
            }
            if(is_array($res['data']) && count($res['data']) > 0) {
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        } else if(strtolower($action)=='get_profile') {
            if($this->request->getVar('customer_id')) {
                $res['data'] = $this->model->query("select * from customer where id = ?", array($this->request->getVar('customer_id')))->getResult('array');
            }
            if(is_array($res['data']) && count($res['data']) > 0) {
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        } else if(strtolower($action)=='update_profile') {
            $data = array();
            $data['id'] = $this->request->getVar('customer_id');
            if($this->request->getVar('first_name')) {
                $data['first_name'] = $this->request->getVar('first_name');
            }
            if($this->request->getVar('last_name')) {
                $data['last_name'] = $this->request->getVar('last_name');
            }
            if($this->request->getVar('email')) {
                $data['email'] = $this->request->getVar('email');
            }
            if($this->request->getVar('mobile')) {
                $data['mobile'] = $this->request->getVar('mobile');
            }
            if($this->request->getVar('gender')) {
                $data['gender'] = $this->request->getVar('gender');
            }
            if($_FILES['image']['name']!=""){
                $type = explode('.', $_FILES['image']['name']);
                $filename = date('YmdHis').".".$type[count($type)-1];
                move_uploaded_file($_FILES['image']['tmp_name'], "assets/images/customer/".$filename);
                $data['image']="assets/images/customer/".$filename;
            }
            $save = $this->customer->save($data);
            if($save) {
                $res['data'] = $this->model->query("select * from customer where id = ?", array($this->request->getVar('customer_id')))->getResult('array');
                $res['status'] = 1;
                $res['message'] = 'Profile updated Successfull';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Profile not updated';
            }
        }
        echo json_encode($res);
    }

    public function delivery_boy($action) {
        if(strtolower($action)=='signup') {
            $email = $this->model->query("select * from delivery_boy where email = ?", array($this->request->getVar('email')))->getResult('array');
            $mobile = $this->model->query("select * from delivery_boy where mobile = ?", array($this->request->getVar('mobile')))->getResult('array');
            if(is_array($email) && count($email) > 0) {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = "Email is already registered!";
            } else if(is_array($mobile) && count($mobile) > 0) {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = "Mobile is already registered!";
            } else {
                $data = array(
                    'first_name' => $this->request->getVar('first_name'),
                    'last_name' => $this->request->getVar('last_name'),
                    'email' => $this->request->getVar('email'),
                    'mobile' => $this->request->getVar('mobile'),
                    'gender' => $this->request->getVar('gender'),
                    'image' => 'assets/images/noimage.png',
                    'password' => $this->request->getVar('password'),
                    'status' => 'y'
                );
                if($_FILES['image']['name']!=""){
                    $type = explode('.',$_FILES['image']['name']);
                    $filename = date('YmdHis').".".$type[count($type)-1];
                    move_uploaded_file($_FILES['image']['tmp_name'], "assets/images/delivery_boy/".$filename);
                    $data['image']="assets/images/delivery_boy/".$filename;
                }
                $save = $this->delivery_boy->save($data);
                if($save) {
                    $res['data'] = [];
                    $res['status'] = 1;
                    $res['message'] = 'Registration Successfull';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Registration failed';
                }
            }
        } else if(strtolower($action)=='login') {
            $email = $this->request->getVar('email');
            $password = $this->request->getVar('password');
            $delivery_boy = $this->model->query("select * from delivery_boy where email = ? and password = ?", array($email, $password))->getResult('array');
            if (count($delivery_boy) == 1) {
                $res['data'] = $delivery_boy;
                $res['status'] = 1;
                $res['message'] = 'Login Successfull';
            } else {
                $res['data'] = $delivery_boy;
                $res['status'] = 0;
                $res['message'] = 'Login Failed';
            }
        } else if(strtolower($action)=='change_password') {
            $delivery_boy = $this->model->query("select * from delivery_boy where id = ? and password = ?", array($this->request->getVar('delivery_boy_id'), $this->request->getVar('old_password')))->getResult('array');
            if (count($delivery_boy) == 1) {
                $data = array(
                    'id' => $this->request->getVar('delivery_boy_id'),
                    'password' => $this->request->getVar('new_password')
                );
                $save = $this->delivery_boy->save($data);
                if($save) {
                    $res['data'] = [];
                    $res['status'] = 1;
                    $res['message'] = 'Password changed Successfull';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Password not changed failed';
                }
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Password not matched';
            }
        } else if(strtolower($action)=='get_profile') {
            if($this->request->getVar('delivery_boy_id')) {
                $res['data'] = $this->model->query("select * from delivery_boy where id = ?", array($this->request->getVar('delivery_boy_id')))->getResult('array');
            }
            if(is_array($res['data']) && count($res['data']) > 0) {
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        } else if(strtolower($action)=='update_profile') {
            $data = array();
            $data['id'] = $this->request->getVar('delivery_boy_id');
            if($this->request->getVar('first_name')) {
                $data['first_name'] = $this->request->getVar('first_name');
            }
            if($this->request->getVar('last_name')) {
                $data['last_name'] = $this->request->getVar('last_name');
            }
            if($this->request->getVar('email')) {
                $data['email'] = $this->request->getVar('email');
            }
            if($this->request->getVar('mobile')) {
                $data['mobile'] = $this->request->getVar('mobile');
            }
            if($this->request->getVar('gender')) {
                $data['gender'] = $this->request->getVar('gender');
            }
            if($_FILES['image']['name']!=""){
                $type = explode('.',$_FILES['image']['name']);
                $filename = date('YmdHis').".".$type[count($type)-1];
                move_uploaded_file($_FILES['image']['tmp_name'], "assets/images/delivery_boy/".$filename);
                $data['image']="assets/images/delivery_boy/".$filename;
            }
            $save = $this->delivery_boy->save($data);
            if($save) {
                $res['data'] = $this->model->query("select * from delivery_boy where id = ?", array($this->request->getVar('delivery_boy_id')))->getResult('array');
                $res['status'] = 1;
                $res['message'] = 'Profile updated Successfull';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Profile not updated';
            }
        } else if(strtolower($action)=='update_status') {
            $data = array();
            $data['id'] = $this->request->getVar('delivery_boy_id');
            if($this->request->getVar('available')) {
                $data['available'] = $this->request->getVar('available');
            }
            $save = $this->delivery_boy->save($data);
            if($save) {
                $res['data'] = $this->model->query("select * from delivery_boy where id = ?", array($this->request->getVar('delivery_boy_id')))->getResult('array');
                $res['status'] = 1;
                $res['message'] = 'Status updated Successfull';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Status not updated';
            }
        } else if(strtolower($action)=='get_notification') {
            if($this->request->getVar('delivery_boy_id')) {
                $res['data'] = $this->model->query("select * from notification where delivery_boy_id = ?", array($this->request->getVar('delivery_boy_id')))->getResult('array');
            }
            if(is_array($res['data']) && count($res['data']) > 0) {
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        }
        echo json_encode($res);
    }

    public function feedback() {
        $data = array(
            'name' => $this->request->getVar('name'),
            'email' => $this->request->getVar('email'),
            'mobile' => $this->request->getVar('mobile'),
            'feedback' => $this->request->getVar('feedback'),
            'rating' => $this->request->getVar('rating'),
            'status' => 'y'
        );
        $save = $this->feedback->save($data);
        if($save) {
            $res['data'] = [];
            $res['status'] = 1;
            $res['message'] = 'Feedback Submited';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Feedback Not Submited';
        }
        echo json_encode($res);
    }

    public function order($action) {
        if(strtolower($action)=='new') {
            $customer_id=$this->request->getVar('customer_id');
            if($this->request->getVar('customer_id') && $this->request->getVar('product_id')) {
                $data = array(
                    'customer_id' => $this->request->getVar('customer_id'),
                    'name' => $this->request->getVar('name'),
                    'email' => $this->request->getVar('email'),
                    'mobile' => $this->request->getVar('mobile'),
                    'address1' => $this->request->getVar('address1'),
                    'address2' => $this->request->getVar('address2'),
                    'landmark' => $this->request->getVar('landmark'),
                    'area' => $this->request->getVar('area'),
                    'pincode' => $this->request->getVar('pincode'),
                    'state' => $this->request->getVar('state'),
                    'city' => $this->request->getVar('city'),
                    'type' => $this->request->getVar('type'),
                    'order_date' => date('Y-m-d'),
                    'order_time' => date('h:i:s'),
                    'total_price' => $this->request->getVar('total_price'),
                    'converted_amount' => $this->request->getVar('total_price'),
                    'currency' => "INR",
                    'order_type' => $this->request->getVar('order_type'),
                    'coupon_used' => $this->request->getVar('coupon_used'), // for coupon if used by any customer
                    'coupon_discount' => $this->request->getVar('coupon_discount'), // for discount amount availed by any customer
                    'payment_mode' => $this->request->getVar('payment_mode'),
                    'payment_status' => $this->request->getVar('payment_status'),
                    'transaction_type' => $this->request->getVar('transaction_type'),
                    'reference_no' => $this->request->getVar('reference_no'),
                    'transaction_date' => $this->request->getVar('transaction_date'),
                    'transaction_time' => $this->request->getVar('transaction_time'),
                    'comment' => $this->request->getVar('comment'),
                    'order_status' => 'pending'
                );
                $save = $this->order->save($data);
                if($save) {
                    $order_id = $this->order->getInsertID();
                    $order_no = date('Ymd').$order_id;
                    $data = array(
                        'id' => $order_id,
                        'order_no' => $order_no
                    );
                    $this->order->save($data);
                    $product_id = explode(',', $this->request->getVar('product_id'));
                    $quantity = explode(',', $this->request->getVar('quantity'));
                    $price = explode(',', $this->request->getVar('price'));
                    foreach($product_id as $key => $val) {
                        $data = array(
                            'order_id' => $order_id,
                            'product_id' => $product_id[$key],
                            'product_title' => $this->product->getProductTitle($product_id[$key]),
                            'quantity' => $quantity[$key],
                            'price' => $price[$key],
                            'total' => $price[$key] * $quantity[$key]
                        );
                        $save = $this->order_detail->save($data);
                    }
                    $data = array(
                        'order_id' => $order_id,
                        'order_status' => 'pending',
                        'inserted_at'  => date('Y-m-d H:i:s')
                    );
                    $save = $this->order_progress->save($data);
                    $customer=$this->customer->where('id',$customer_id)->first();
                    @$this->utilities->push_notification('Order Placed',array($customer['token']),"Your order has been placed successfully");
                    $res['data'] = [];
                    $res['orderNo'] = $order_no;
                    $res['status'] = 1;
                    $res['message'] = 'Order Placed Successfully';
                    $this->model->query("delete from cart where customer_id=".$this->request->getVar('customer_id'));
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Order Not Placed';
                }
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Order Not Placed';
            }
        } else if(strtolower($action)=='view') {
            //view all order
            $order_data = $this->model->query("select o.*,o.order_status as order_progress from `order` o where customer_id=? order by datetime desc", array($this->request->getVar('customer_id')))->getResult('array');
            if(is_array($order_data) && count($order_data) > 0) {
                $data = array();
                $cnt=0;
                foreach($order_data as $order) {
                    $order_data[$cnt++]['products'] = $this->model->query("select od.product_id, od.price, p.title, p.short_info, p.image, p.unit, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
                    //                    $data[] = $order;
                }
                $res['data'] = $order_data;
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        } else if(strtolower($action)=='view_order') {
            //view single order
            $order_data = $this->model->query("select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id and o.customer_id=? and o.id=? order by datetime desc", array($this->request->getVar('customer_id'), $this->request->getVar('order_id')))->getResult('array');
            if(is_array($order_data) && count($order_data) > 0) {
                $data = array();
                foreach($order_data as $order) {
                    $order['products'] = $this->model->query("select od.product_id, p.title, p.short_info, p.image, p.unit, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
                    $data[] = $order;
                }
                $res['data'] = $data;
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        } else if(strtolower($action)=='all_order') {
            $data['pending_order'] = array();
            $data['ongoing_order'] = array();
            //view all order for delivery boy app
            $pending_order_data = $this->model->query("select * from `order` where delivery_boy_id = ? and order_status = 'pending' order by datetime desc", array($this->request->getVar('delivery_boy_id')))->getResult('array');
            $ongoing_order_data = $this->model->query("select * from `order` where delivery_boy_id = ? and order_status != 'pending' and order_status != 'delivered' order by datetime desc", array($this->request->getVar('delivery_boy_id')))->getResult('array');
            if((is_array($pending_order_data) && count($pending_order_data) > 0) || (is_array($ongoing_order_data) && count($ongoing_order_data) > 0)) {
                foreach($pending_order_data as $order) {
                    $order['products'] = $this->model->query("select od.product_id, p.title, p.short_info, p.image, p.unit, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
                    $data['pending_order'][] = $order;
                }
                foreach($ongoing_order_data as $order) {
                    $order['products'] = $this->model->query("select product_id, p.title, p.short_info, p.image, p.unit, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
                    $data['ongoing_order'][] = $order;
                }
                $res['data'] = $data;
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = $data;
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        } else if(strtolower($action)=='delivered_order') {
            $data = array();
            //view all order for delivery boy app
            $delivered_order_data = $this->model->query("select * from `order` where delivery_boy_id = ? and order_status = 'delivered' order by datetime desc", array($this->request->getVar('delivery_boy_id')))->getResult('array');
            if((is_array($delivered_order_data) && count($delivered_order_data) > 0)) {
                foreach($delivered_order_data as $order) {
                    $order['products'] = $this->model->query("select od.product_id, p.title, p.short_info, p.image, p.unit, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
                    $data[] = $order;
                }
                $res['data'] = $data;
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = $data;
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        } else if(strtolower($action)=='deliver_order') {
            if($this->request->getVar('order_id')) {
                $data = array(
                    'order_id' => $this->request->getVar('order_id'),
                    'order_status' => 'delivered',
                    'inserted_at'  => date('Y-m-d H:i:s')
                );
                $save = $this->order_progress->save($data);
                $data=array(
                    'id' => $this->request->getVar('order_id'),
                    'order_status' => 'delivered'
                );
                $orderModel=new Order_model();
                $orderModel->save($data);
                if($save) {
                    $res['data'] = [];
                    $res['status'] = 1;
                    $res['message'] = 'Order Delivered Successfully';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Order Not Delivered';
                }
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Order Not Delivered';
            }
        }
        echo json_encode($res);
    }

    public function product() {
        if($this->request->getVar('product_id')) {
            $res['data'] = $this->model->query("select * from product where id = ? and status = 'y'", array($this->request->getVar('product_id')))->getResult('array');
        } else if($this->request->getVar('category_id')) {
            $res['data'] = $this->model->query("select * from product where category_id = ? and status = 'y'", array($this->request->getVar('category_id')))->getResult('array');
        } else if($this->request->getVar('sub_category_id')) {
            $res['data'] = $this->model->query("select * from product where sub_category_id = ? and status = 'y'", array($this->request->getVar('sub_category_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from product where status = 'y'")->getResult('array');
        }
        if(is_array($res['data']) && count($res['data']) > 0) {
            $images = $this->model->query("select image from product_image where product_id = ? and status = 'y'", array($this->request->getVar('product_id')))->getResult('array');
            if(is_array($images) && count($images) > 0) {
                $res['data'][0]['images'] = $images;
            } else {
                $res['data'][0]['images'] = [];
            }
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function popular_product() {
        if($this->request->getVar('product_id')) {
            $res['data'] = $this->model->query("select *, (select image from product_image where product_id = ? and status = 'y') as images from product where id = ? and popular = 'y' and status = 'y'", array($this->request->getVar('product_id'), $this->request->getVar('product_id')))->getResult('array');
        } else if($this->request->getVar('category_id')) {
            $res['data'] = $this->model->query("select * from product where category_id = ? and popular = 'y' and status = 'y'", array($this->request->getVar('category_id')))->getResult('array');
        } else if($this->request->getVar('sub_category_id')) {
            $res['data'] = $this->model->query("select * from product where sub_category_id = ? and popular = 'y' and status = 'y'", array($this->request->getVar('sub_category_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from product where popular = 'y' and status = 'y'")->getResult('array');
        }
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function rating($action) {
        if(strtolower($action)=='new') {
            $data = array(
                'customer_id' => $this->request->getVar('customer_id'),
                'product_id' => $this->request->getVar('product_id'),
                'score' => $this->request->getVar('score'),
                'comment' => $this->request->getVar('comment'),
                'status' => 'y'
            );
            $save = $this->rating->save($data);
            if($save) {
                $res['data'] = [];
                $res['status'] = 1;
                $res['message'] = 'Rated Successfully';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Rating Failed';
            }
        } else if(strtolower($action)=='view') {
            $res['data'] = $this->model->query("select * from rating where product_id = ?", array($this->request->getVar('product_id')))->getResult('array');
            if(is_array($res['data']) && count($res['data']) > 0) {
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        }
        echo json_encode($res);
    }

    public function about_us() {
        $res['data'] = $this->model->query("select about from configuration where id = '1'")->getResult('array');
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function privacy_policy() {
        $res['data'] = $this->model->query("select privacy from configuration where id = '1'")->getResult('array');
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function charges() {
        $res['data'] = $this->model->query("select discount,tax from configuration where id = '1'")->getResult('array');
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function terms_and_condition() {
        $res['data'] = $this->model->query("select terms from configuration where id = '1'")->getResult('array');
        if(is_array($res['data']) && count($res['data']) > 0) {
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function cart($action) {
        if(strtolower($action)=='add') {
            $customer_id = $this->request->getVar('customer_id');
            $product_id = $this->request->getVar('product_id');
            $cart = $this->model->query("select * from cart where customer_id = ? and product_id = ?", array($customer_id, $product_id))->getResult('array');
            if (count($cart) > 0) {
                $data = array(
                    'id' => $cart[0]['id'],
                    'quantity' => $cart[0]['quantity'] + $this->request->getVar('quantity')
                );
            } else {
                $data = array(
                    'customer_id' => $this->request->getVar('customer_id'),
                    'product_id' => $this->request->getVar('product_id'),
                    'quantity' => $this->request->getVar('quantity')
                );
            }
            $save = $this->cart->save($data);
            if($save) {
                $res['data'] = [];
                $res['status'] = 1;
                $res['message'] = 'Product added to cart';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Product not added to cart';
            }
        } else if(strtolower($action)=='check') {
            $customer_id = $this->request->getVar('customer_id');
            $product_id = $this->request->getVar('product_id');
            $cart = $this->model->query("select * from cart where customer_id = ? and product_id = ?", array($customer_id, $product_id))->getResult('array');
            if (count($cart) > 0) {
                $res['data'] = $cart[0];
                $res['status'] = 1;
                $res['message'] = 'Exists in cart';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Not found in cart';
            }
        } else if(strtolower($action)=='count') {
            $customer_id = $this->request->getVar('customer_id');
            $cart = $this->model->query("select count(*) as total from cart where customer_id = ?", array($customer_id))->getResult('array');
            if (count($cart) > 0) {
                $res['data'] = $cart;
                $res['status'] = 1;
                $res['message'] = 'Exists in cart';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Not product found in cart';
            }
        } else if(strtolower($action)=='update_quantity') {
            $data = array(
                'id' => $this->request->getVar('cart_id'),
                'quantity' => $this->request->getVar('quantity')
            );
            $save = $this->cart->save($data);
            if($save) {
                $res['data'] = [];
                $res['status'] = 1;
                $res['message'] = 'Product qunatity updated';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Product qunatity not updated';
            }
        } else if(strtolower($action)=='delete') {
            if ($this->cart->where('id', $this->request->getVar('cart_id'))->delete()) {
                $res['data'] = [];
                $res['status'] = 1;
                $res['message'] = 'Removed from cart';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Not removed from cart';
            }
        } else if(strtolower($action)=='delete_all') {
            if ($this->cart->where('customer_id', $this->request->getVar('customer_id'))->delete()) {
                $res['data'] = [];
                $res['status'] = 1;
                $res['message'] = 'All Items Removed from cart';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Items Not removed from cart';
            }
        } else if(strtolower($action)=='view') {
            $res['data'] = $this->model->query("select c.*, p.category_id, p.sub_category_id, p.title, p.short_info, p.long_info, p.image, p.price, p.display_price, p.unit, p.package_count, p.featured, p.oos, p.popular, p.home_product, (p.price * c.quantity) as total_price from cart c, product p where c.customer_id = ? and c.product_id = p.id", array($this->request->getVar('customer_id')))->getResult('array'); if(is_array($res['data']) && count($res['data']) > 0) {
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        }
        echo json_encode($res);
    }

    public function is_offline() {
        $data = $this->model->query("select is_offline from configuration where id = '1'")->getResult('array');
        if(is_array($data) && count($data) > 0) {
            $res['data'] = [
                ['is_offline' => ($data[0]['is_offline'] == 'true' ? true : false)]
            ];
            $res['status'] = 1;
            $res['message'] = 'Data found';
        } else {
            $res['data'] = [];
            $res['status'] = 0;
            $res['message'] = 'Data not found';
        }
        echo json_encode($res);
    }

    public function configuration($action) {
        if(strtolower($action)=='view') {
            $res['data'] = $this->model->query("select * from configuration where id='1'")->getResult('array');
            if(is_array($res['data']) && count($res['data']) > 0) {
                $res['status'] = 1;
                $res['message'] = 'Data found';
            } else {
                $res['data'] = [];
                $res['status'] = 0;
                $res['message'] = 'Data not found';
            }
        }
        echo json_encode($res);
    }

    function user_profile(){
        $data=array(
            'id' => $this->request->getVar('id'),
            'first_name' => $this->request->getVar('first_name'),
            'last_name' => $this->request->getVar('last_name'),
            'gender' => $this->request->getVar('gender')
        );
        $model=new Customer_model();
        $model->save($data);
        $res['data'] = [];
        $res['status'] = 0;
        $res['message'] = 'Data not found';
        echo json_encode($res);
    }

    function check_coupon(){
        $response=array(
            'status' => 0,
            'message' => "Invalid Coupon Code",
            'data' => []
        );
        $couponModel=new Coupon_model();
        $customer=$this->request->getVar('customer_id');
        $code=$this->request->getVar('code');
        $total=$this->request->getVar('total');
        $customerModel=new Customer_model();
        $customerDetail=$customerModel->where('id',$customer)->first();
        if(empty($customerDetail)){
            $response['message']="Customer not Found";
            echo json_encode($response);
            exit;
        }
        $resp=$couponModel->where('code',$code)->find();
        if(count($resp)==0){
            echo json_encode($response);
            exit;
        }
        $customerOrders=$customerModel->query("select id from `order` where customer_id=$customer")->getResult('array');
        if(count($customerOrders)>0 && $resp[0]['first_time']=='y'){
            $response['message']="This coupon is valid for only first order";
            echo json_encode($response);
            exit;
        }
        $couponUsed=$customerModel->query("select id from `order` where coupon_used='$code'")->getResult('array');
        if(count($couponUsed)>=$resp[0]['limit'] && $resp[0]['limit']!=0){
            $response['message']="This coupon used limit has exceeded";
            echo json_encode($response);
            exit;
        }

        $couponUsed=$customerModel->query("select id from `order` where coupon_used='$code' and customer_id=$customer")->getResult('array');
        if(count($couponUsed)>0){
            $response['message']="You have already used this coupon code";
            echo json_encode($response);
            exit;
        }
        if(count($customerOrders)>0 && $resp[0]['first_time']=='y'){
            $response['message']="This coupon is valid for only first order";
            echo json_encode($response);
            exit;
        }
        if($resp[0]['minimum'] > $total){
            $response['message']="Coupon is not valid below order of Rs.". $resp[0]['minimum'];
            echo json_encode($response);
            exit;
        }
        if($resp[0]['type']=="percent"){
            $discount=($total * $resp[0]['value'])/100;
        }else{
            $discount=$resp[0]['value'];
        }
        if($discount > $resp[0]['maximum'])
            $discount=$resp[0]['maximum'];
        $response['message']="Coupon claimed Successfully";
        $response['data']['amount']=$discount;
        $response['data']['code']=$code;
        $response['status']=1;
        echo json_encode($response);
    }

    function forget_password(){
        $username=$this->request->getVar('username');
        $utilities=new \Utilities();
        $model=new Customer_model();
        $resp=$model->where('email',$username)->orWhere('mobile',$username)->find();
        if(count($resp)==0) {
            echo json_encode(array('status' => 0,'message' => 'Account not found associated with this email or mobile'));
        } else {
            $email=$resp[0]['email'];
            $encrypted=$this->_encryptString($email);
            //echo $encrypted; exit;
            $mailContent="Dear ".$resp[0]['first_name'].",<br>Your password reset link is below please click on the link and change your password.<br><a href='".base_url()."/api/reset_password/".$encrypted."/dx32oT09utBkhy4PNMZzz7AXBDjzH9NU-dx32oT09utBkhy4PNMZzz7AXBDjzH9NU-dx32oT09utBkhy4PNMZzz7AXBDjzH9NU-dx32oT09utBkhy4PNMZzz7AXBDjzH9NU'>Click to Reset</a><br>Thanks & Regards<br><b>SaptKrishi</b>";
            @$utilities->send_email($email,$mailContent,"Reset Password");
            echo json_encode(array('status' => 1,'message' => 'An password reset link has been sent to your email address'));
        }
    }

    function reset_password($encrypted_email){
        $email=$this->_decryptString($encrypted_email);
        $model=new Customer_model();
        $data['detail']=$model->where('email',$email)->find();
        if(count($data['detail'])==0){
            echo json_encode(array('status' => 'false','message' => 'Invalid link please use the provided link'));
            exit;
        }
        return view('admin/reset_password',$data);
    }

    function change_password(){
        $model=new Customer_model();
        $data=array(
            'id' => $this->request->getVar('hid'),
            'password' => $this->request->getVar('password')
        );
        $model->save($data);
        echo "Your Password has been changed successfully please go to the application and login with the new password";
    }

    function _encryptString($string){
        return base64_encode($string);
    }

    function _decryptString($string){
        return base64_decode($string);
    }

    function test_noti(){
        $customer=$this->customer->where('id',31)->first();
        @$this->utilities->push_notification('Order Placed',array($customer['token']),"Your order has been placed successfully");
    }
}
