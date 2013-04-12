HLEPM.init = {
    main:
        function() {
            if( HLEPM.ui.exists('.requirementHome') ) {
                this.requirementHome();
            }

            if( HLEPM.ui.exists('.requirementDetailHome')) {
                this.requirementDetailHome();
            }

            if( HLEPM.ui.exists('.projectHome')) {
                this.projectHome();
            }

        },
    requirementHome:
        function() {
            HLEPM.bind.bindRequirementAddModal();
            HLEPM.bind.bindRequirementUpdateModal();
            HLEPM.bind.bindRequirementFilter();
            HLEPM.bind.bindRequirementOrder();
            HLEPM.bind.bindNumPerPageSetting();
            HLEPM.bind.bindDisabledToggle();
            HLEPM.bind.bindParentTypeChange();
            HLEPM.editRequest.addOneRequirement();
            HLEPM.editRequest.updateOneRequirement();
            HLEPM.bind.initialTrigger();
        },
    requirementDetailHome:
        function() {
            HLEPM.bind.bindRiskAddModal();
            HLEPM.bind.bindIssueAddModal();
            HLEPM.bind.bindCommentButton();
            HLEPM.bind.bindDetailTabs();
            HLEPM.bind.updateRisk();
            HLEPM.bind.updateIssue();
            HLEPM.bind.bindRequirementOrder();
            HLEPM.bind.bindNumPerPageSetting();
            HLEPM.bind.bindRequirementRelated();
            HLEPM.bind.initialTrigger();
            comments_initial();
        },
};

HLEPM.bind = {
    bindRequirementAddModal:
        function() {
            $(".add-modal").live('click', function() {
                HLEPM.ui.hideModal(".update-modal");
                HLEPM.ui.showModal(".new-modal");
                HLEPM.editRequest.requirementAddFormRequest($(this));
            });
            $(".close").live('click', function() {
                HLEPM.ui.hideModal(".new-modal");
            });
            $(".close2").live('click', function() {
                HLEPM.ui.hideModal(".new-modal");
            });
        },
    bindRiskAddModal:
        function() {
            $("#add-risk").live('click', function() {
                HLEPM.ui.hideModal($(this));
                HLEPM.ui.showModal("#new-risk");
                HLEPM.editRequest.newRiskFormRequest($(this));
            });
            $("#close-risk-1").live('click', function() {
                HLEPM.ui.showModal("#add-risk");
                HLEPM.ui.hideModal("#new-risk");
            });
            $("#close-risk-2").live('click', function() {
                HLEPM.ui.showModal("#add-risk");
                HLEPM.ui.hideModal("#new-risk");
            });
            $('#submit-new-risk').live('click', function(){
                HLEPM.editRequest.addOneRisk();
            });
        },
    bindIssueAddModal:
        function() {
            $("#add-issue").live('click', function() {
                HLEPM.ui.hideModal($(this));
                HLEPM.ui.showModal("#new-issue");
                HLEPM.editRequest.newIssueFormRequest($(this));
            });
            $("#close-issue-1").live('click', function() {
                HLEPM.ui.showModal("#add-issue");
                HLEPM.ui.hideModal("#new-issue");
            });
            $("#close-issue-2").live('click', function() {
                HLEPM.ui.showModal("#add-issue");
                HLEPM.ui.hideModal("#new-issue");
            });
            $('#submit-new-issue').live('click', function(){
                HLEPM.editRequest.addOneIssue();
            });
        },
    bindRequirementUpdateModal:
        function () {
            $(".close").live('click', function() {
                HLEPM.ui.hideModal("#update");
            });
            $(".close2").live('click', function() {
                var id = $(this).attr('id');
                if ( id ){
                    var id_num = id.split('-')[1];
                    HLEPM.ui.hideModal("#update-"+id_num);
                } else{
                    HLEPM.ui.hideModal("#update");
                }
            });

            $(".requirement_number").live('click', function() {
                HLEPM.ui.hideModal("#new");
                HLEPM.ui.showModal("#update");
                HLEPM.editRequest.requirementUpdateFormRequest($(this));
            });
        },
    updateRisk:
        function() {
            $(".close").live('click', function() {
                HLEPM.ui.hideModal($(this).closest('.risk-li'));
            });
            $(".close2").live('click', function() {
                HLEPM.ui.hideModal($(this).closest('.risk-li'));
            });
            $('.edit-risk').live('click', function(){
                HLEPM.editRequest.updateRiskFormRequest($(this));
            });
            $('.update-one-risk').live('click', function(){
                HLEPM.editRequest.updateOneRisk($(this));
            });
        },
    updateIssue:
        function() {
            $(".close").live('click', function() {
                HLEPM.ui.hideModal($(this).closest('.issue-li'));
            });
            $(".close2").live('click', function() {
                HLEPM.ui.hideModal($(this).closest('.issue-li'));
            });
            $('.edit-issue').live('click', function(){
                HLEPM.editRequest.updateIssueFormRequest($(this));
            });
            $('.update-one-issue').live('click', function(){
                HLEPM.editRequest.updateOneIssue($(this));
            });
        },
    bindAutoComplete:
        function() {
            HLEPM.ui.autoComplete('.project-manager');
            HLEPM.ui.autoComplete('.reporter');
        },
    bindDetailTabs:
        function() {
            $('#riskRequest').live('click', function() {
                HLEPM.editRequest.detailRequest($(this), '#risk-container');
            });
            $('#issueRequest').live('click', function() {
                HLEPM.editRequest.detailRequest($(this), '#issue-container');
            });
            $('#historyRequest').live('click', function() {
                HLEPM.editRequest.detailRequest($(this), '#history');
            });
        },
    initialTrigger:
        function() {
            $('a.click-trigger').trigger('click');
        },
    bindRequirementFilter:
        function() {
            $('.filter').live('click', function() {
                HLEPM.ui.classifyActive($(this));

                var filter_field = $(this).attr('field');
                var field_value = $(this).attr('value');
                HLEPM.bind.updateFilter(filter_field, field_value);
                HLEPM.editRequest.dataTableRequest();
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
                HLEPM.editRequest.dataTableRequest();
            });
        },
    bindNumPerPageSetting:
        function() {
            $('.num-per-page').live('change', function() {
                HLEPM.editRequest.dataTableRequest();
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
                HLEPM.editRequest.dataTableRequest();
            });
        },
    bindCommentButton:
        function() {
            $('a.comments-btn').live('click', function() {
                HLEPM.ui.toggleModal($(this).siblings("#comments-all"));
            });
        },
    bindDisabledToggle:
        function() {
            $('.change-event').live('change', function() {
                if($(this).val() == 1) {
                    HLEPM.ui.disableElement('.disabled-toggle');
                    HLEPM.ui.hideModal('.product-label');
                }
                else {
                    HLEPM.ui.enbleElement('.disabled-toggle');
                    HLEPM.ui.showModal('.product-label');
                }
            });
        },
};

$(document).ready(function() {
    HLEPM.init.main();
})
