<?php $app=new \Config\App(); ?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Terms | <?= $app->appTitle; ?></title>
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
                        <h1>Terms</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="<?php echo base_url()."/configuration"; ?>">Configurations</a></li>
                            <li class="breadcrumb-item active">Terms</li>
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
                            <h3 class="card-title">Terms</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="<?php echo base_url()."/configuration/terms"; ?>" role="form" method="post" enctype="multipart/form-data" id="form1">
                            <input type="hidden" name="id" id="hid" value="<?php echo $configuration[0]['id']; ?>">
                            <div class="card-body">
                                <h4>Terms</h4>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="terms">Terms</label>
                                            <textarea type="text" class="form-control" name="terms" id="terms"><?php echo $configuration[0]['terms']; ?></textarea>
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

<script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<!-- jQuery -->
<script>
    <?php if(isset($_SESSION['inserted'])) { ?>
    toastr.success("Details saved successfully");
    <?php unset($_SESSION['inserted']); } ?>
    $(document).ready(function () {
        CKEDITOR.replace('terms');
    });
</script>
</body>
</html>
