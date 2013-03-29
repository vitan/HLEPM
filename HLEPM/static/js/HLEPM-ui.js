HLEPM.ui = {
    exists:
        function(selector) {
            return ($(selector).length > 0);
        },
    resetForm:
        function(selector) {
            $(selector)[0].reset();
        },
    showModal:
        function(selector) {
            $(selector).show();
        },
    hideModal:
        function(selector) {
            $(selector).hide();
        },
    toggleModal:
        function(selector) {
            $(selector).toggle();
        },
    disableElement:
        function(selector) {
            $(selector).attr('disabled', 'disabled');
        },
    enbleElement:
        function(selector) {
            $(selector).removeAttr('disabled');
        },
    pickingDate:
        function(selector) {
            $(selector).datepicker();
        },
    classifyActive:
        function(selector) {
        $(selector).closest('p').find(".filter").removeClass('classify-active');
        $(selector).addClass('classify-active');
        },
    displayNewRisk:
        function(new_risk){
            var id = $('.risk-list-item:first').attr('id');
            if(!id) {
                $('#risk-issue-list').html(new_risk);
            } else {
                $(new_risk).insertBefore("#"+id);
            }
        },
    displayNewIssue:
        function(new_issue){
            var id = $('.issue-list-item:first').attr('id');
            if(!id) {
                $('#issue-list').html(new_issue);
            } else {
                $(new_issue).insertBefore("#"+id);
            }
        },
    displayUpdateRisk:
        function(id_num, update_risk){
            $('#'+id_num).replaceWith(update_risk);
        },
    displayUpdateIssue:
        function(id_num, update_issue){
            $('#'+id_num).replaceWith(update_issue);
        },
    autoComplete:
        function(selector) {
            $(selector).autocomplete({
                source: function(request, response){
                            var field = $(selector).attr('field');
                            var array = request.term.split(',');
                            var term = array[array.length-1];
                            if( term == '' ) {
                                return;
                            }
                            var filter = field + '#like#' + term;
                            var extra_filter = $(selector).attr('extra_filter');
                            filter = (extra_filter? extra_filter+"," : "") + filter;
                            //data format:
                            //  {
                            //    select_fields: 'username,userid',
                            //    filter: 'username#=#admin,age#>#15' --> format: field#query_type#value,field#query_type#value...
                            //  }
                            var data = {
                                select_fields: field,
                                filters: filter
                            };
                            var url = $(selector).attr('url');

                            HLEPM.ajax.get(url, data, function(ajax_response){
                                if ( HLEPM.ajax.isSuccessful(ajax_response.rc) ){
                                    var result = ajax_response.data.query_result;
                                    response( $.map(result, function(data) {
                                        //TODO (weizhou) Maybe a callback function is better."
                                        return data[field];
                                    }));
                                }
                            });
                        },
                focus: function(event, ui) {
                            event.preventDefault();
                            var array = $(selector).val().split(',');
                            array[array.length-1] = ui.item.value;
                            $(selector).val(array.join(','));
                        },
                select: function(event, ui) {
                            event.preventDefault();
                            var array = $(selector).val().split(',');
                            array[array.length-1] = ui.item.value;
                            $(selector).val(array.join(','));
                        },
            });
        }
}
