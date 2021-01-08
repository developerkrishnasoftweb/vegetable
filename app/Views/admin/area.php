<?php $app=new \Config\App(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Manage Area | <?= $app->appTitle; ?></title>
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
                        <h1>Area Management</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Area</li>
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
                            <h3 class="card-title">Manage Area</h3>
                        </div>
                        <!-- /.card-header -->

                        <!-- form start -->
                        <form role="form" method="post" enctype="multipart/form-data" id="form1">
                            <input type="hidden" name="id" id="hid">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="title">Area Name</label>
                                            <input type="text" class="form-control" name="title" id="title" placeholder="Area Name" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="pincode">Pincode</label>
                                            <input type="text" class="form-control" name="pincode" id="pincode" placeholder="Pincode" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="charge">Charge</label>
                                            <input type="text" class="form-control" name="charge" id="charge" placeholder="Charge" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="country_id">Country</label>
                                            <select type="text" class="form-control select2" name="country_id" id="country_id" required>
                                                <option value="">Select Country</option>
                                                <?php foreach($country as $row) { ?>
                                                    <option value="<?= $row['id']; ?>"><?= $row['title']; ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="state_id">State</label>
                                            <select type="text" class="form-control select2" name="state_id" id="state_id" required>
                                                <option value="">Select State</option>
                                                <?php foreach($state as $row) { ?>
                                                    <option value="<?= $row['id']; ?>"><?= $row['title']; ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="city_id">City</label>
                                            <select class="form-control select2" name="city_id" id="city_id" required>
                                                <option value="">Select City</option>
                                                <?php foreach($city as $row) { ?>
                                                    <option value="<?= $row['id']; ?>"><?= $row['title']; ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary right">Save Area</button>
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
                            <h3 class="card-title">Manage Area</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <button type="button" id="addBtn" class="btn btn-info"><i class="fa fa-plus"></i> Add Area</button>
                            <button type="button" id="deleteSelectedButton" class="btn btn-warning" style="display: none;"><i class="fa fa-times"></i> Delete Selected</button><br><bR>
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="selectAll"></th>
                                    <th>Sr.No</th>
                                    <th>Area</th>
                                    <th>Pincode</th>
                                    <th>Charge</th>
                                    <th>City</th>
                                    <th>State</th>
                                    <th>Country</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $cnt=1; foreach ($area as $row) {?>
                                    <tr id="row<?php echo $row['id']; ?>">
                                        <td><input type="checkbox" class="delete_check" data-id="<?= $row['id']; ?>"></td>
                                        <td><?php echo $cnt++; ?></td>
                                        <td><?php echo $row['title']; ?></td>
                                        <td><?php echo $row['pincode']; ?></td>
                                        <td><?php echo $row['charge']; ?></td>
                                        <td><?php echo $row['city']; ?></td>
                                        <td><?php echo $row['state']; ?></td>
                                        <td><?php echo $row['country']; ?></td>
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
    var base_path='<?php echo base_url(); ?>/area/',deleteIds=[];
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

        $(".select2").select2();

       $('#addBtn').click(function () {
            $('#form1').prop('action',base_path + 'insert');
            $('#data_div').hide();
            $('#form_div').fadeIn();
       });
       $('#cancelBtn').click(function () {
            $('#form1').prop('action',base_path + 'insert');
            $('#form1').trigger('reset');
            $('#form_div').hide();
            $('#data_div').fadeIn();
       });

       $('#country_id').change(function () {
          var id=$('#country_id').val();
          $.ajax({
              type : 'post',
              url : base_path + 'state/'  + id,
              success : function (response) {
                  //toastr.info(response);
                  var info=JSON.parse(response);
                  $('#state_id').html('<option value="">Select State</option>');
                  info.forEach(function(obj) {
                    $('#state_id').append('<option value="'+obj.id+'">'+obj.title+'</option>');
                    console.log(obj);
                  });
              },
              error : function (response) {
                  toastr.error('Something went wrong please reload the page and try again.');
              }
          });
        });

       $('#state_id').change(function () {
          var id=$('#state_id').val();
          $.ajax({
              type : 'post',
              url : base_path + 'city/'  + id,
              success : function (response) {
                  //toastr.info(response);
                  var info=JSON.parse(response);
                  $('#city_id').html('<option value="">Select City</option>');
                  info.forEach(function(obj) {
                    $('#city_id').append('<option value="'+obj.id+'">'+obj.title+'</option>');
                    console.log(obj);
                  });
              },
              error : function (response) {
                  toastr.error('Something went wrong please reload the page and try again.');
              }
          });
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
                  $('#title').val(info.title);
                  $('#pincode').val(info.pincode);
                  $('#charge').val(info.charge);
                  $('#city_id').val(info.city_id);
                  $('#state_id').val(info.state_id);
                  $('#country_id').val(info.country_id);
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
    });
</script>
</body>
</html>
