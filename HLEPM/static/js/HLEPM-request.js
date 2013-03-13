HLEPM.editRequest = {
    addOneRequirement:
        function() {
            //Pseudo ajax post for file uploading
            $('#add-requirement').iframePostForm({
                json: true,
                complete: function(response) {
                    if ( HLEPM.ajax.isSuccessful(response.rc) ) {
                        HLEPM.ui.hideModal("#new");
                    } else {
                        ;
                    }
                }
            });
        },
    addOneRisk:
        function(){
            var form = $("#add-risk");
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response){
                 if ( HLEPM.ajax.isSuccessful(response.rc)){
                     HLEPM.ui.hideModal("#new");
                     HLEPM.ui.displayNewRisk(response.data['new_risk']);
                 } else {
                     ;
                 }
            });
        },
    requirementAddFormRequest:
        function(selector) {
            var url = $('#add-requirement').attr('action');
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#add-requirement .container').html(response.data.add_form_html);
                    HLEPM.ui.autoComplete('.author');
                    HLEPM.ui.autoComplete('.parent');
                    HLEPM.bind.bindDatePicker();
                }
            });
        },
    requirementUpdateFormRequest:
        function(selector) {
            var url = $(selector).attr('url');
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#update-requirement').attr('action', url);
                    $('#update-requirement .container').html(response.data.update_form_html);
                    HLEPM.ui.autoComplete('.author');
                    HLEPM.ui.autoComplete('.parent');
                    HLEPM.bind.bindDatePicker();
                }
            });
        },
    updateOneRequirement:
        function() {
            //Pseudo ajax post for file uploading
            $('#update-requirement').iframePostForm({
                json: true,
                complete: function(response) {
                    if ( HLEPM.ajax.isSuccessful(response.rc) ) {
                        HLEPM.ui.hideModal("#update");
                    } else {
                        ;
                    }
                }
            });
        },
    dataTableRequest:
        function(data) {
            var url = $('.search_url').val();
            HLEPM.ajax.get(url, data, function(ajax_response){
                if ( HLEPM.ajax.isSuccessful(ajax_response.rc) ){
                    $('tbody.container').html(ajax_response.data.query_result);
                    HLEPM.editRequest.paginatorEvent();
                }
            });
        },
    paginatorEvent:
        function() {
            $("div.pagination a").live('click', function(event) {
                event.preventDefault();
                var url = $(this).attr('href');
                HLEPM.ajax.get(url, "", function(ajax_response){
                    if ( HLEPM.ajax.isSuccessful(ajax_response.rc) ){
                        $('tbody.container').html(ajax_response.data.query_result);
                    }
                });
            });
        }
}
