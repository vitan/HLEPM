LWEPM.init = {
    main:
        function() {
            if( LWEPM.ui.exists('.requirementHome') ) {
                this.requirementHome();
            }

            if( LWEPM.ui.exists('.requirementDetailHome')) {
                this.requirementDetailHome();
            }

            if( LWEPM.ui.exists('.projectHome')) {
                this.projectHome();
            }

        },
    requirementHome:
        function() {
            LWEPM.bind.bindRequirementAddModal();
            LWEPM.bind.bindRequirementUpdateModal();
            LWEPM.bind.bindRequirementFilter();
            LWEPM.bind.bindRequirementOrder();
            LWEPM.bind.bindNumPerPageSetting();
            LWEPM.bind.bindDisabledToggle();
            LWEPM.bind.bindParentTypeChange();
            LWEPM.editRequest.addOneRequirement();
            LWEPM.editRequest.updateOneRequirement();
            LWEPM.bind.initialTrigger();
        },
    requirementDetailHome:
        function() {
            LWEPM.bind.bindRiskAddModal();
            LWEPM.bind.bindIssueAddModal();
            LWEPM.bind.bindCommentButton();
            LWEPM.bind.bindDetailTabs();
            LWEPM.bind.updateRisk();
            LWEPM.bind.updateIssue();
            LWEPM.bind.bindRequirementOrder();
            LWEPM.bind.bindNumPerPageSetting();
            LWEPM.bind.bindRequirementRelated();
            LWEPM.bind.initialTrigger();
            comments_initial();
        },
};

