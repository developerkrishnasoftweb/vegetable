<?php $app=new \Config\App(); ?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Manage Configurations | <?= $app->appTitle; ?></title>
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
                        <h1>Configurations</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Configurations</li>
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
                            <h3 class="card-title">Manage Configurations</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="<?php echo base_url()."/configuration/insert"; ?>" role="form" method="post" enctype="multipart/form-data" id="form1">
                            <input type="hidden" name="id" id="hid" value="<?php echo $configuration[0]['id']; ?>">
                            <div class="card-body">
                                <h4>Website Configurations</h4>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="title">Title</label>
                                            <input type="text" class="form-control" name="title" id="title" value="<?php echo $configuration[0]['title']; ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="logo">Choose Logo</label>
                                                    <?php if(strlen($configuration[0]['logo']) > 0) { ?>
                                                    <img src="<?php echo base_url()."/".$configuration[0]['logo']; ?>" id="logo-preview" style="display:block; height: 50px;"/>
                                                    <input type="file" class="form-control" name="logo" id="logo" onchange="validateAndUploadLogo(this);document.getElementById('logo-preview').src = window.URL.createObjectURL(this.files[0])" style="width:0px; height:0px; opacity:0; position:absolute;z-index:-1;" hidden>
                                                    <?php } else { ?>
                                                    <input type="file" class="form-control" name="logo" onchange="validateAndUploadLogo(this)">
                                                    <?php } ?>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="favicon">Choose Fav Icon</label>
                                                    <?php if(strlen($configuration[0]['favicon']) > 0) { ?>
                                                    <img src="<?php echo base_url()."/".$configuration[0]['favicon']; ?>" id="favicon-preview" style="display:block; height: 50px;"/>
                                                    <input type="file" class="form-control" name="favicon" id="favicon" onchange="validateAndUploadFavicon(this);document.getElementById('favicon-preview').src = window.URL.createObjectURL(this.files[0])" style="width:0px; height:0px; opacity:0; position:absolute;z-index:-1;" hidden>
                                                    <?php } else { ?>
                                                    <input type="file" class="form-control" name="favicon" onchange="validateAndUploadFavicon(this)">
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="contact">Contact Number</label>
                                            <input type="text" class="form-control" name="contact" id="contact" value="<?php echo $configuration[0]['contact']; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="email">Email Address</label>
                                            <input type="email" class="form-control" name="email" id="email" value="<?php echo $configuration[0]['email']; ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="copyright">Copyright Text</label>
                                            <textarea type="text" class="form-control" name="copyright" id="copyright" placeholder="&copy; 2020 ABC"><?php echo $configuration[0]['copyright']; ?></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="address">Address</label>
                                            <textarea type="text" class="form-control" name="address" id="address"><?php echo $configuration[0]['address']; ?></textarea>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <h4>Settings</h4>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="currency">Currency</label>
                                            <input type="text" class="form-control" name="currency" id="currency" value="<?php echo $configuration[0]['currency']; ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="timezone">Timezone</label>
                                            <input type="text" class="form-control" name="timezone" id="timezone" value="<?php echo $configuration[0]['timezone']; ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="min_order">Min Order</label>
                                            <input type="text" class="form-control" name="min_order" id="min_order" value="<?php echo $configuration[0]['min_order']; ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="tax">Tax</label>
                                            <input type="text" class="form-control" name="tax" id="tax" value="<?php echo $configuration[0]['tax']; ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="discount">Discount</label>
                                            <input type="text" class="form-control" name="discount" id="discount" value="<?php echo $configuration[0]['discount']; ?>">
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <h4>SEO Configurations</h4>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="analytic_key">Google Analytic Code</label>
                                            <textarea type="text" class="form-control" name="analytic_key" id="analytic_key"><?php echo $configuration[0]['analytic_key']; ?></textarea>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <h4>Payment Configurations</h4>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="razorpay_key">Razorpay Key</label>
                                            <textarea type="text" class="form-control" name="razorpay_key" id="razorpay_key"><?php echo $configuration[0]['razorpay_key']; ?></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="razorpay_secret_key">Razorpay Secret Key</label>
                                            <textarea type="text" class="form-control" name="razorpay_secret_key" id="razorpay_secret_key"><?php echo $configuration[0]['razorpay_secret_key']; ?></textarea>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <h4>Site Configurations</h4>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="is_offline">Site Offline</label>
                                            <select type="text" class="form-control" name="is_offline" id="is_offline">
                                                <?php if($configuration[0]['is_offline'] == 'true') { ?>
                                                    <option value='true'>True</option>
                                                    <option value='false'>False</option>
                                                <?php } else { ?>
                                                    <option value='false'>False</option>
                                                    <option value='true'>True</option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <br>
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
    $(document).ready(function () {
       $("#logo-preview").click(function() {
            $("#logo").click();
        });

       $("#favicon-preview").click(function() {
            $("#favicon").click();
        });
    });
    

    function validateAndUploadLogo(input){
        var URL = window.URL || window.webkitURL;
        var file = input.files[0];
        if (file) {
            var image = new Image();
            image.src = URL.createObjectURL(file);
            image.onload = function() {
                if (this.width) {
                    //alert('valid file');
                }
                else{
                    alert('Not valid file');
                    $("#logo").val("");
                }
            };
            image.onerror=function (ev) {
                alert('Invalid File');
                $("#logo").val("");
            }
        }
    }
    

    function validateAndUploadFavicon(input){
        var URL = window.URL || window.webkitURL;
        var file = input.files[0];
        if (file) {
            var image = new Image();
            image.src = URL.createObjectURL(file);
            image.onload = function() {
                if (this.width) {
                    //alert('valid file');
                }
                else{
                    alert('Not valid file');
                    $("#favicon").val("");
                }
            };
            image.onerror=function (ev) {
                alert('Invalid File');
                $("#favicon").val("");
            }
        }
    }
</script>
</body>
</html>
