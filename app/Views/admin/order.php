<?php $app=new \Config\App(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Manage Order | <?= $app->appTitle; ?></title>
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
                        <h1>Order Management</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Order</li>
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
                            <h3 class="card-title">All Order</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Sr.No</th>
                                    <th>Customer Detail</th>
                                    <th>Order Detail</th>
                                    <th>Payment Detail</th>
                                    <th>Total Price</th>
                                    <th>Order Progress</th>
                                    <th>Assign</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $cnt=1; foreach ($order as $row) {?>
                                    <tr id="row<?php echo $row['id']; ?>">
                                        <td><?php echo $cnt++; ?></td>
                                        <td>
                                            Name : <?php echo $row['first_name']." ".$row['last_name']; ?><bR>
                                            Mobile : <?php echo $row['mobile']; ?><bR>
                                            Email : <?php echo $row['email']; ?>
                                        </td>
                                        <td>
                                            Order No : <?php echo $row['order_no']; ?><br>
                                            Order Date : <?php echo date('d M,Y',strtotime($row['order_date'])); ?><br>
                                            Order Time : <?php echo date('h:i A',strtotime($row['order_time'])); ?><br>
                                        </td>
                                        <td>
                                            Payment Status : <?php echo $row['payment_status']=='y'?"Complete":"Pending"; ?><br>
                                            Payment Mode : <?php echo $row['payment_mode']; ?><br>
                                            <?php if($row['reference_no']!="") { ?>
                                            Transaction Type : <?php echo $row['transaction_type']; ?><br>
                                            Reference No. : <?php echo $row['reference_no']; ?><br>
                                            <?php } ?>
                                        </td>
                                        <td><i class="fa fa-rupee-sign"></i> <?php echo $row['total_price']; ?></td>
                                        <td>
                                            Order Status : <strong id="order_status<?= $row['id']; ?>"><?php echo $row['order_status']; ?></strong><bR>
                                            <a href="#" class="update_status" data-status="<?= $row['order_status'] ?>" data-name="<?php echo $row['first_name']." ".$row['last_name']; ?>" data-id="<?= $row['id'] ?>">Update Status</a>
                                        </td>
                                        <td>

                                            Assign Boy : <strong id="assigned<?= $row['id']; ?>"><?php echo isset($boys[$row['delivery_boy_id']])?$boys[$row['delivery_boy_id']]:"Not Assigned"; ?></strong><bR>
                                            <a href="#" class="assign_order" data-boy="<?= $row['delivery_boy_id']==0?"":$row['delivery_boy_id'] ?>" data-id="<?= $row['id'] ?>">Assign Order</a>
                                        </td>
                                        <td>
                                            <a title="View Invoice" href="<?= base_url() ?>/report/invoice/<?php echo $row['id']; ?>"><i class="fa fa-eye"></i></a>
                                            <a title="Delete Order" href="javascript:;" class="remove_data" data-id="<?php echo $row['id']; ?>"><i class="fa fa-trash"></i></a>
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
<div class="modal fade" id="orderStatusModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Update Status of Order</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="<?= base_url()."/order/update_status"; ?>" id="statusForm" enctype="multipart/form-data">
                    <textarea style="display: none;" name="hid" id="hid"></textarea>
                    <table class="table table-hover">
                        <tr>
                            <td><label>Customer Name</label></td>
                            <td id="customerDisplayName">{{customer_name}}</td>
                        </tr>
                        <tr>
                            <td><label for="orderStatus">Order Status</label></td>
                            <td>
                                <select name="orderStatus" id="orderStatus" class="form-control">
                                    <option value="pending">Pending</option>
                                    <option value="confirmed">Confirmed</option>
                                    <option value="shipped">Shipped</option>
                                    <option value="out_of_delivery">Out of Delivery</option>
                                    <option value="delivered">Delivered</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="message">Message</label></td>
                            <td>
                               <textarea name="message" id="message" class="form-control" rows="3"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="notify">Notify User</label></td>
                            <td>
                               <input type="checkbox" name="notify" id="notify" value="y"> Notify User
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="saveUpdateButton">Save Update</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="assignOrderModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Update Status of Order</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="<?= base_url()."/order/assign_order"; ?>" id="assignForm" enctype="multipart/form-data">
                    <textarea style="display: none;" name="orderId" id="orderId"></textarea>
                    <table class="table table-hover">
                        <tr>
                            <td><label for="delivery_boy">Select Delivery Boy</label></td>
                            <td>
                                <select name="delivery_boy" id="delivery_boy" class="form-control">
                                    <option value="">Select Delivery Boy</option>
                                    <?php foreach ($boys as $k=>$v){ ?>
                                    <option value="<?= $k ?>"><?= $v ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="saveAssignButton">Save Update</button>
            </div>
        </div>
    </div>
</div>
<!-- ./wrapper -->
<?php echo view('admin/pages/scripts'); ?>
<!-- jQuery -->
<script type="text/javascript">
    var base_path='<?php echo base_url(); ?>/order/';
    $(document).ready(function () {
        <?php if(isset($_SESSION['inserted'])) { ?>
            toastr.success("Information added successfully");
        <?php unset($_SESSION['inserted']); } ?>
        <?php if(isset($_SESSION['updated'])) { ?>
            toastr.success("Information updated successfully");
        <?php unset($_SESSION['updated']); } ?>
        $('#saveUpdateButton').click(function () {
            if($('#message').val()===''){
                toastr.error("Please enter message");
                $('#message').val('').focus();
                return false;
            }
            $('#statusForm').ajaxSubmit({
                beforeSubmit: function () {
                    $.LoadingOverlay('show');
                },
                success : function (response) {
                    $.LoadingOverlay('hide');
                    var info=JSON.parse(response);
                    if(info.status==='true'){
                        $('#order_status'+$('#hid').val()).html($('#orderStatus').val());
                        toastr.success('Status updated successfully');
                        $('#orderStatusModal').modal('hide');
                    }
                },
                error : function () {
                    $.LoadingOverlay('hide');
                }
            });
        });
        $('#saveAssignButton').click(function () {
            if($('#delivery_boy').val()===''){
                toastr.error("Please select Delivery Boy");
                $('#delivery_boy').val('').focus();
                return false;
            }
            $('#assignForm').ajaxSubmit({
                beforeSubmit: function () {
                    $.LoadingOverlay('show');
                },
                success : function (response) {
                    $.LoadingOverlay('hide');
                    var info=JSON.parse(response);
                    if(info.status==='true'){
                        $('#assigned'+$('#orderId').val()).html($('#delivery_boy option:selected').text());
                        $('#delivery_boy').val('');
                        toastr.success('Status updated successfully');
                        $('#assignOrderModal').modal('hide');
                    }
                },
                error : function () {
                    $.LoadingOverlay('hide');
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
                      toastr.success('User removed successfully.');
                      $('#row'+that.data('id')).remove();
                  },
                  error : function (response) {
                      toastr.error('Something went wrong please reload the page and try again.');
                  }
              });
          }
        });
        $('#example1').on('click','.update_status',function () {
            var that=$(this);
            $('#customerDisplayName').html(that.data('name'));
            $('#hid').html(that.data('id'));
            $('#orderStatus').val(that.data('status'));
            $('#orderStatusModal').modal('show');
        });
        $('#example1').on('click','.assign_order',function () {
            var that=$(this);
            $('#orderId').html(that.data('id'));
            $('#delivery_boy').val(that.data('boy'));
            $('#assignOrderModal').modal('show');
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
