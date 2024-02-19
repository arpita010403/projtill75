<?php 
include('../includes/connect.php');
include('../functions/common_function.php');
@session_start();//if this page is active then only session will be started  
?>
<?php 

if(isset($_POST['admin_login'])){
    $admin_username=$_POST['admin_username'];
    $admin_password=$_POST['admin_password'];
   //checked users counted rows
    $select_query="Select * from `admin_login` where username='$admin_username'";//checking user with that username is present or not
    $result=mysqli_query($con,$select_query);
    $row_count=mysqli_num_rows($result);
    $row_data=mysqli_fetch_assoc($result);
    $admin_ip=getIPAddress();
    
    
    
    //it will selct only onr row data
    if($row_count>0){
        $_SESSION['username']=$admin_username;
        if(password_verify($admin_password,$row_data['password'])){
           // echo "<script>alert('Login successful')</script>";
           if($row_count==1 and $row_count_cart==0){
            $_SESSION['username']=$admin_username;
            echo "<script>alert('Login successful')</script>";
            echo "<script>window.open('./index.php','_self')</script>";  
           
        }else{
            echo "<script>alert('Invalid credentials')</script>";
        }

    }
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
   
</style>
<body>
    <div class="container-fluid">
        <h2 class="text-center"> Admin Login</h2>
        <div class="row d-flex align-items-center justify-content-center mt-5" >
            <div class="col-lg-12 col-xl-6">
                <!-- /username feild -->
                <form method="POST" action="<?php echo $_SERVER['PHP_SELF'];?>">
                <div class="form-outline mb-4">    
                <label for="admin_username" class="form-label">Username</label>
                <input type="text" name="admin_username" id="admin_username" class="form-control" placeholder="Enter your username" autocomplete="off" required="required">
                    </div>

                <!-- password field -->
                <div class="form-outline mb-4">
                <label for="admin_password" class="form-label">Passowrd</label>
                <input type="password" name="admin_password" id="admin_password" class="form-control" placeholder="Enter your password" autocomplete="off" required="required">
                </div>
                
                <div class="mt-4 pt-2">
                    <input type="submit" name="admin_login" id="" value="Login" class="bg-info py-2 px-3 border-0">
                </div>
                </form>
                
            </div>
        </div>
    </div>
</body>
</html>
