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
    pickingDate:
        function(selector) {
            $(selector).datepicker();
        },
    classifyActive:
        function(selector) {
        $(selector).closest('p').find(".filter").removeClass('classify-active');
        $(selector).addClass('classify-active');
    },
    dateConvert:
        function(selector) {
            var dateString = $(selector).html();
            if (dateString) {
                var date = new Date(dateString);
                $(selector).html((date.getMonth()+1) + '/' + date.getDate() + '/' + date.getFullYear());
            }
        },
    autoComplete:
        function(selector) {
            $(selector).autocomplete({
                source: function(request, response){
                            var field = $(selector).attr('field');
                            var filter = field + '#like#' + request.term;
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
                        }
            });
        }
}
