ready = function(){
    $('.datepicker').datepicker({
        format: 'mm-dd-yyyy',
        autoclose: true,
        todayHighlight: true
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);