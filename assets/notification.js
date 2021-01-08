
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
    });
    function successAlert(message){
        Toast.fire({
            type: 'success',
            title: message
        })
    }
    function errorAlert(message){
        Toast.fire({
            type: 'error',
            title: message
        })
    }function infoAlert(message){
        Toast.fire({
            type: 'info',
            title: message
        })
    }
    function warningAlert(message){
        Toast.fire({
            type: 'warning',
            title: message
        })
    }
    function questionAlert(message){
        Toast.fire({
            type: 'question',
            title: message
        })
    }
    function successNotification(message){
        toastr.success(message)
    }
    function errorNotification(message){
        toastr.error(message)
    }
    function infoNotification(message){
        toastr.info(message)
    }
    function warningNotification(message){
        toastr.info(message)
    }
