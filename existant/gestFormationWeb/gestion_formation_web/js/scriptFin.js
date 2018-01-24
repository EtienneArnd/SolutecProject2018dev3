$(function () {
    $.datepicker.setDefaults($.datepicker.regional["fr"]);
    $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy' });
    $(".datepicker").datepicker('option', 'firstDay', 1);
});