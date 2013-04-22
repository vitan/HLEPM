LWEPM.editRequest = {
    addOneRequirement:
        function() {
            //Pseudo ajax post for file uploading
            $('#add-requirement').iframePostForm({
                json: true,
                complete: function(response) {
                    if ( LWEPM.ajax.isSuccessful(response.rc) ) {
                        LWEPM.ui.hideModal("#new");
                        $('tbody.container').prepend(response.data.latest_added);
                    } else {
                        if ( response.msg.DBerror ) {
                            alert(response.msg.DBerror);
                            return;
                        }
                        $('#add-requirement .container').html(response.msg.invalid_form_html);
                        LWEPM.ui.autoComplete('.author');
                        LWEPM.ui.autoComplete('.parent');
                        LWEPM.ui.pickingDate(".datePicker");
                    }
                }
            });
        },
    addOneRisk:
        function(){
            var form = $("#add-risk-form");
            var url = form.attr('action');
            var data = form.serialize();
            LWEPM.ajax.post(url, data, function(response){
                if ( LWEPM.ajax.isSuccessful(response.rc)){
                     LWEPM.ui.showModal("#add-risk");
                     LWEPM.ui.hideModal("#new-risk");
                     LWEPM.ui.displayNewRisk(response.data['new_risk']);
                } else {
                    if ( response.msg.DBerror ) {
                        alert(response.msg.DBerror);
                        return;
                    }
                    $('#risk-form-container').html(response.msg['error_new_risk']);
                    LWEPM.ui.autoComplete('.reporter2');
                    LWEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    addOneIssue:
        function(){
            var form = $("#add-issue-form");
            var url = form.attr('action');
            var data = form.serialize();
            LWEPM.ajax.post(url, data, function(response){
               if ( LWEPM.ajax.isSuccessful(response.rc)){
                     LWEPM.ui.showModal("#add-issue");
                    LWEPM.ui.hideModal("#new-issue");
                    LWEPM.ui.displayNewIssue(response.data['new_issue']);
               } else {
                    if ( response.msg.DBerror ) {
                        alert(response.msg.DBerror);
                        return;
                    }
                    $('#issue-form-container').html(response.msg['error_new_issue'])
                    LWEPM.ui.autoComplete('.reporter2');
                    LWEPM.ui.pickingDate(".datePicker");
               }
            });
        },
    newRiskFormRequest:
        function(selector){
            var url = selector.attr('url');
            LWEPM.ajax.get(url, '', function(response){
                if ( LWEPM.ajax.isSuccessful(response.rc)){
                    $('#risk-form-container').html(response.data['new_form']);
                    LWEPM.ui.autoComplete('.reporter2');
                    LWEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    newIssueFormRequest:
        function(selector){
            var url = selector.attr('url');
            LWEPM.ajax.get(url, '', function(response){
                if ( LWEPM.ajax.isSuccessful(response.rc)){
                    $('#issue-form-container').html(response.data['new_form']);
                    LWEPM.ui.autoComplete('.reporter2');
                    LWEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    updateOneRisk:
        function(selector){
            var form = $(selector).closest('form');
            var id_num = $(selector).closest('.risk-list-item').attr('id');
            var url = form.attr('action');
            var data = form.serialize();
            LWEPM.ajax.post(url, data, function(response){
                if ( LWEPM.ajax.isSuccessful(response.rc)){
                     LWEPM.ui.hideModal("#update-risk-"+id_num);
                     LWEPM.ui.displayUpdateRisk(selector, response.data['update_risk'])
                } else {
                    if ( response.msg.DBerror ) {
                        alert(response.msg.DBerror);
                        return;
                    }
                    $('#update-risk-'+id_num).html(response.msg['error_risk']);
                    LWEPM.ui.autoComplete('.reporter2');
                    LWEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    updateOneIssue:
        function(selector){
            var form = $(selector).closest('form');
            var id_num = $(selector).closest('.issue-list-item').attr('id');
            var url = form.attr('action');
            var data = form.serialize();
            LWEPM.ajax.post(url, data, function(response){
                if ( LWEPM.ajax.isSuccessful(response.rc)){
                     LWEPM.ui.hideModal("#update-issue-"+id_num);
                     LWEPM.ui.displayUpdateIssue(selector, response.data['update_issue'])
                } else {
                    if ( response.msg.DBerror ) {
                        alert(response.msg.DBerror);
                        return;
                    }
                    $('#update-issue-'+id_num).html(response.msg['error_issue']);
                    LWEPM.ui.autoComplete('.reporter2');
                    LWEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    updateRiskFormRequest:
        function(selector){
            var url = selector.attr('url');
            var id_num = $(selector).closest('.risk-list-item').attr('id');
            LWEPM.ajax.get(url, '', function(response){
                if ( LWEPM.ajax.isSuccessful(response.rc)){
                    $('#update-risk-'+id_num).html(response.data['old_risk']);
                    LWEPM.ui.showModal('#update-risk-'+id_num);
                    LWEPM.ui.autoComplete('.reporter2');
                    LWEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    updateIssueFormRequest:
        function(selector){
            var url=selector.attr('url');
            var id_num = $(selector).closest('.issue-list-item').attr('id');
            LWEPM.ajax.get(url, '', function(response){
                if ( LWEPM.ajax.isSuccessful(response.rc)){
                    $('#update-issue-'+id_num).html(response.data['old_issue']);
                    LWEPM.ui.showModal('#update-issue-'+id_num);
                    LWEPM.ui.autoComplete('.reporter2');
                    LWEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    requirementAddFormRequest:
        function(selector) {
            var url = $(selector).attr('url');
            LWEPM.ajax.get(url, '', function(response){
                if ( LWEPM.ajax.isSuccessful(response.rc)){
                    $('#add-requirement .container').html(response.data.add_form_html);
                    LWEPM.ui.autoComplete('.author');
                    LWEPM.ui.autoComplete('.parent');
                    LWEPM.ui.pickingDate(".datePicker");
                }
            });
        },
    requirementUpdateFormRequest:
        function(selector) {
            var url = $(selector).attr('url');
            LWEPM.ajax.get(url, '', function(response){
                if ( LWEPM.ajax.isSuccessful(response.rc)){
                    $('#update-requirement').attr('action', url);
                    $('#update-requirement .container').html(response.data.update_form_html);
                    LWEPM.ui.autoComplete('.author');
                    LWEPM.ui.autoComplete('.parent');
                    LWEPM.ui.pickingDate(".datePicker");
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
                    if ( LWEPM.ajax.isSuccessful(response.rc) ) {
                        LWEPM.ui.hideModal("#update");
                        var id = $(response.data.latest_updated).attr('id');
                        var update_html = $(response.data.latest_updated).html();
                        $('tbody.container #'+id).html(update_html);
                    } else {
                        if ( response.msg.DBerror ) {
                            alert(response.msg.DBerror);
                            return;
                        }
                        $('#update-requirement .container').html(response.msg.invalid_form_html);
                        LWEPM.ui.autoComplete('.author');
                        LWEPM.ui.autoComplete('.parent');
                        LWEPM.ui.pickingDate(".datePicker");
                        $('#id_type').trigger('change');
                    }
                }
            });
        },
    detailRequest:
        function(selector, container) {
            var url = $(selector).attr('url');
            LWEPM.ajax.get(url, '', function(ajax_response){
                if ( LWEPM.ajax.isSuccessful(ajax_response.rc) ){
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
            LWEPM.ajax.get(url, data, function(ajax_response){
                if ( LWEPM.ajax.isSuccessful(ajax_response.rc) ){
                    $('tbody.container').html(ajax_response.data.query_result);
                    LWEPM.editRequest.paginatorEvent();
                }
            });
        },
    paginatorEvent:
        function() {
            $("div.pagination a").live('click', function(event) {
                event.preventDefault();
                var url = $(this).attr('href');
                LWEPM.ajax.get(url, "", function(ajax_response){
                    if ( LWEPM.ajax.isSuccessful(ajax_response.rc) ){
                        $('tbody.container').html(ajax_response.data.query_result);
                    }
                });
            });
        }
}
