jQuery(function() {
    return $('#author_name').autocomplete({
        source: $('#author_name').data('autocomplete-source'),
        select: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.label);
            $('#author_id').val(ui.item.value);
        }
    });
});

function clear_value() {
    if ($('#author_name').val() == ''){
        $('#author_id').val('');
    }
}
