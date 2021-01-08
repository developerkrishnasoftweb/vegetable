<?php

use Twilio\Rest\Client;

class Utilities{
        function __construct()
        {
        }
        function get_country_name(){
            try{
                $IPaddress  =  $_SERVER['REMOTE_ADDR'];
                $json = @file_get_contents("http://ipinfo.io/{$IPaddress}");
                $details = json_decode($json);
                $code=isset($details->country)?$details->country:"IN";
//                $file = fopen("assets/countries.csv","r");
//                while(! feof($file)) {
//                    $c = fgetcsv($file);
//                    if ($c[1] == $code) {
//                        return array($c[0],$code);
//                    }
//                }
//                fclose($file);
            }
            catch(Exception $e){
                return "IN";
            }
            return strtoupper($code);
        }
        function send_message($mobile,$message){
            require(APPPATH.'/Libraries/twilio/autoload.php');
            $sid = 'AC6b3236e3e28d8f16381b2c680995d785';
            $token = 'e3994227c450079a0a9e341dcfdac4c7';
            $client = new Client($sid, $token);
            // Use the client to do fun stuff like send text messages!
            try{
                $client->messages->create(
                    $mobile,
                    [
                        // A Twilio phone number you purchased at twilio.com/console
                        'from' => '+12058907110',
                        // the body of the text message you'd like to send
                        'body' => $message
                    ]
                );
                return true;
            }catch (Exception $e){
                return false;
            }
        }
        function send_email($email,$message,$subject="No Subject"){
            $this->email = \Config\Services::email();
            // $this->email->initialize($config);
            $this->email->setmailType("html");
            $this->email->setTo($email);
            $this->email->setFrom("info@saptkrishi.in","Sapt Krishi");
            $this->email->setSubject($subject);
            $this->email->setMessage($message);
            return $this->email->send();
        }
        function validateUser(){
            $menu=new \App\Models\Admin_rights_model();
            $url=basename($_SERVER['REQUEST_URI']);
            if($_SESSION['ether']['type']!="admin"){
                $allowed=$menu->check_permission($url,$_SESSION['ether']['id']);
                if(count($allowed)==0)
                {
                    echo "You are not allowed to access this page";
                    exit;
                }
                else{
                    $data['ins']=$allowed[0]['ins'];
                    $data['del']=$allowed[0]['del'];
                    $data['modi']=$allowed[0]['modi'];
                }
            }
            return $data;
        }
    function push_notification($title,$token,$message,$data=array('status' => 'true')){
        if(!defined('API_ACCESS_KEY'))
            define( 'API_ACCESS_KEY', 'AAAA9aELc4s:APA91bE8W3q49ZWCDfjjyhFDHv0j9hMreLemLbK4FL8E5zyvUslkFmSjsKI3RLPUlZPgG-T5fzczkOpOoyZedNnPejxAV_E-YLey_8j_DWMk4szwWllgtyb-yRRpkH9YtuMUk9pV1UFR');
        $registrationIds = $token;
        $msg = array
        (
            'body' 	=> $message,
            'title'	=> $title,
            'priority' => "high",
            'icon'	=> 'myicon',
            'sound' => 'mySound'
        );
        $fields = array
        (
            'registration_ids' => $registrationIds,
            'data' => $data,
            'priority' => 'high',
            'notification'	=> $msg
        );
        $headers = array
        (
            'Authorization: key=' . API_ACCESS_KEY,
            'Content-Type: application/json'
        );
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
        curl_setopt($ch,CURLOPT_POST, true );
        curl_setopt($ch,CURLOPT_HTTPHEADER, $headers );
        curl_setopt($ch,CURLOPT_RETURNTRANSFER, true );
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, false );
        curl_setopt($ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
        $result = curl_exec($ch );
        curl_close($ch);
        return $result;
    }
}