HLEPM.editRequest = {
    addOneRequirement:
        function() {
            //Pseudo ajax post for file uploading
            $('#add-requirement').iframePostForm({
                json: true,
                complete: function(response) {
                    if ( HLEPM.ajax.isSuccessful(response.rc) ) {
                        HLEPM.ui.hideModal("#new");
                        $('tbody.container').prepend(response.data.latest_added);
                    } else {
                        $('#add-requirement .container').html(response.msg.invalid_form_html);
                        HLEPM.ui.autoComplete('.author');
                        HLEPM.ui.autoComplete('.parent');
                        HLEPM.bind.bindDatePicker();
                        HLEPM.bind.bindParentTypeChange();
                        HLEPM.bind.bindDisabledToggle();
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
                     $('#new').html(response.msg['error_new_risk'])
                     HLEPM.ui.autoComplete('.reporter2');
                     HLEPM.ui.pickingDate(".datePicker2");
                }
            });
        },
    addOneIssue:
        function(){
            var form = $("#add-issue");
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response){
               if ( HLEPM.ajax.isSuccessful(response.rc)){
                    HLEPM.ui.hideModal("#new");
                    HLEPM.ui.displayNewIssue(response.data['new_issue']);
               } else {
                    $('#new').html(response.msg['error_new_issue'])
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker2");
               }
            });
        },
    updateOneRisk:
        function(id_num){
            var form = $("#update-risk-"+id_num);
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                     HLEPM.ui.hideModal("#update-"+id_num);
                     HLEPM.ui.displayUpdateRisk(id_num, response.data['update_risk'])
                } else {
                    $('#update-'+id_num).html(response.msg['error_risk']);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker2");
                }
            });
        },
    updateOneIssue:
        function(id_num){
            var form = $("#update-issue-"+id_num);
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                     HLEPM.ui.hideModal("#update-"+id_num);
                     HLEPM.ui.displayUpdateIssue(id_num, response.data['update_issue'])
                } else {
                    $('#update-'+id_num).html(response.msg['error_issue']);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker2");
                }
            });
        },
    updateRiskFormRequest:
        function(selector){
            var url = selector.attr('url');
            var id_num = selector.attr('id').split('-')[2]
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#update-'+id_num).html(response.data['old_risk']);
                    HLEPM.ui.showModal('#update-'+id_num);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker2");
                }
            });
        },
    newRiskFormRequest:
        function(selector){
            var url = selector.attr('url');
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#new').html(response.data['new_risk_form']);
                    HLEPM.ui.showModal('#new');
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker2");
                }
            });
        },
    newIssueFormRequest:
        function(selector){
            var url = selector.attr('url');
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#new').html(response.data['new_issue_form']);
                    HLEPM.ui.showModal('#new');
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker2");
                }
            });
        },
    updateIssueFormRequest:
        function(selector){
            var url=selector.attr('url');
            var id_num = selector.attr('id').split('-')[2]
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#update-'+id_num).html(response.data['old_issue']);
                    HLEPM.ui.showModal('#update-'+id_num);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker2");
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
                    HLEPM.bind.bindDisabledToggle();
                    HLEPM.bind.bindParentTypeChange();
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
                    HLEPM.bind.bindDisabledToggle();
                    HLEPM.bind.bindParentTypeChange();
                    $('.change-event').trigger('change');
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
                        var id = $(response.data.latest_updated).attr('id');
                        var update_html = $(response.data.latest_updated).html();
                        $('tbody.container #'+id).html(update_html);
                    } else {
                        $('#update-requirement .container').html(response.msg.invalid_form_html);
                        HLEPM.ui.autoComplete('.author');
                        HLEPM.ui.autoComplete('.parent');
                        HLEPM.bind.bindDatePicker();
                        HLEPM.bind.bindDisabledToggle();
                        HLEPM.bind.bindParentTypeChange();
                        $('#id_type').trigger('change');
                    }
                }
            });
        },
    requirementHistoryRequest:
        function(selector) {
            var url = $(selector).attr('url');
            HLEPM.ajax.get(url, '', function(ajax_response){
                if ( HLEPM.ajax.isSuccessful(ajax_response.rc) ){
                    $('#history').html(ajax_response.data.history_list);
                }
            });
        },
    dataTableRequest:
        function(extra_data) {
            var data = {
                filters: $('.current_filter').val(),
                orders: $('.current_order').val(),
                num_per_page: $('.num-per-page').val()
            };
            $.extend(data, extra_data);
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
