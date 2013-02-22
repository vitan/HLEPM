HLEPM.ui = {
    exists:
        function(selector) {
            return ($(selector).length > 0);
        },
    showModal:
        function(selector) {
            $(selector).show();
        },
    hideModal:
        function(selector) {
            $(selector).hide();
        },
    pickingDate:
        function(selector) {
            $(selector).datepicker();
        },
    autoComplete:
        function(selector) {
            $(selector).autocomplete({
                source: function(request, response){
                            var field = $(selector).attr('field');
                            var filter = field + '#like#' + request.term;
                            var extra_filter = $(selector).attr('extra_filter');
                            if (extra_filter) {
                                filter = filter + "," + extra_filter;
                            }
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
                        }
            });
        }
}
