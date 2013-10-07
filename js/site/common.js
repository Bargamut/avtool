$(function() {
    $('.frmReset').live('click', function() { resetForm(); });
});

function resetForm() {
    $('#devices').find('select').val('-1');
    $('input[name="temperature"]').val('');
    $('#devices').submit();
}