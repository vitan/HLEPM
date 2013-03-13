HLEPM.init = {
    main:
        function() {
            if( HLEPM.ui.exists('.requirementHome') ) {
                this.requirementHome();
            }

            if( HLEPM.ui.exists('.projectHome')) {
                this.projectHome();
            }

            if (HLEPM.ui.exists('.riskHome')){
                this.riskHome();
            }
        },
    requirementHome:
        function() {
            HLEPM.bind.bindAddModal();
            HLEPM.bind.bindUpdateModal();
            HLEPM.bind.bindDatePicker();
            HLEPM.bind.bindRequirementFilter();
            HLEPM.bind.bindRequirementOrder();
            HLEPM.bind.bindParentListener();
            HLEPM.editRequest.addOneRequirement();
            HLEPM.editRequest.updateOneRequirement();
        },
    riskHome:
        function(){
            HLEPM.bind.bindAddModal();
            HLEPM.bind.bindDatePicker();
            HLEPM.bind.bindAutoComplete();
            HLEPM.bind.submitNewRisk();
            HLEPM.bind.updateRisk();
        },

};

HLEPM.bind = {
    bindAddModal:
        function() {
            $("#add").live('click', function() {
                HLEPM.ui.hideModal("#update");
                HLEPM.ui.showModal("#new");
                HLEPM.editRequest.requirementAddFormRequest($(this));
            });
            $(".close").live('click', function() {
                HLEPM.ui.hideModal("#new");
                HLEPM.ui.resetForm("#add-requirement");
            });
            $(".close2").live('click', function() {
                HLEPM.ui.hideModal("#new");
            });
        },
    bindUpdateModal:
        function () {
            $(".close").live('click', function() {
                HLEPM.ui.resetForm("#update-requirement");
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
    bindAutoComplete:
        function() {
            HLEPM.ui.autoComplete('.project-manager');
            HLEPM.ui.autoComplete('.reporter');
        },
    bindDatePicker:
        function() {
            HLEPM.ui.pickingDate(".datePicker");
        },
    bindRequirementFilter:
        function() {
            $('.filter').live('click', function() {
                HLEPM.ui.classifyActive($(this));

                var filter_field = $(this).attr('field');
                var field_value = $(this).attr('value');
                HLEPM.bind.updateFilter(filter_field, field_value);

                var data = {
                    filters: $('.current_filter').val()
                };
                HLEPM.editRequest.dataTableRequest(data);
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
                //HLEPM.ui.orderToggle($(this));
                var order = $(this).attr('field');
                order = (order.indexOf('-')==0 ? order.substring(1) : '-' + order);
                $(this).attr('field', order);
                var data = {
                    filters: $('.current_filter').val(),
                    orders: order
                };
                HLEPM.editRequest.dataTableRequest(data);
            });
        },
    bindParentListener:
        function() {
            $(".parent").focus(function() {
                var value = $('.parent-type option:selected').val();
                //TODO (weizhou) Here still have no good solution about type filter.
                //Once solved, you can uncomment the following 2 lines.

                //value = 'type#fpk=#' + value;
                //$(this).attr('extra_filter', value);
            });
        },
    submitNewRisk:
        function() {
            $('#submit-new-risk').live('click', function(){
                HLEPM.editRequest.addOneRisk();
            });
        },
    updateRisk:
        function() {
            $('.edit-risk').live('click', function(){
                HLEPM.editRequest.updateRiskFormRequest($(this));
            });
            $(".close2").live('click', function() {
                var id = $(this).attr('id');
                var id_num = id.split('-')[1];
                HLEPM.ui.hideModal("#update-"+id_num);
            });
            $('.update-one-risk').live('click', function(){
                var id = $(this).attr('id');
                var id_num = id.split('-')[2];
                HLEPM.editRequest.updateOneRisk(id_num);
            });
        },
};

$(document).ready(function() {
    HLEPM.init.main();
})
