<?php $app=new \Config\App(); ?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Privacy Policy | <?= $app->appTitle; ?></title>
    <?php echo view('admin/pages/styles'); ?>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <?php echo view('admin/pages/header'); ?>

    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <?php echo view('admin/pages/sidebar'); ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Privacy policy</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">Configurations</li>
                            <li class="breadcrumb-item active">Privacy Policy</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row" id="form_div">
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Privacy Policy</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="<?php echo base_url()."/seo/privacy_policy"; ?>" role="form" method="post" enctype="multipart/form-data" id="form1">
                            <input type="hidden" name="id" id="hid" value="<?php echo $configuration[0]['id']; ?>">
                            <div class="card-body">
                                <h4>SEO Configurations</h4>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="keywords">Meta Keywords</label>
                                            <textarea class="form-control" name="keywords" id="keywords"><?php echo $configuration[0]['privacy_meta_keywords']; ?></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="description">Meta Description</label>
                                            <textarea class="form-control" name="description" id="description"><?php echo $configuration[0]['privacy_meta_description']; ?></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary right">Save Configurations</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card -->
                </div>

            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <?php echo view('admin/pages/footer'); ?>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<?php echo view('admin/pages/scripts'); ?>
<!-- jQuery -->
<script>
    <?php if(isset($_SESSION['inserted'])) { ?>
    toastr.success("Configurations saved successfully");
    <?php unset($_SESSION['inserted']); } ?>
</script>
</body>
</html>
