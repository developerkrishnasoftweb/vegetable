<?php
namespace App\Controllers;
use App\Models\Admin_model;

class Clogin extends BaseController
{
    function __construct()
    {
        session_start();
    }
    function index()
	{
        if(isset($_COOKIE['ether_id'])){
            $model=new Admin_model();
            $modify=$model->query('select * from admin where id='.$_COOKIE['ether_id'])->getResult('array');
            $_SESSION['ether']=$modify[0];
            header('location:'.base_url().'/dashboard');
            exit;
        }
        else{
            //return "Yo Yo";
        }
		return view('admin/login');
	}
	function check_login(){
        //return $this->request->getVar('remember'); exit;
        $username=$this->request->getVar('username1');
        $password=$this->request->getVar('password');
        $model=new Admin_model();
        $response=$model->query("select * from `admin` where `email`='$username' and `password`='$password' and `status`='y' or `mobile`='$username' and `password`='$password' and `status`='y'")->getResult('array');
        if(count($response)==1){
            if($this->request->getVar('remember')=="on"){
                setcookie("usernames",$username,time()+(86400 * 7),"/");
                setcookie("ether_id",$response[0]['id'],time()+(86400 * 7),"/");
            }
            $_SESSION['ether']=$response[0];
            header('location:'.base_url().'/dashboard');
            exit;
        }
        else{
            $_SESSION['failed']=1;
            header('location:'.base_url().'/clogin');
            exit;
        }
    }
    function logout(){
        unset($_SESSION['ether']);
        setcookie("usernames","",time()-3600,"/");
        setcookie("ether_id","",time()-3600,"/");
        header('location:'.base_url().'/clogin');
        exit;
    }
    function send(){
        $this->load->library('phpmailer_lib');
        $mail=$this->phpmailer_lib->load();
        $mail->isSMTP();
        $mail->Host='smtp.google.com';
        $mail->SMTPAuth=true;
        $mail->Username='info@ethers.com';
        $mail->Password='Info@123#';
        $mail->Port='587';
        $mail->SetFrom('info#ethers.com','ethers');
        $mail->addAddress('deepakprn78@gmail.com');
        $mail->Subject='Testing Subject';
        $mail->isHTML(true);
        $mailContent="<h5>Hello Testing Mail</h5>";
        $mail->Body=$mailContent;
        if(@!$mail->send()){
            echo "Email Failed";
        }else{
            echo "Email Sent";
        }
    }

}
