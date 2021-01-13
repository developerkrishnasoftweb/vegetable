<?php $app=new \Config\App(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Product Gallery | <?= $app->appTitle; ?></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php echo view('admin/pages/styles'); ?>
    <style>
        div.gallery {
            display: block;
            margin: 5px;
            float: left;
        }

        div.gallery .images {
            display: inline-block;
            width: 100%;
            height: 100%;
            margin: 1%;
        }

        div.gallery .images img {
            display: block;
            width: 144px;
            height: 90px;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        div.gallery .images desc {
            padding: 15px;
            text-align: center;
        }
    </style>

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <?php echo view('admin/pages/header'); ?>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <?php echo view('admin/pages/sidebar');?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Product Gallery</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Manage Event Gallery</li>
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
                            <h3 class="card-title">Image Form</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form id="form1" role="form" method="post" action="<?php echo base_url(); ?>/product/add_product_img" enctype="multipart/form-data">
                            <input type="hidden" name="product_id" id="product_id" value="<?= $id; ?>">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputFile">File input</label>
                                            <div class="input-group">
                                                <div class="custom-file">
                                                    <input type="file" name="image[]" class="custom-file-input" id="image" multiple required onchange="validateAndUpload(this);">
                                                    <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Save Image</button>
                                <a href="<?= base_url().'/product'; ?>" class="btn btn-danger" id="cancelBtn">Cancel</a>
                            </div>
                        </form>
                    </div><!-- /.card -->

                </div>
            </div>
            <div class="row" id="data_div">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Event Gallery</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?php foreach ($product_img as $p) {?>
                                <div class="gallery" id="col<?= $p['id'];?>" >
                                    <div class="images">
                                        <img src="<?= base_url()."/".$p['image'];?>" alt="No Image">
                                        <button data-id="<?= $p['id'];?>" class="btn-sm btn-danger remove_data">Delete</button>
                                        <!--<div class="desc">Add a description of the image here</div>-->
                                    </div>
                                </div>
                            <?php }?>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <?php echo view('admin/pages/footer');?>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<?php echo view('admin/pages/scripts');?>
<script>
    $(document).ready(function () {
        $('#cancelBtn').click(function () {
            window.close();
        });
        $('.remove_data').click(function(){
            var that=$(this);
            if(confirm('Are you sure')){
                $.ajax({
                    type : 'post',
                    url : '<?php echo base_url();?>/product/delete_product_image/' + that.data('id'),
                    success : function (response) {
                        alert('Image Deleted');
                        $('#col'+that.data('id')).remove();
                    },
                    error : function (response) {
                        toastr.error('Something went wrong please reload the page and try again.');
                    }
                });
            }
        });
    });

    function validateAndUpload(input){
        var URL = window.URL || window.webkitURL;
        var file = input.files[0];
        if (file) {
            var image = new Image();
            image.src = URL.createObjectURL(file);
            image.onload = function() {
                if (this.width) {
                }
                else{
                    $('#image').val("");
                }
            };
            image.onerror=function (ev) {
                alert('Invalid File');
                $('#image').val("");
            }
        }
    }
</script>
</body>
</html>
