<?php


function goback()
{ 
    header("refresh:1; url=resetpasswords.html");
    exit;
}
    session_start(); 
    include 'connection.php';

      // User came form password recovery email form
        
        // Get form input fields 
        $user_id = $_POST['id_number']; // User id number
        $new_password = $_POST['new_password']; // New Password
        $new_password_copy = $_POST['new_password_copy']; // The repeated password


        $sql = "SELECT idnum FROM users WHERE idnum = '$user_id' ";
        $result = sqlsrv_query( $conn , $sql, array(), array("Scrollable" => 'static'));
        
        if( $result === false ) {
            die( print_r( sqlsrv_errors(), true));
        }

        if( sqlsrv_fetch( $result ) === false) {
            die( print_r( sqlsrv_errors(), true));
        }

        
        if(sqlsrv_num_rows($result) == 1){ // If exactly only one user has been found with the given id

            if(isset($new_password) && isset($new_password_copy) ){// If two password inputs are setted

                if($new_password == $new_password_copy){    

                    $sql = "UPDATE users
                            SET passwords= $new_password
                            WHERE idnum = $user_id";


                    
                    $options =  array('Scrollable' => SQLSRV_CURSOR_FORWARD);
                    $result = sqlsrv_query( $conn , $sql);  
                    
                    
                    if( $sql ) { // If the query is successful
                        sqlsrv_commit( $conn );  // Commit transaction
                        header("Location: sucsesschangepassword.html");
                    } 

                    else { // Query is not successful
                        sqlsrv_rollback( $conn ); //Rollback Database
                        header("Location: notsucsesspage.html"); // Redirect and show the user failure alert

                    }

                } 
                     
                else{ // If the password and its repeatment are NOT identical
                    echo "<script type='text/javascript'>alert('שגיאה !! סיסמא אינה תואמת , נא לנסות שוב');window.close();</script>";
                    goback(); // Redirect and show the user failure alert
                }
            }
        }

        else{ // If no user has been found with the given id
          /*  header("Location: notsucsesspage3.html");*/
   
          echo "<script type='text/javascript'>alert('ת.ז שהזנת לא נמצאת במערכת ,נא לנסות שוב');window.close();</script>";
          goback();
        }
    

?>