<?php
$app=new \Config\App();
?>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<?php echo base_url(); ?>/dashboard" class="brand-link">
        <img src="<?php echo base_url(); ?>/assets/dist/img/AdminLTELogo.png"
             alt="<?= $app->appTitle; ?>"
             class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light"><?= $app->appTitle; ?></span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<?php echo base_url()."/".$_SESSION['ether']['image']; ?>" class="img-circle elevation-2" alt="User Image" style="height: 34px;width: 34px;border-radius: 50%;">
            </div>
            <div class="info">
                <a href="#" class="d-block"><?php echo $_SESSION['ether']['name']; ?></a>
            </div>
        </div>
        <?php
            $url=basename($_SERVER['REQUEST_URI']);
        ?>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="<?php echo base_url()."/dashboard"; ?>" class="nav-link <?php echo $url=="dashboard"?"active":""; ?>">
                    <i class="nav-icon fas fa-tachometer-alt"></i>
                    <p>
                        Dashboard
                    </p>
                    </a>
                </li>
                <?php foreach ($menus['menu'] as $m) { $flag=false; foreach ($menus['submenu'][$m['id']] as $s) { if($url==basename($s['link'])) $flag=true; } ?>
                    <li class="nav-item <?php echo $flag==true?"menu-open":""; ?>" <?php if(count($menus['submenu'][$m['id']])!=0) echo "has-treeview"; ?>>
                        <a href="<?php echo base_url(),"/".$m['link']; ?>" class="nav-link <?php echo $url==basename($m['link'])?"active":""; ?> ">
                            <i class="<?php echo $m['icon']!=""?$m['icon']." nav-icon":"far fa-circle nav-icon"; ?>"></i>
                            <p> <?php echo $m['title']; ?></p>
                            <?php if(count($menus['submenu'][$m['id']])!=0) { ?> <i class="right fas fa-angle-left"></i> <?php } ?>
                        </a>
                        <?php if(count($menus['submenu'][$m['id']])!=0) { ?>
                        <ul class="nav nav-treeview">
                            <?php foreach ($menus['submenu'][$m['id']] as $s) { ?>
                            <li class="nav-item">
                                <a href="<?php echo base_url(),"/".$s['link']; ?>" class="nav-link <?php echo $url==basename($s['link'])?"active":""; ?> ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p> <?php echo $s['title']; ?></p>
                                </a>
                            </li>
                            <?php } ?>
                        </ul>
                        <?php } ?>
                    </li>
                <?php } ?>

                <li class="nav-header">OTHER LINKS</li>
                <li class="nav-item">
                    <a href="<?php echo base_url()."/clogin/logout"; ?>" class="nav-link">
                        <i class="nav-icon far fa-circle text-danger"></i>
                        <p class="text">Logout</p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>