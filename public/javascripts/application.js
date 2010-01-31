$(document).ready(function() {
  $('form select.nice_select').append('<option value="new">autre</option>');
});

$(function() {
  $('form select.nice_select').live('change', function() {
    if (this.value == 'new') {
        var newName = prompt('Entrer un nouveau nom');
        $(this).append('<option value="">' + newName + '</option>');
    }
  });
});