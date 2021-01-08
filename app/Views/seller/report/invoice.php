<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Order Details | Invoice</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <style type="text/css">
        @media print {
            #printButton{
                display: none;
            },
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
        <!-- Content Header (Page header) -->
        <section class="content">
            <div class="container-fluid">
                <center>
                <img src="<?php echo base_url()."/".$configuration[0]['logo']; ?>" class="img-circle elevation-2" alt="User Image" style="width:100px;height: 100px;border-radius: 50%;" id="business_logo">
                </center>
                <br>
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 style="text-align: center;">Invoice</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <!-- Main content -->
                        <div class="invoice p-3 mb-3">
                            <!-- title row -->
                            <!-- info row -->
                            <div class="row invoice-info">
                                <div class="col-sm-4 invoice-col">
                                    <strong>User Details</strong>
                                    <address>
                                        Name : <?= $order['name']; ?><br>
                                        Address : <?= $order['address1'].', '.$order['address2'].' '.$order['area'].', '.$order['city'].', '.$order['state'].' '.$order['pincode']; ?> <br>
                                        Landmark : <?= $order['landmark']; ?> <br>
                                        Phone: +91 <?= $order['mobile']; ?><br>
                                        Email: <?= $order['email']; ?>
                                    </address>
                                </div>
                                <!-- /.col -->
                                <div class="col-sm-4 invoice-col">
                                    <strong>Order Details</strong>
                                    <address>
                                        Order Type : <?= ucfirst($order['type']); ?><br>
                                        Date : <?= date('d-m-Y',strtotime($order['order_date'])); ?><br>
                                        Time : <?= date('H:i A',strtotime($order['order_time'])); ?><br>
                                        Payment Mode : <?= $order['payment_mode']; ?><br>
                                        Payment Status : <?= $order['payment_status']; ?><br>

                                    </address>
                                </div>
                                <!-- /.col -->
                                <div class="col-sm-4 invoice-col">
                                    <b>Order ID</b>: <?= $order['order_no']; ?>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <!-- Table row -->
                            <div class="row">
                                <div class="col-12 table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>Qty</th>
                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>Subtotal</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php foreach ($order['products'] as $s ){ ?>
                                        <tr>
                                            <td><?= $s['quantity']; ?></td>
                                            <td><?= $s['title']; ?></td>
                                            <td><?= $s['total']; ?></td>
                                            <td><?= $s['total'] * $s['quantity']; ?></td>
                                        </tr>
                                        <?php } ?>
                                    </table>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <br>
                            <br>
                            <div class="row">
                                <!-- accepted payments column -->
                                <!-- /.col -->
                                <div class="col-6">
                                    <p class="lead">Amount Details</p>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                                <th style="width:50%">Total:</th>
                                                <td><?= $order['total_price']; ?> <?= strtoupper($order['currency']); ?></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <button type="button" id="printButton" class="btn-success" onclick="print();">Print</button>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <!-- this row will not appear when printing -->
                        </div>
                        <!-- /.invoice -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    <!-- /.content-wrapper -->
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<?= base_url(); ?>/assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<?= base_url(); ?>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<?= base_url(); ?>/assets/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?= base_url(); ?>/assets/dist/js/demo.js"></script>
</body>
</html>
