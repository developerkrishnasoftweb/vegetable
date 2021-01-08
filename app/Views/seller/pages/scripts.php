<script src="<?php echo base_url(); ?>/assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<?php echo base_url(); ?>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="<?php echo base_url(); ?>/assets/plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="<?php echo base_url(); ?>/assets/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>

<script src="<?php echo base_url(); ?>/assets/plugins/moment/moment.min.js"></script>
<script src="<?php echo base_url(); ?>/assets/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<!-- DataTables -->
<script src="<?php echo base_url(); ?>/assets/plugins/datatables/jquery.dataTables.js"></script>
<script src="<?php echo base_url(); ?>/assets/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>


<script src="<?php echo base_url(); ?>/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="<?php echo base_url(); ?>/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<?php echo base_url(); ?>/assets/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

<script src="<?php echo base_url(); ?>/assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<script src="<?php echo base_url(); ?>/assets/plugins/sweetalert2/sweetalert2.min.js"></script>
<script src="<?php echo base_url(); ?>/assets/plugins/toastr/toastr.min.js"></script>
<!-- AdminLTE App -->
<!-- Toastr -->
<script src="<?php echo base_url(); ?>/assets/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?php echo base_url(); ?>/assets/dist/js/demo.js"></script>

<script src="<?php echo base_url(); ?>/assets/jquery.form.js"></script>
<script src="<?php echo base_url(); ?>/assets/notification.js"></script>
<!-- page script -->
<script>
    var deleteIds=[];
    $(function () {
        <?php if($_SESSION['my3skill']['type']!='admin' && $ins=='n') { ?>
            $('#addBtn').remove();
        <?php } ?>
        <?php if($_SESSION['my3skill']['type']!='admin' && $del=='n') { ?>
            $('#example1 .remove_data').remove();
            $('#deleteSelectedButton').remove();
        <?php } ?>
        <?php if($_SESSION['my3skill']['type']!='admin' && $modi=='n') { ?>
            $('#example1 .modify_data').remove();
        <?php } ?>
        $('.select2').select2();
        $("#example1").DataTable({
            "columnDefs": [
                {
                    "targets": [0], //first column / numbering column
                    "orderable": false //set not orderable
                }
                ]
        });
        $('#removeAllButton').click(function () {
            if(confirm('Are you sure to remove All record??')){
                $.ajax({
                    type : 'post',
                    url : base_path + 'remove_all',
                    success : function (response) {
                        toastr.success("Records deleted successfully");
                        setTimeout(function () {
                            location.reload();
                        },2000);
                    }
                });
            }
        });
        $('#deleteSelectedButton').click(function () {
            if(confirm('Are you sure to remove Selected record??')){
                $.ajax({
                    type : 'post',
                    data : {
                        'ids' : deleteIds
                    },
                    url : base_path + 'remove_selected',
                    success : function (response) {
                        toastr.success("Records deleted successfully");
                        setTimeout(function () {
                            location.reload();
                        },2000);
                    }
                });
            }
        });
        $('#selectAll').click(function () {
            if($(this).prop('checked'))
                $('.delete_check').prop('checked',true);
            else
                $('.delete_check').prop('checked',false);
            prepare_delete_button();
        });

        $('#example1').on('click','.delete_check',function () {
            prepare_delete_button();
        });
    });
    function prepare_delete_button() {
        var count=0;
        deleteIds=[];
        $('#example1 .delete_check').each(function () {
            if($(this).prop('checked')==true){
                deleteIds.push($(this).data('id'));
                count++;
            }
        });
        if(count>0)
            $('#deleteSelectedButton').fadeIn();
        else
            $('#deleteSelectedButton').fadeOut();
    }
</script>