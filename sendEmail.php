<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

if(isset($_POST['fullname']) && isset($_POST['email'])){
    $newfullname = $_POST['fullname'];
    $newemail = $_POST['email'];
    $newtitle = $_POST['title'];
    $newbody = $_POST['body'];

    require 'mail/Exception.php';
    require 'mail/PHPMailer.php';
    require 'mail/SMTP.php';

    $mail = new PHPMailer();

    //smtp settings
    $mail->isSMTP();
    $mail->Host = "smtp.gmail.com";
    $mail->SMTPAuth = true;
    $mail->Username   = 'platletedonate@gmail.com';                  
    $mail->Password   = 'zmsbobutvcdztvni';    
    $mail->Port = 587;
    $mail->SMTPSecure = "tls";

    //email settings
    $mail->isHTML(true);
    $mail->setFrom($newemail, $newfullname);
    $mail->addAddress("platletedonate@gmail.com");
    $mail->Subject = ("$newemail ($newtitle)");
    $mail->Body = $newbody;

    if($mail->send()){
        echo "<script> window.open('sucsesscontact.html', '_self');</script>";
    }
    else
    {
        $status = "failed";
        $response = "Something is wrong: <br>" . $mail->ErrorInfo;
    }

    exit(json_encode(array("status" => $status, "response" => $response)));
}

?>