<?php $app=new \Config\App(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Manage Product Category | <?= $app->appTitle; ?></title>
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
                        <h1>Product Category Management</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Product Category</li>
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
                            <h3 class="card-title">Manage Product Category</h3>
                        </div>
                        <!-- /.card-header -->

                        <!-- form start -->
                        <form role="form" method="post" enctype="multipart/form-data" id="form1">
                            <input type="hidden" name="id" id="hid">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="home_screen">Select Department</label>
                                            <select class="form-control" name="department_id" id="department_id" required>
                                                <?php foreach ($department as $d) {?>
                                                    <option value="<?= $d['id']; ?>"><?= $d['title']; ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="title">Category Title</label>
                                            <input type="text" class="form-control" name="title" id="title" placeholder="Title" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="image">Category Image</label>
                                            <img src="" id="image-preview" style="display:none; height: 50px;"/>
                                            <input type="file" class="form-control" name="image" id="image" onchange="validateAndUpload(this)">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="position">Positon</label>
                                            <input type="number" class="form-control" name="position" id="position" placeholder="position" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="home_screen">Home Screen</label>
                                            <select type="text" class="form-control" name="home_screen" id="home_screen" required>
                                                <option value="y">Yes</option>
                                                <option value="n">No</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary right">Save Category</button>
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
                            <h3 class="card-title">Manage Product Category</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <button type="button" id="addBtn" class="btn btn-info"><i class="fa fa-plus"></i> Add Product Category</button>
                            <button type="button" id="deleteSelectedButton" class="btn btn-warning" style="display: none;"><i class="fa fa-times"></i> Delete Selected</button><br><bR>
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="selectAll"></th>
                                    <th>Sr.No</th>
                                    <th>Department Name</th>
                                    <th>Category Name</th>
                                    <th>Image</th>
                                    <th>Position</th>
                                    <th>Home Screen</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $cnt=1; foreach ($category as $row) {?>
                                    <tr id="row<?php echo $row['id']; ?>">
                                        <td><input type="checkbox" class="delete_check" data-id="<?= $row['id']; ?>"></td>
                                        <td><?php echo $cnt++; ?></td>
                                        <td><?php echo $row['d_title']; ?></td>
                                        <td><?php echo $row['title']; ?></td>
                                        <td><img src="<?php echo $row['image']; ?>" style="width: 80px;height: 60px;"></td>
                                        <td><?php echo $row['position']; ?></td>
                                        <td><?php echo ($row['home_screen']=='y' ? 'Yes' : 'No'); ?></td>
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
<script>
    var base_path='<?php echo base_url(); ?>/category/',deleteIds=[];
</script>
<!-- ./wrapper -->
<?php echo view('admin/pages/scripts'); ?>
<!-- jQuery -->
<script type="text/javascript">
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
                      toastr.success('Information removed successfully.');
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
              url : base_path + 'modify/'  + that.data('id'),
              success : function (response) {
                  //toastr.info(response);
                  var info=JSON.parse(response);
                  $('#hid').val(info.id);
                  $('#department_id').val(info.department_id);
                  $('#title').val(info.title);
                  $('#position').val(info.position);
                  $('#home_screen').val(info.home_screen);
                  if(info.image.length > 0) {
                    $('#image-preview').css("display", "block");
                    $('#image-preview').attr("src", info.image);
                    $("#image").attr("hidden", "true");
                  }
                  $('#form1').prop('action', base_path + 'update');
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

        $("#image").change(function() {
            $('#image-preview').attr("src", window.URL.createObjectURL(this.files[0]));
        });

        $("#image-preview").click(function() {
            $("#image").click();
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
                    //alert('valid file');
                }
                else{
                    alert('Not valid file');
                    $("#image").val("");
                }
            };
            image.onerror=function (ev) {
                alert('Invalid File');
                $("#image").val("");
            }
        }
    }
</script>
</body>
</html>
