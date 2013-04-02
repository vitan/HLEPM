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
                        HLEPM.ui.pickingDate(".datePicker");
                        HLEPM.bind.bindParentTypeChange();
                        HLEPM.bind.bindDisabledToggle();
                    }
                }
            });
        },
    addOneRisk:
        function(){
            var form = $("#add-risk-form");
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                     HLEPM.ui.showModal("#add-risk");
                     HLEPM.ui.hideModal("#new-risk");
                     HLEPM.ui.displayNewRisk(response.data['new_risk']);
                } else {
                    $('#risk-form-container').html(response.msg['error_new_risk']);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    addOneIssue:
        function(){
            var form = $("#add-issue-form");
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response){
               if ( HLEPM.ajax.isSuccessful(response.rc)){
                     HLEPM.ui.showModal("#add-issue");
                    HLEPM.ui.hideModal("#new-issue");
                    HLEPM.ui.displayNewIssue(response.data['new_issue']);
               } else {
                    $('#issue-form-container').html(response.msg['error_new_issue'])
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker");
               }
            });
        },
    newRiskFormRequest:
        function(selector){
            var url = selector.attr('url');
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#risk-form-container').html(response.data['new_form']);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    newIssueFormRequest:
        function(selector){
            var url = selector.attr('url');
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#issue-form-container').html(response.data['new_form']);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    updateOneRisk:
        function(selector){
            var form = $(selector).closest('form');
            var id_num = $(selector).closest('.risk-list-item').attr('id');
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                     HLEPM.ui.hideModal("#update-risk-"+id_num);
                     HLEPM.ui.displayUpdateRisk(selector, response.data['update_risk'])
                } else {
                    $('#update-risk-'+id_num).html(response.msg['error_risk']);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    updateOneIssue:
        function(selector){
            var form = $(selector).closest('form');
            var id_num = $(selector).closest('.issue-list-item').attr('id');
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                     HLEPM.ui.hideModal("#update-issue-"+id_num);
                     HLEPM.ui.displayUpdateIssue(selector, response.data['update_issue'])
                } else {
                    $('#update-issue-'+id_num).html(response.msg['error_issue']);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    updateRiskFormRequest:
        function(selector){
            var url = selector.attr('url');
            var id_num = $(selector).closest('.risk-list-item').attr('id');
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#update-risk-'+id_num).html(response.data['old_risk']);
                    HLEPM.ui.showModal('#update-risk-'+id_num);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    updateIssueFormRequest:
        function(selector){
            var url=selector.attr('url');
            var id_num = $(selector).closest('.issue-list-item').attr('id');
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#update-issue-'+id_num).html(response.data['old_issue']);
                    HLEPM.ui.showModal('#update-issue-'+id_num);
                    HLEPM.ui.autoComplete('.reporter2');
                    HLEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    requirementAddFormRequest:
        function(selector) {
            var url = $(selector).attr('url');
            HLEPM.ajax.get(url, '', function(response){
                if ( HLEPM.ajax.isSuccessful(response.rc)){
                    $('#add-requirement .container').html(response.data.add_form_html);
                    HLEPM.ui.autoComplete('.author');
                    HLEPM.ui.autoComplete('.parent');
                    HLEPM.ui.pickingDate(".datePicker");
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
                    HLEPM.ui.pickingDate(".datePicker");
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
                        HLEPM.ui.pickingDate(".datePicker");
                        HLEPM.bind.bindDisabledToggle();
                        HLEPM.bind.bindParentTypeChange();
                        $('#id_type').trigger('change');
                    }
                }
            });
        },
    detailRequest:
        function(selector, container) {
            var url = $(selector).attr('url');
            HLEPM.ajax.get(url, '', function(ajax_response){
                if ( HLEPM.ajax.isSuccessful(ajax_response.rc) ){
                    $(container).html(ajax_response.data.detail);
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
