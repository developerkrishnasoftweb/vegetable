<?php $app=new \Config\App(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Manage Delivery Boy | <?= $app->appTitle; ?></title>
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
                        <h1>Delivery Boy Management</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Delivery Boy</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row" id="form_div" style="display: none;">
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Manage Admin</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form role="form" method="post" enctype="multipart/form-data" id="form1">
                            <input type="hidden" name="id" id="hid">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="first_name">First Name</label>
                                            <input type="text" class="form-control" name="first_name" id="first_name" placeholder="Enter First Name" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="last_name">Last Name</label>
                                            <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Enter Last Name" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="email">Email Address</label>
                                            <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email Address" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="mobile">Contact Number</label>
                                            <input type="text" class="form-control" name="mobile" id="mobile" placeholder="Enter Contact Number" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="password">Choose Password</label>
                                            <input type="text" class="form-control" name="password" id="password" placeholder="Choose Password for Admin" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="gender">Gender</label>
                                            <select name="gender" id="gender" class="form-control" required>
                                                <option value="male">Male</option>
                                                <option value="female">Female</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="image">Choose Image</label>
                                            <img src="" id="image-preview" style="display:none; height: 50px;"/>
                                            <input type="file" class="form-control" name="image" id="image" onchange="validateAndUpload(this)">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary right">Save Delivery Boy</button>
                                <button type="button" id="cancelBtn" class="btn btn-danger right">Cancel</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card -->
                </div>
            </div>

            <div class="row" id="data_div">
                <div class="col-12">
                    <!-- /.card -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Registered Delivery Boy</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <button type="button" id="addBtn" class="btn btn-info"><i class="fa fa-plus"></i> Add Delivery Boy</button><br><br>
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Sr.No</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Gender</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $cnt=1; foreach ($delivery_boy as $row) {?>
                                    <tr id="row<?php echo $row['id']; ?>">
                                        <td><?php echo $cnt++; ?></td>
                                        <td><img src="<?= base_url()."/".$row['image']; ?>" alt="<?= $row['first_name'] ?>" style="width: 100px;"></td>
                                        <td><?php echo $row['first_name'].' '.$row['last_name']; ?></td>
                                        <td><?php echo $row['email']; ?></td>
                                        <td><?php echo $row['mobile']; ?></td>
                                        <td><?php echo $row['gender']=="male"?"Male":"Female"; ?></td>
                                        <td id="status<?php echo $row['id']; ?>">
                                            <a href="javascript:;" class="status_change" data-status="<?php echo $row['status']=="y"?"n":"y"; ?>" data-id="<?php echo $row['id']; ?>"><span class="label label-<?php echo $row['status']=='y'?"success":"danger"; ?>"><?php echo $row['status']=='y'?"<i class='fa fa-check'></i> Shown":"<i class='fa fa-ban'></i>  Hidden"; ?></span></a>
                                        </td>
                                        <td>
                                            <a title="Modify Information" href="javascript:;" class="modify_data" data-id="<?php echo $row['id']; ?>"><i class="fa fa-pen"></i></a>
                                            <a title="Delete Admin" href="javascript:;" class="remove_data" data-id="<?php echo $row['id']; ?>"><i class="fa fa-trash"></i></a>
                                        </td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>
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
<script type="text/javascript">
    var base_path='<?php echo base_url(); ?>/delivery_boy/',root_path='<?= base_url() ?>/';
    $(document).ready(function () {
        <?php if(isset($_SESSION['inserted'])) { ?>
            toastr.success("Information added successfully");
        <?php unset($_SESSION['inserted']); } ?>
        <?php if(isset($_SESSION['updated'])) { ?>
            toastr.success("Information updated successfully");
        <?php unset($_SESSION['updated']); } ?>
        $('#addBtn').click(function () {
            $('#form1').prop('action',base_path + 'insert');
            $('#data_div').hide();
            $('#form_div').fadeIn();
        });
        $('#cancelBtn').click(function () {
            $('#form1').prop('action',base_path + 'insert');
            $('#form1').trigger('reset');
            $('#image-preview').hide();
            $('#image-preview').attr("src", "");
            $("#image").removeAttr("hidden");
            $('#form_div').hide();
            $('#data_div').fadeIn();
        });
        $('#example1').on('click','.remove_data',function () {
          var that=$(this);
          if(confirm('Are you sure to remove data??')){
              $.ajax({
                  type : 'post',
                  url : base_path + 'delete/' + that.data('id'),
                  success : function (response) {
                      toastr.success('User removed successfully.');
                      $('#row'+that.data('id')).remove();
                  },
                  error : function (response) {
                      toastr.error('Something went wrong please reload the page and try again.');
                  }
              });
          }
        });
        $('#example1').on('click','.modify_data',function () {
            var that=$(this);
            $.ajax({
                type : 'post',
                url : base_path + 'modify/' + that.data('id'),
                success : function (response) {
                    //toastr.info(response);
                    var info=JSON.parse(response);
                    $('#hid').val(info.id);
                    $('#first_name').val(info.first_name);
                    $('#last_name').val(info.last_name);
                    if(info.image.length > 0) {
                        $('#image-preview').css("display", "block");
                        $('#image-preview').attr("src",  root_path +info.image);
                        $("#image").attr("hidden", "true");
                    }
                    $('#mobile').val(info.mobile);
                    $('#email').val(info.email);
                    $('#password').val(info.password);
                    $('#gender').val(info.gender);
                    $('#form1').prop('action',base_path + 'update');
                    $('#data_div').hide();
                    $('#form_div').fadeIn();
                },
                error : function (response) {
                    toastr.error('Something went wrong please reload the page and try again.');
                }
            });
        });
        $('#example1').on('click','.status_change',function () {
            var id=$(this).data('id');
            var status=$(this).data('status');
            $.ajax({
                type : 'post',
                data : {
                    'id' : id,
                    'status' : status
                },
                url : base_path + 'status_change',
                success : function (response) {
                    if(response=='yes'){
                        if(status=='y')
                            $('#status'+id).html('<a href="javascript:;" class="status_change" data-status="n" data-id="'+id+'"><span class="label label-success"><i class="fa fa-check"></i> Shown</span></a>');
                        else
                            $('#status'+id).html('<a href="javascript:;" class="status_change" data-status="y" data-id="'+id+'"><span class="label label-danger"><i class="fa fa-ban"></i> Hidden</span></a>');
                    }
                    successNotification("Status Changed Successfully");
                },
                error : function () {
                    errorAlert('Something went wrong please try again..');
                }
            });
        });
    });
</script>
</body>
</html>
