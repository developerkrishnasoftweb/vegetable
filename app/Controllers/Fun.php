<?php
namespace App\Controllers;

use App\Models\Admin_rights_model;
use App\Models\City_model;
use App\Models\Customer_model;
use App\Models\Delivery_boy_model;
use App\Models\Feedback_model;
use App\Models\Notification_model;
use App\Models\Order_model;
use App\Models\Order_detail_model;
use App\Models\Order_progress_model;
use App\Models\Product_model;
use App\Models\Rating_model;
use App\Models\Customer_address_model;
use App\Models\Cart_model;

class Fun extends BaseController {
    protected $model;
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
        $this->notification=new Notification_model();
    }

    public function country() {
        if($this->request->getVar('country_id')) {
            $res['data'] = $this->model->query("select * from country where id = ?", array($this->request->getVar('country_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from country")->getResult('array');
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
            $res['data'] = $this->model->query("select * from state where id = ?", array($this->request->getVar('state_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from state")->getResult('array');
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
            $res['data'] = $this->model->query("select * from city where id = ?", array($this->request->getVar('city_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from city")->getResult('array');
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
            $res['data'] = $this->model->query("select * from area where id = ?", array($this->request->getVar('area_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from area")->getResult('array');
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

    public function category() {
        if($this->request->getVar('category_id')) {
            $res['data'] = $this->model->query("select *, (select count(*) from sub_category where category_id = category.id) as total_sub_category, (select count(*) from product where category_id = category.id) as total_product from category where id = ?", array($this->request->getVar('category_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select *, (select count(*) from sub_category where category_id = category.id) as total_sub_category, (select count(*) from product where category_id = category.id) as total_product from category")->getResult('array');
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
            $res['data'] = $this->model->query("select *, (select count(*) from product where sub_category_id = sub_category.id) as total_product from sub_category where id = ?", array($this->request->getVar('sub_category_id')))->getResult('array');
        } else if($this->request->getVar('category_id')) {
            $res['data'] = $this->model->query("select *, (select count(*) from product where sub_category_id = sub_category.id) as total_product from sub_category where category_id = ?", array($this->request->getVar('category_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select *, (select count(*) from product where sub_category_id = sub_category.id) as total_product from sub_category")->getResult('array');
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
            $res['data'] = $this->model->query("select b.*, c.title as category from banner b, category c where b.category_id=c.id and id = ?", array($this->request->getVar('banner_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select b.*, c.title as category from banner b, category c where b.category_id=c.id")->getResult('array');
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

        switch (strtolower($action)){
            case "mobile":
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
                break;

            case "email":
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
                break;
        }
        echo json_encode($res);
    }

    public function customer($action) {
        switch (strtolower($action)){
            case "signup":
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
                break;

            case "login":
                $email = $this->request->getVar('email');
                $password = $this->request->getVar('password');
                $customer = $this->model->query("select * from customer where (email = ? or mobile = ?) and password = ?", array($email, $email, $password))->getResult('array');
                if (count($customer) == 1) {
                    $res['data'] = $customer;
                    $res['status'] = 1;
                    $res['message'] = 'Login Successfull';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Login Failed';
                }
                break;

            case "change_password":
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
                break;

            case "add_address":
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
                break;

            case "update_address":
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
                break;

            case "delete_address":
                if ($this->customer_address->where('id', $this->request->getVar('address_id'))->delete()) {
                    $res['data'] = [];
                    $res['status'] = 1;
                    $res['message'] = 'Address deleted';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Address not deleted';
                }
                break;

            case "get_address":
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
                break;

            case "get_profile":
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
                break;

            case "update_profile":
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
                break;
        }
        echo json_encode($res);
    }

    public function delivery_boy($action) {
        switch (strtolower($action)){
            case "signup":
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
                break;

            case "login":
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
                break;

            case "change_password":
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
                break;

            case "get_profile":
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
                break;

            case "update_profile":
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
                break;

            case "update_status":
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
                break;

            case "get_notification":
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
                break;
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
        switch (strtolower($action)){
            case "new":
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
                        'converted_amount' => $this->request->getVar('converted_amount'),
                        'currency' => "INR",
                        'order_type' => $this->request->getVar('order_type'),
                        'payment_mode' => $this->request->getVar('payment_mode'),
                        'payment_status' => $this->request->getVar('payment_status'),
                        'transaction_type' => $this->request->getVar('transaction_type'),
                        'reference_no' => $this->request->getVar('reference_no'),
                        'transaction_date' => $this->request->getVar('transaction_date'),
                        'transaction_time' => $this->request->getVar('transaction_time'),
                        'order_status' => 'y'
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
                        $total = explode(',', $this->request->getVar('total'));
                        foreach($product_id as $key => $val) {
                            $data = array(
                                'order_id' => $order_id,
                                'product_id' => $product_id[$key],
                                'product_title' => $this->product->getProductTitle($product_id),
                                'quantity' => $quantity[$key],
                                'total' => $total[$key],
                            );
                        }
                        $save = $this->order_detail->save($data);
                        $data = array(
                            'order_id' => $order_id,
                            'order_status' => 'pending',
                            'inserted_at'  => date('Y-m-d H:i:s')
                        );
                        $save = $this->order_progress->save($data);
                        $res['data'] = [];
                        $res['orderNo'] = $order_no;
                        $res['status'] = 1;
                        $res['message'] = 'Order Placed Successfully';
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
                break;

            case "view":
                //view all order
                $order_data = $this->model->query("select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id and o.customer_id=? order by datetime desc", array($this->request->getVar('customer_id')))->getResult('array');
                if(is_array($order_data) && count($order_data) > 0) {
                    $data = array();
                    foreach($order_data as $order) {
                        $order['products'] = $this->model->query("select od.product_id, p.title, p.short_info, p.image, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
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
                break;

            case "view_order":
                $order_data = $this->model->query("select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id and o.customer_id=? and o.id=? order by datetime desc", array($this->request->getVar('customer_id'), $this->request->getVar('order_id')))->getResult('array');
                if(is_array($order_data) && count($order_data) > 0) {
                    $data = array();
                    foreach($order_data as $order) {
                        $order['products'] = $this->model->query("select od.product_id, p.title, p.short_info, p.image, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
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
                break;

            case "all_order":
                $data['pending_order'] = array();
                $data['ongoing_order'] = array();
                //view all order for delivery boy app
                $pending_order_data = $this->model->query("select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id and o.delivery_boy_id = ? and op.order_status = 'pending' order by datetime desc", array($this->request->getVar('delivery_boy_id')))->getResult('array');
                $ongoing_order_data = $this->model->query("select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id and o.delivery_boy_id = ? and op.order_status = 'ongoing' order by datetime desc", array($this->request->getVar('delivery_boy_id')))->getResult('array');
                if((is_array($pending_order_data) && count($pending_order_data) > 0) || (is_array($ongoing_order_data) && count($ongoing_order_data) > 0)) {
                    foreach($pending_order_data as $order) {
                        $order['products'] = $this->model->query("select od.product_id, p.title, p.short_info, p.image, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
                        $data['pending_order'][] = $order;
                    }
                    foreach($ongoing_order_data as $order) {
                        $order['products'] = $this->model->query("select od.product_id, p.title, p.short_info, p.image, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
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
                break;

            case "delivered_order":
                $data = array();
                //view all order for delivery boy app
                $delivered_order_data = $this->model->query("select o.*, op.order_status as order_progress from `order` o, order_progress op where o.id=op.order_id and o.delivery_boy_id = ? and op.order_status = 'delivered' order by datetime desc", array($this->request->getVar('delivery_boy_id')))->getResult('array');
                if((is_array($delivered_order_data) && count($delivered_order_data) > 0)) {
                    foreach($delivered_order_data as $order) {
                        $order['products'] = $this->model->query("select od.product_id, p.title, p.short_info, p.image, od.quantity, od.total from order_detail od, product p where od.product_id=p.id and od.order_id = ?", array($order['id']))->getResult('array');
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
                break;

            case "deliver_order":
                if($this->request->getVar('order_id')) {
                    $data = array(
                        'order_id' => $this->request->getVar('order_id'),
                        'order_status' => 'delivered',
                        'inserted_at'  => date('Y-m-d H:i:s')
                    );
                    $save = $this->order_progress->save($data);
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
                break;
        }
        echo json_encode($res);
    }

    public function product() {
        if($this->request->getVar('product_id')) {
            $res['data'] = $this->model->query("select * from product where id = ?", array($this->request->getVar('product_id')))->getResult('array');
        } else if($this->request->getVar('category_id')) {
            $res['data'] = $this->model->query("select * from product where category_id = ?", array($this->request->getVar('category_id')))->getResult('array');
        } else if($this->request->getVar('sub_category_id')) {
            $res['data'] = $this->model->query("select * from product where sub_category_id = ?", array($this->request->getVar('sub_category_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from product")->getResult('array');
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

    public function popular_product() {
        if($this->request->getVar('product_id')) {
            $res['data'] = $this->model->query("select * from product where id = ? and popular = 'y'", array($this->request->getVar('product_id')))->getResult('array');
        } else if($this->request->getVar('category_id')) {
            $res['data'] = $this->model->query("select * from product where category_id = ? and popular = 'y'", array($this->request->getVar('category_id')))->getResult('array');
        } else if($this->request->getVar('sub_category_id')) {
            $res['data'] = $this->model->query("select * from product where sub_category_id = ? and popular = 'y'", array($this->request->getVar('sub_category_id')))->getResult('array');
        } else {
            $res['data'] = $this->model->query("select * from product where popular = 'y'")->getResult('array');
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
        switch (strtolower($action)) {
            case "new":
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
                break;

            case "view":
                $res['data'] = $this->model->query("select * from rating where product_id = ?", array($this->request->getVar('product_id')))->getResult('array');
                if(is_array($res['data']) && count($res['data']) > 0) {
                    $res['status'] = 1;
                    $res['message'] = 'Data found';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Data not found';
                }
                break;
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
        switch (strtolower($action)) {
            case "add":
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
                break;

            case "check":
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
                break;

            case "count":
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
                break;

            case "update_quantity":
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
                break;

            case "delete":
                if ($this->cart->where('id', $this->request->getVar('cart_id'))->delete()) {
                    $res['data'] = [];
                    $res['status'] = 1;
                    $res['message'] = 'Removed from cart';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Not removed from cart';
                }
                break;

            case "delete_all":
                if ($this->cart->where('customer_id', $this->request->getVar('customer_id'))->delete()) {
                    $res['data'] = [];
                    $res['status'] = 1;
                    $res['message'] = 'All Items Removed from cart';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Items Not removed from cart';
                }
                break;

            case "view":
                $res['data'] = $this->model->query("select c.*, p.category_id, p.sub_category_id, p.title, p.short_info, p.long_info, p.image, p.price, p.display_price, p.unit, p.capacity, p.package_count, p.featured, p.oos, p.popular, p.home_product, (p.price * c.quantity) as total_price from cart c, product p where c.customer_id = ? and c.product_id = p.id", array($this->request->getVar('customer_id')))->getResult('array');
                if(is_array($res['data']) && count($res['data']) > 0) {
                    $res['status'] = 1;
                    $res['message'] = 'Data found';
                } else {
                    $res['data'] = [];
                    $res['status'] = 0;
                    $res['message'] = 'Data not found';
                }
                break;
        }
        echo json_encode($res);
    }
}
