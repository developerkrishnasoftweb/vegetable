<?php $app=new \Config\App(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Pending Payouts | <?= $app->appTitle; ?></title>
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
                        <h1>Pending Payouts</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Payment</li>
                            <li class="breadcrumb-item active">Pending Payouts</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row pending" id="data_div">
                <div class="col-12">
                    <!-- /.card -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Pending Payouts</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Sr.No</th>
                                    <th>Business Name</th>
                                    <th>Pending Transaction</th>
                                    <th>Total Amount</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $cnt=1; foreach ($booking as $row) {?>
                                    <tr id="row<?php echo $row['id']; ?>">
                                        <td><?php echo $cnt++; ?></td>
                                        <td><?php echo $row['name']; ?></td>
                                        <td><?php echo $row['pending_transaction']; ?></td>
                                        <td><?php echo $row['total_amount']; ?></td>
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

            <div class="row business" id="data_div" style="display: none;">
                <div class="col-12">
                    <!-- /.card -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Pending Payouts</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example2" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="selectAll1"></th>
                                    <th>Sr.No</th>
                                    <th>User Name</th>
                                    <th>Business Name</th>
                                    <th>Pending Payment</th>
                                    <th>Booking Date</th>
                                </tr>
                                </thead>
                                <tbody id="pending_payouts_data">
                                </tbody>
                            </table>

                        </div>
                        <!-- /.card-body -->

                        <div class="card-footer">
                            <p id="totalAmount" style="float: right"></p>
                        </div>

                        <!-- form start -->
                        <form role="form" method="post" enctype="multipart/form-data" id="paySelectedButton" style="display:none">
                            <input type="text" class="form-control" name="booking_id" id="booking_id" readonly required hidden>
                            <input type="text" class="form-control" name="business_id" id="business_id" readonly required hidden>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="payment_mode">Select Payment Mode</label>
                                            <select class="form-control select2" name="payment_mode" id="payment_mode" required>
                                                <option value="">Select Payment Mode</option>
                                                <option value="UPI">UPI</option>
                                                <option value="IMPS">IMPS</option>
                                                <option value="NEFT">NEFT</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="business_id">Business</label>
                                            <input type="text" class="form-control" name="business_name" id="business_name" placeholder="Business" readonly required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="reference_no">Reference No</label>
                                            <input type="text" class="form-control" name="reference_no" id="reference_no" placeholder="Reference No" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="amount">Total Amount</label>
                                            <input type="text" class="form-control" name="amount" id="amount" placeholder="Total Amount" readonly required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="description">Description</label>
                                            <textarea type="text" class="form-control" name="description" id="description"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary right">Save Payout</button>
                            </div>
                        </form>
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
    var base_path='<?php echo base_url(); ?>/payouts/',bookingIds=[];
</script>
<!-- ./wrapper -->
<?php echo view('admin/pages/scripts'); ?>
<!-- jQuery -->
<script type="text/javascript">
    $(document).ready(function () {
        //$("#example2").dataTable();
        <?php if(isset($_SESSION['inserted'])) { ?>
            toastr.success("Information added successfully");
        <?php unset($_SESSION['inserted']); } ?>
        <?php if(isset($_SESSION['updated'])) { ?>
            toastr.success("Information updated successfully");
        <?php unset($_SESSION['updated']); } ?>

        $('.view_details').click(function() {
            $('.pending').hide();
            $('.business').fadeIn();
            id=$(this).data('id');
            $("#business_id").val(id);
            $.ajax({
                type : 'post',
                url : base_path + 'get_pending_payouts/' + id,
                success : function (response) {
                    var info=JSON.parse(response);
                    console.log(info);
                    if(info.length > 0) {
                        var cnt = 1;
                        $("#pending_payouts_data").html("");
                        info.forEach(function(obj) {
                            console.log(obj);
                            $("#pending_payouts_data").append('\
                                <tr id="row'+obj.id+'">\
                                    <td><input type="checkbox" class="pay_check" data-id="'+obj.id+'" data-amount="'+obj.remaining_amount+'"></td>\
                                    <td>'+cnt+'</td>\
                                    <td>'+obj.user_name+'</td>\
                                    <td>'+obj.business_name+'</td>\
                                    <td>'+obj.remaining_amount+'</td>\
                                    <td>'+obj.datetime+'</td>\
                                </tr>\
                            ');
                            $("#business_name").val(obj.business_name);
                            cnt++;
                        });
                    }
                },
                error : function () {
                    errorAlert('Something went wrong please try again later.');
                }
            });
       });

       $('#selectAll1').click(function () {
            if($(this).prop('checked'))
                $('.pay_check').prop('checked',true);
            else
                $('.pay_check').prop('checked',false);
            prepare_pay_button();
        });


        $('#example2').on('click','.pay_check',function () {
            prepare_pay_button();
        });

        function prepare_pay_button() {
            var count=0;
            bookingIds=[];
            totalAmount = 0;
            $('#example2 .pay_check').each(function () {
                if($(this).prop('checked')==true){
                    bookingIds.push($(this).data('id'));
                    totalAmount = totalAmount + $(this).data('amount');
                    $("#amount").val(totalAmount);
                    count++;
                }
            });
            $("#booking_id").val(bookingIds);
            if(totalAmount > 0) {
                $("#totalAmount").show();
                $("#totalAmount").html('Total : '+totalAmount + ' RS');
            } else {
                $("#totalAmount").hide();
            }
            if(count>0) {
                $('#paySelectedButton').prop('action',base_path + 'savePayouts');
                $('#paySelectedButton').fadeIn();
            } else {
                $('#paySelectedButton').prop('action',base_path + 'savePayouts');
                $('#paySelectedButton').fadeOut();
            }
        }
    });
</script>
</body>
</html>
