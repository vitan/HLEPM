HLEPM.form = {

    /* START field validators */

    /* END field validators */

    newForm:
        function(isValid, data) {
            return {
                'isValid': isValid,
                'data': data
            }
        },
    requirementFormFill:
        function(selector) {
            //Finish form url
            var url_head = $('#update-requirement').attr('action').replace(/\/[\d]*$/, '/'+$(selector).text());
            $('#update-requirement').attr('action', url_head);

            $(selector).closest('tr').children('.requirement_field').each(function() {
                var text = $.trim($(this).text());

                //Select related option eg. Type, Product, Version and so on.
                var select_option = '#update-requirement select[name="' + $(this).attr('name') + '"] option';
                $(select_option).filter(function() {
                    return $.trim(this.text) == text;
                }).attr('selected', true);

                //Fill related input eg. Author, Start date and so on.
                var input = '#update-requirement input[name="' + $(this).attr('name') + '"]';
                $(input).val(text);
            });
        }
}
