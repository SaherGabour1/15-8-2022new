<?php

include "connection.php"; 
         
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="userlayout.css">


    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/main.css" rel="stylesheet">
</head>
<body>

<div class="main" >
        <nav>
            <div class="logo">
                <img src="Picture3.png" > 
            </div>
            <div class="nav-links" >
                <ul>
                
                    <li><a href="contact.html" >צור קשר </a></li>
                    <li><a href="" >רשימת חולים</a></li>
                    <li><a href="hospital.html" >מעבדות בנק הדם</a></li>
                    <li><a href="home.html" >דף בית </a></li>
                </ul> 
            </div>
            <div class="welcome"> 
            <?php     
                 session_start();

                 $newidnum = $_SESSION["idnum"]; // Get users ID from the active session

     

            $sql = "SELECT idnum FROM users where idnum='$newidnum'";
            $result = sqlsrv_query($conn, $sql);
            $my_array = sqlsrv_fetch_array($result); 

          
            ?>

            <div class="user-name">
              
              <?php 
                    
                   echo " שלום : ".$newidnum; //Printing users ID number
                    ?>
            </div> 
            </div>
        </nav>


        <hr width="70%" > 


        <div class="container">
      <strong class="title">My Profile</strong>
    </div>
    
    
    <div class="profile-box box-left">

      <?php

        if(isset($_SESSION['prompt'])) {
          showPrompt();
        }


        $query = "SELECT * FROM users WHERE idnum = '".$_SESSION['idnum']."' AND passwords = '".$_SESSION['passwords']."'";

        ;

        if($result = sqlsrv($con, $query)) {

          $row = sqlsrv_fetch_assoc($result);

          echo "<div class='info'><strong>Student No:</strong> <span>".$row['idnum']."</span></div>";
          echo "<div class='info'><strong>Student Name:</strong> <span>".$row['lname'].", ".$row['fname']."</span></div>";
          echo "<div class='info'><strong>Course:</strong> <span>".$row['age']."</span></div>";
          echo "<div class='info'><strong>Year Level:</strong> <span>".$row['phone']."</span></div>";
          echo "<div class='info'><strong>Year Level:</strong> <span>".$row['email']."</span></div>";
          echo "<div class='info'><strong>Year Level:</strong> <span>".$row['c']."</span></div>";

          $query_date = "SELECT DATE_FORMAT(date_joined, '%m/%d/%Y') FROM students WHERE id = '".$_SESSION['userid']."'";
          $result = sqlsrv_query($con, $query_date);

          $row = sqlsrv_fetch_row($result);

          echo "<div class='info'><strong>Date Joined:</strong> <span>".$row[0]."</span></div>";

        } else {

          die("Error with the query in the database");

        }

      ?>
      
      <div class="options">
        <a class="btn btn-primary" href="editprofile.php">Edit Profile</a>
        <a class="btn btn-success" href="changepassword.php">Change Password</a>
      </div>

      
    </div>

  </section>*/


        
    
</body>
</html>



