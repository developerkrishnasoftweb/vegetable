<?php $app=new \Config\App(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Completed Booking | <?= $app->appTitle; ?></title>
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
                        <h1>Completed Booking</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Booking</li>
                            <li class="breadcrumb-item active">Completed Booking</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row" id="data_div">
                <div class="col-12">
                    <!-- /.card -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Completed Booking</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Sr.No</th>
                                    <th>User Name</th>
                                    <th>Business Name</th>
                                    <th>Appointment Date</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $cnt=1; foreach ($booking as $row) {?>
                                    <tr id="row<?php echo $row['id']; ?>">
                                        <td><?php echo $cnt++; ?></td>
                                        <td><?php echo $row['user_name']; ?></td>
                                        <td><?php echo $row['business_name']; ?></td>
                                        <td><?php echo $row['appointment_datetime']; ?></td>
                                        <td>
                                            <a href="javascript:;" class="view_details" data-id="<?php echo $row['id']; ?>"><i class="fa fa-eye"></i></a>
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

<div class="modal fade bd-example-modal-lg" id="modal-default" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Booking Details</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                        <div class="col-8 offset-2">
                            <table class="table table-bordered">
                                <tr>
                                    <td>User Name</td>
                                    <td id="user_name">abc</td>
                                </tr>
                                <tr>
                                    <td>Business Name</td>
                                    <td id="business_name"></td>
                                </tr>
                                <tr>
                                    <td>Type</td>
                                    <td id="type"></td>
                                </tr>
                                <tr>
                                    <td>address</td>
                                    <td id="address"></td>
                                </tr>
                                <tr>
                                    <td>Booking Date</td>
                                    <td id="datetime"></td>
                                </tr>
                                <tr>
                                    <td>Total Amount</td>
                                    <td id="total_amount"></td>
                                </tr>
                                <tr>
                                    <td>booking_amount</td>
                                    <td id="booking_amount"></td>
                                </tr>
                                <tr>
                                    <td>remaining_amount</td>
                                    <td id="remaining_amount"></td>
                                </tr>
                                <tr>
                                    <td>appointment_datetime</td>
                                    <td id="appointment_datetime"></td>
                                </tr>
                                <tr>
                                    <td>status</td>
                                    <td id="status"></td>
                                </tr>
                                <tr>
                                    <td>changed</td>
                                    <td id="changed"></td>
                                </tr>
                                <tr>
                                    <td>approved</td>
                                    <td id="approved"></td>
                                </tr>
                                <tr>
                                    <td>instruction</td>
                                    <td id="instruction"></td>
                                </tr>
                                <tr>
                                    <td>service_provided</td>
                                    <td id="service_provided"></td>
                                </tr>
                                <tr>
                                    <td>remark</td>
                                    <td id="remark"></td>
                                </tr>
                                <tr>
                                    <td>payment_status</td>
                                    <td id="payment_status"></td>
                                </tr>
                                <tr>
                                    <td>payment_id</td>
                                    <td id="payment_id"></td>
                                </tr>
                                <tr>
                                    <td>payout_status</td>
                                    <td id="payout_status"></td>
                                </tr>
                                <tr>
                                    <td>payout_amount</td>
                                    <td id="payout_amount"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <!-- <button type="button" id="save_rights_btn" class="btn btn-primary waves-effect waves-light">Save Rights</button> -->
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script>
    var base_path='<?php echo base_url(); ?>/Booking/',deleteIds=[];
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

        $('#example1').on('click','.view_details',function () {
            id=$(this).data('id');
            $.ajax({
                type : 'post',
                url : base_path + 'get_details/' + id,
                success : function (response) {
                    var info=JSON.parse(response);
                    if(info.length > 0) {
                        $('#user_name').html(info[0].user_name);
                        $('#business_name').html(info[0].business_name);
                        $('#type').html(info[0].type);
                        $('#address').html(info[0].address);
                        $('#datetime').html(info[0].datetime);
                        $('#total_amount').html(info[0].total_amount);
                        $('#booking_amount').html(info[0].booking_amount);
                        $('#remaining_amount').html(info[0].remaining_amount);
                        $('#appointment_datetime').html(info[0].appointment_datetime);
                        $('#status').html(info[0].status);
                        $('#changed').html(info[0].changed);
                        $('#approved').html(info[0].approved);
                        $('#instruction').html(info[0].instruction);
                        $('#service_provided').html(info[0].service_provided);
                        $('#remark').html(info[0].remark);
                        $('#payment_status').html(info[0].payment_status);
                        $('#payment_id').html(info[0].payment_id);
                        $('#payout_status').html(info[0].payout_status);
                        $('#payout_amount').html(info[0].payout_amount);
                        $("#modal-default").modal("show");
                    }
                },
                error : function () {
                    errorAlert('Something went wrong please try again later.');
                }
            });
        });
    });
</script>
</body>
</html>
