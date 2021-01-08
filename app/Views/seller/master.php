<?php $app=new \Config\App(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Masters | <?= $app->appTitle; ?> </title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
                        <h1>Manage Masters</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">All Pages</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div style="display: none;" class="row" id="form_div">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Manage Pages</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form method="post" action="" id="form1" role="form">
                            <input type="hidden" name="hid" id="hid">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Title</label>
                                            <input name="title" type="text" class="form-control" id="title" placeholder="Enter Title" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Link</label>
                                            <input name="link" type="text" class="form-control" id="link" placeholder="Enter Link" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Icon</label>
                                            <input type="text" name="icon" class="form-control" id="icon" placeholder="fa fa-user">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Position</label>
                                            <input type="number" name="position" class="form-control" id="position" placeholder="Enter Position">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Parent</label>
                                            <select name="parent" class="form-control" id="parent">
                                                <option value="0">Root</option>
                                                <?php foreach ($menus['menu'] as $m) { ?>
                                                    <option value="<?= $m['id']; ?>"><?= $m['title']; ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                <button type="button" id="cancelBtn" class="btn btn-danger">Cancel Button</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card -->
                </div>
                <!--/.col (left) -->
            </div>
            <div class="row" id="data_div">
                <div class="col-12">

                    <!-- /.card -->

                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">All Pages</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="overflow: scroll;">
                            <button type="button" id="addBtn" class="btn btn-warning"><i class="fa fa-plus"></i> Add New </button>
                            <br>
                            <br>
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Sr.No</th>
                                    <th>Page</th>
                                    <th>Parent</th>
                                    <th>Link</th>
                                    <th>Icon</th>
                                    <th>Position</th>
                                    <th>IsVisible??</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $cnt=1; foreach($master as $a): ?>
                                    <tr id="row<?php echo $a['id']; ?>">
                                        <td><?php echo $cnt++; ?></td>
                                        <td><?php echo $a['title']; ?> </td>
                                        <td><?php echo $a['parent_id']==0?"Root":$parent[$a['parent_id']]; ?> </td>
                                        <td><?php echo $a['link']; ?> </td>
                                        <td><?php echo $a['icon']; ?> </td>
                                        <td><?php echo $a['position']; ?></td>
                                        <td id="status<?php echo $a['id']; ?>">
                                            <a href="javascript:;" class="status_change" data-status="<?php echo $a['status']=="y"?"n":"y"; ?>" data-id="<?php echo $a['id']; ?>"><span class="label label-<?php echo $a['status']=='y'?"success":"danger"; ?>"><?php echo $a['status']=='y'?"<i class='fa fa-check'></i> Shown":"<i class='fa fa-ban'></i>  Hidden"; ?></span></a>
                                        </td>
                                        <td>
                                            <a href="#" title="Change" data-id="<?php echo $a['id']; ?>" class="modify_record"> <i class="fa fa-pen"></i></a>&nbsp;
                                            <a href="#" title="Remove" data-id="<?php echo $a['id']; ?>" class="remove_record"> <i class="fa fa-trash"></i></a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
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

</div>
<!-- ./wrapper -->

<?php echo view('admin/pages/scripts'); ?>
<script type="text/javascript">
    var base_path='<?php echo base_url(); ?>/master/';
    var table_name='admin';
    var admin_id;
    $(document).ready(function() {
        <?php if(isset($_SESSION['inserted'])) { ?>
        successAlert('Record Inserted Successfully');
        <?php unset($_SESSION['inserted']); } ?>
        <?php if(isset($_SESSION['updated'])) { ?>
        successAlert('Record Updated Successfully');
        <?php unset($_SESSION['updated']); } ?>
        $('.del_check').click(function () {
            var cnt=0;
            $('.del_check').each(function () {
                if($(this).prop('checked'))
                    cnt++;
            });
            if(cnt!=0)
                $('#delete_btn').fadeIn();
            else
                $('#delete_btn').fadeOut();
        });
        $('#addBtn').click(function () {
            $('#form1').prop('action',base_path + 'insert');
            $('#data_div').hide();
            $('#form_div').fadeIn();
        });
        $('#cancelBtn').click(function () {
            $('#form_div').hide();
            $('#data_div').fadeIn();
        });
        $('#delete_all_btn').click(function () {
            if(confirm('Are you sure want to delete all records??')){
                $.ajax({
                    type : 'post',
                    url : base_path + 'delete_all_record',
                    success : function (response) {
                        successAlert("All Record Removed Successfully");
                        location.reload();
                    },
                    error : function () {
                        errorAlert('Something went wrong please try again..');
                    }
                });
            }
        });
        $('#delete_btn').click(function () {
            var ids=Array();
            $('.del_check').each(function () {
                if($(this).prop('checked'))
                    ids.push($(this).data('id'));
            });
            if(confirm('Are you sure want to delete??')){
                $.ajax({
                    type : 'post',
                    data : {
                        'ids' : ids,
                        'type' : 'm'
                    },
                    url : base_path + 'delete_record',
                    success : function (response) {
                        successAlert("Record Removed Successfully");
                        location.reload();
                    },
                    error : function () {
                        errorAlert('Something went wrong please try again..');
                    }
                });
            }
        });
        $('#example1').on('click','.remove_record',function () {
            var id=$(this).data('id');
            if(confirm('Are you sure want to delete??')){
                $.ajax({
                    type : 'post',
                    url : base_path + 'delete/' + id,
                    success : function (response) {
                        successAlert("Record Removed Successfully");
                        $('#row'+id).remove();
                    },
                    error : function () {
                        errorAlert('Something went wrong please try again..');
                    }
                });
            }
        });
        $('#example1').on('click','.modify_record',function () {
            var id=$(this).data('id');
            $.ajax({
                type : 'post',
                url : base_path + 'modify/' + id,
                success : function (response) {
                    var info=JSON.parse(response);
                    $('#form1').prop('action',base_path + 'update');
                    $('#hid').val(info.id);
                    $('#title').val(info.title);
                    $('#link').val(info.link);
                    $('#parent').val(info.parent_id);
                    $('#icon').val(info.icon);
                    $('#position').val(info.position);
                    $('#data_div').hide();
                    $('#form_div').fadeIn();
                },
                error : function () {
                    errorAlert('Something went wrong please try again..');
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
                    successAlert("Status Changed Successfully");
                },
                error : function () {
                    errorAlert('Something went wrong please try again..');
                }
            });
        });
    } );
</script>
</body>
</html>
