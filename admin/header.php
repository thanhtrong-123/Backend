<?php
session_start();
if (isset($_SESSION['user'])) {
    if (isset($_SESSION['permision'])) {
        $permission = $_SESSION['permision'];
        if ($permission != 1) {
            header('location:../login/index.php');
        }
    }
} else {
    header('location:../login/index.php');
}

?>
<?php
require "config.php";
require "models/db.php";
require "models/product.php";
require "models/manufacture.php";
require "models/protype.php";
require "models/sale.php";
require "models/user.php";
require "models/role.php";
require "models/order.php";
$product = new Product;
$manufacture = new Manufacture;
$protype = new Protype;
$sale = new Sale;
$user = new User;
$role = new Role;
$order = new Order;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý Electro</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
</head>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
        </div>


        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">


            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="info">
                        <a href="#" class="d-block">ADMIN</a>
                    </div>
                </div>

                

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                        <li class="nav-item menu-open">
                            <a href="index.php" class="nav-link <?php if ($_SERVER['PHP_SELF'] == '/Project ThanhTrong/admin/index.php') {
                                                                    echo 'active';
                                                                } ?>">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Dashboard
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="products.php" class="nav-link <?php if ($_SERVER['PHP_SELF'] == '/Project ThanhTrong/admin/products.php' || $_SERVER['PHP_SELF'] == '/nhom5_ST6_BE1_NH21/admin/addProduct.php') {
                                                                        echo 'active';
                                                                    } ?>">
                                <i class="nav-icon fas fa-th"></i>
                                <p>
                                    Products
                                    <span class="right badge badge-danger">New</span>
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="manufactures.php" class="nav-link <?php if ($_SERVER['PHP_SELF'] == '/Project ThanhTrong/admin/manufactures.php' || $_SERVER['PHP_SELF'] == '/nhom5_ST6_BE1_NH21/admin/addManufacture.php') {
                                                                            echo 'active';
                                                                        } ?>">
                                <i class="nav-icon fas fa-th"></i>
                                <p>
                                    Manufactures
                                    <span class="right badge badge-danger">New</span>
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="protypes.php" class="nav-link <?php if ($_SERVER['PHP_SELF'] == '/Project ThanhTrong/admin/protypes.php' || $_SERVER['PHP_SELF'] == '/nhom5_ST6_BE1_NH21/admin/addProtype.php') {
                                                                        echo 'active';
                                                                    } ?>">
                                <i class="nav-icon fas fa-th"></i>
                                <p>
                                    Protypes
                                    <span class="right badge badge-danger">New</span>
                                </p>
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="users.php" class="nav-link <?php if ($_SERVER['PHP_SELF'] == '/Project ThanhTrong/admin/users.php' || $_SERVER['PHP_SELF'] == '/nhom5_ST6_BE1_NH21/admin/addUser.php') {
                                                                    echo 'active';
                                                                } ?>">
                                <i class="nav-icon fas fa-th"></i>
                                <p>
                                    User
                                    <span class="right badge badge-danger">New</span>
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="roles.php" class="nav-link <?php if ($_SERVER['PHP_SELF'] == '/Project ThanhTrong/admin/roles.php' || $_SERVER['PHP_SELF'] == '/nhom5_ST6_BE1_NH21/admin/addRole.php') {
                                                                    echo 'active';
                                                                } ?>">
                                <i class="nav-icon fas fa-th"></i>
                                <p>
                                    Roles
                                    <span class="right badge badge-danger">New</span>
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="logout.php" class="nav-link">
                                <i class="nav-icon fas fa-th"></i>
                                <p>
                                    Thoát
                                    <span class="right badge badge-danger "><span class="ion-log-out"></span></span>
                                </p>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>