LWEPM.bind = {
    bindRequirementAddModal:
        function() {
            $(".add-modal").live('click', function() {
                LWEPM.ui.hideModal(".update-modal");
                LWEPM.ui.showModal(".new-modal");
                LWEPM.editRequest.requirementAddFormRequest($(this));
            });
            $(".close").live('click', function() {
                LWEPM.ui.hideModal(".new-modal");
            });
            $(".close2").live('click', function() {
                LWEPM.ui.hideModal(".new-modal");
            });
        },
    bindRiskAddModal:
        function() {
            $("#add-risk").live('click', function() {
                LWEPM.ui.hideModal($(this));
                LWEPM.ui.showModal("#new-risk");
                LWEPM.editRequest.newRiskFormRequest($(this));
            });
            $("#close-risk-1").live('click', function() {
                LWEPM.ui.showModal("#add-risk");
                LWEPM.ui.hideModal("#new-risk");
            });
            $("#close-risk-2").live('click', function() {
                LWEPM.ui.showModal("#add-risk");
                LWEPM.ui.hideModal("#new-risk");
            });
            $('#submit-new-risk').live('click', function(){
                LWEPM.editRequest.addOneRisk();
            });
        },
    bindIssueAddModal:
        function() {
            $("#add-issue").live('click', function() {
                LWEPM.ui.hideModal($(this));
                LWEPM.ui.showModal("#new-issue");
                LWEPM.editRequest.newIssueFormRequest($(this));
            });
            $("#close-issue-1").live('click', function() {
                LWEPM.ui.showModal("#add-issue");
                LWEPM.ui.hideModal("#new-issue");
            });
            $("#close-issue-2").live('click', function() {
                LWEPM.ui.showModal("#add-issue");
                LWEPM.ui.hideModal("#new-issue");
            });
            $('#submit-new-issue').live('click', function(){
                LWEPM.editRequest.addOneIssue();
            });
        },
    bindRequirementUpdateModal:
        function () {
            $(".close").live('click', function() {
                LWEPM.ui.hideModal("#update");
            });
            $(".close2").live('click', function() {
                var id = $(this).attr('id');
                if ( id ){
                    var id_num = id.split('-')[1];
                    LWEPM.ui.hideModal("#update-"+id_num);
                } else{
                    LWEPM.ui.hideModal("#update");
                }
            });

            $(".requirement_number").live('click', function() {
                LWEPM.ui.hideModal("#new");
                LWEPM.ui.showModal("#update");
                LWEPM.editRequest.requirementUpdateFormRequest($(this));
            });
        },
    updateRisk:
        function() {
            $(".close").live('click', function() {
                LWEPM.ui.hideModal($(this).closest('.risk-li'));
            });
            $(".close2").live('click', function() {
                LWEPM.ui.hideModal($(this).closest('.risk-li'));
            });
            $('.edit-risk').live('click', function(){
                LWEPM.editRequest.updateRiskFormRequest($(this));
            });
            $('.update-one-risk').live('click', function(){
                LWEPM.editRequest.updateOneRisk($(this));
            });
        },
    updateIssue:
        function() {
            $(".close").live('click', function() {
                LWEPM.ui.hideModal($(this).closest('.issue-li'));
            });
            $(".close2").live('click', function() {
                LWEPM.ui.hideModal($(this).closest('.issue-li'));
            });
            $('.edit-issue').live('click', function(){
                LWEPM.editRequest.updateIssueFormRequest($(this));
            });
            $('.update-one-issue').live('click', function(){
                LWEPM.editRequest.updateOneIssue($(this));
            });
        },
    bindAutoComplete:
        function() {
            LWEPM.ui.autoComplete('.project-manager');
            LWEPM.ui.autoComplete('.reporter');
        },
    bindDetailTabs:
        function() {
            $('#riskRequest').live('click', function() {
                LWEPM.editRequest.detailRequest($(this), '#risk-container');
            });
            $('#issueRequest').live('click', function() {
                LWEPM.editRequest.detailRequest($(this), '#issue-container');
            });
            $('#historyRequest').live('click', function() {
                LWEPM.editRequest.detailRequest($(this), '#history');
            });
        },
    initialTrigger:
        function() {
            $('a.click-trigger').trigger('click');
        },
    bindRequirementFilter:
        function() {
            $('.filter').live('click', function() {
                LWEPM.ui.classifyActive($(this));

                var filter_field = $(this).attr('field');
                var field_value = $(this).attr('value');
                LWEPM.bind.updateFilter(filter_field, field_value);
                LWEPM.editRequest.dataTableRequest();
            });
        },
    updateFilter:
        function(filter_field, field_value) {
                var extra_filter = $('.current_filter').val();
                var regex = new RegExp(filter_field + "#=#" + "[0-9]+,{0,1}", 'g');
                extra_filter = extra_filter.replace(regex, "").replace(/,$/, "");

                var filter1 = (extra_filter ? extra_filter + "," : "");
                var filter2 = (field_value ? filter_field + "#=#" + field_value : "");
                var filter = filter1 + filter2;

                //update current filter
                $('.current_filter').val(filter);
        },
    bindRequirementOrder:
        function() {
            $('.order').live('click', function() {
                var order = $(this).attr('field');
                order = (order.indexOf('-')==0 ? order.substring(1) : '-' + order);
                $(this).attr('field', order);
                $('.current_order').val(order);
                LWEPM.editRequest.dataTableRequest();
            });
        },
    bindNumPerPageSetting:
        function() {
            $('.num-per-page').live('change', function() {
                LWEPM.editRequest.dataTableRequest();
            });
        },
    bindParentTypeChange:
        function() {
            $(".parent-type").live('change', function() {
                var value = $('.parent-type option:selected').val();
                $('.parent').attr('extra_filter', 'type__id#=#'+value);
            });
        },
    bindRequirementRelated:
        function() {
            $("#relatedDocumentRequest").live('click', function() {
                LWEPM.editRequest.dataTableRequest();
            });
        },
    bindCommentButton:
        function() {
            $('a.comments-btn').live('click', function() {
                LWEPM.ui.toggleModal($(this).siblings("#comments-all"));
            });
        },
    bindDisabledToggle:
        function() {
            $('.change-event').live('change', function() {
                if($(this).val() == 1) {
                    LWEPM.ui.disableElement('.disabled-toggle');
                    LWEPM.ui.hideModal('.product-label');
                }
                else {
                    LWEPM.ui.enbleElement('.disabled-toggle');
                    LWEPM.ui.showModal('.product-label');
                }
            });
        },
};

$(document).ready(function() {
    LWEPM.init.main();
})
