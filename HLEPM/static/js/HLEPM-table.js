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
                    row.children('td[field="'+key+'"]').html(val);
                });
                HLEPM.ui.dateExtract(row.children('.start_date'));
                HLEPM.ui.dateExtract(row.children('.target_date'));
                $('tbody.contains').append('<tr>'+ row.html() + '</tr>');
            });
        }
}
