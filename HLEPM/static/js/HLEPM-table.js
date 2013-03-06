HLEPM.table = {

    /* Requirement and project table filling up. */

    requirementModelSelectedFields:
        function() {
            var select_fields = [];
            $('tr.template > td.requirement_field').each(function() {
                select_fields.push($(this).attr('field'));
            });
            return select_fields;
        },
    requirementTableFill:
        function(data) {
            $('tbody.contains').html('');
            $.each(data, function(index, value) {
                var row = $('tr.template').clone();
                $.each(value, function(key, val) {
                    var td_child = row.children('td[field="'+key+'"]');
                    if( td_child.children().length ) {
                        td_child.children('a').html(val);
                    } else {
                        td_child.html(val);
                    }
                });
                HLEPM.ui.dateConvert(row.children('.start_date'));
                HLEPM.ui.dateConvert(row.children('.target_date'));
                $('tbody.contains').append('<tr>'+ row.html() + '</tr>');
            });
        }
}
