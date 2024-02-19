<?php 
include('../includes/connect.php');
include('../functions/common_function.php');
@session_start();//if this page is active then only session will be started  
?>
<?php 

if(isset($_POST['user_login'])){
    $user_username=$_POST['user_username'];
    $user_password=$_POST['user_password'];
   //checked users counted rows
    $select_query="Select * from `user_table` where username='$user_username'";//checking user with that username is present or not
    $result=mysqli_query($con,$select_query);
    $row_count=mysqli_num_rows($result);
    $row_data=mysqli_fetch_assoc($result);
    $user_ip=getIPAddress();
    
    //cart item
    $select_query_cart="Select * from `cart_details` where ip_address='$user_ip'";//checking user with that username is present or not
    $select_cart=mysqli_query($con,$select_query_cart);
    $row_count_cart=mysqli_num_rows($select_cart);
    
    //it will selct only onr row data
    if($row_count>0){
        $_SESSION['username']=$user_username;
        if(password_verify($user_password,$row_data['user_password'])){
           // echo "<script>alert('Login successful')</script>";
           if($row_count==1 and $row_count_cart==0){
            $_SESSION['username']=$user_username;
            echo "<script>alert('Login successful')</script>";
            echo "<script>window.open('profile.php','_self')</script>";
           }else{
            $_SESSION['username']=$user_username;
            echo "<script>alert('Login successful')</script>";
            echo "<script>window.open('payment.php','_self')</script>";
           }
        }else{
            echo "<script>alert('Invalid credentials')</script>";
        }

    }else{
        echo "<script>alert('Invalid credentials')</script>";
    }
}
?>  
<!DOCTYPE html>
<html lang="en">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User login</title>
    <!-- boostrap css link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!--css link-->
    <link rel="stylesheet" href="style.css">
<style>
    body {
  font-family: sans-serif;
}

</style>
<body>
    <div class="container-fluid">
        <h2 class="text-center"> User Login</h2>
        <div class="row d-flex align-items-center justify-content-center mt-5" >
            <div class="col-lg-12 col-xl-6">
                <!-- /username feild -->
                <form method="POST" action="<?php echo $_SERVER['PHP_SELF'];?>">
                <div class="form-outline mb-4">    
                <label for="user_username" class="form-label">Username</label>
                <input type="text" name="user_username" id="user_username" class="form-control" placeholder="Enter your username" autocomplete="off" required="required">
                    </div>

                <!-- password field -->
                <div class="form-outline mb-4">
                <label for="user_password" class="form-label">Passowrd</label>
                <input type="password" name="user_password" id="user_password" class="form-control" placeholder="Enter your password" autocomplete="off" required="required">
                </div>
                
                <div class="mt-4 pt-2">
                    <input type="submit" name="user_login" id="" value="Login" class="bg-info py-2 px-3 border-0">
                    <p class="small fw-bold mt-2 pt-1 mb-0">Don"t have an account? <a href="user_register.php" class="text-danger">Register</a> </p>
                </div>
                </form>
                
            </div>
        </div>
    </div>
</body>
</html>
