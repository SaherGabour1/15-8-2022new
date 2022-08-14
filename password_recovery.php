<?php
session_start(); 

include 'connection.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'mail/Exception.php';
require 'mail/PHPMailer.php';
require 'mail/SMTP.php';


$user_email_address = $_POST['email'];


//Create an instance; passing `true` enables exceptions
$mail = new PHPMailer(true);
$sql = "SELECT email FROM users WHERE email = '$user_email_address' ";
$result = sqlsrv_query( $conn , $sql, array(), array("Scrollable" => 'static'));

if( $result === false ) {
    die( print_r( sqlsrv_errors(), true));
}

if( sqlsrv_fetch( $result ) === false) {
    die( print_r( sqlsrv_errors(), true));
}

// If there is email address found
if(sqlsrv_num_rows($result) == 1){
try {
    //Server settings
    
    $mail->SMTPDebug = SMTP::DEBUG_SERVER;           //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'platletedonate@gmail.com';                     //SMTP username
    $mail->Password   = 'zmsbobutvcdztvni';                               //SMTP password
    $mail->SMTPSecure = 'tls';         //Enable implicit TLS encryption
    $mail->Port = 587;                                  //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('platletedonate@gmail.com', 'platletedonate');
    $mail->addAddress($user_email_address);     //Add a recipient

 
 

    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'nb-s.g platlete donate Password Recovery';

    $mail->Body    =                                                                        'שלום !!   <br>
                            <br> .מישהו ביקש קישור לשינוי הסיסמה שלך.  אתה יכול לעשות זאת דרך הקישור למטה
                            <a href="http://localhost/project2/resetpasswords.html">שנה את הסיסמה שלי </a>.
                          <br>  .אם לא ביקשת זאת, אנא התעלם מאימייל זה
                          .הסיסמה שלך לא תשתנה עד שתיכנס לקישור שלמעלה ותיצור סיסמה חדשה
                            

    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';


    
 

    $mail->send();
    echo "<script> window.open('sucsesssendemail.html', '_self');</script>";
    }
    
    catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }
    

    }
else{

        // If number of one found email address is different than one 
        header("location:failedsendemail.html");

        // echo "The Email Address You Entered, Doesn't Exist";
 }

   

?>