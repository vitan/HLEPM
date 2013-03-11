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
                HLEPM.ui.hideModal("#update");
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
            HLEPM.ui.autoComplete('.reporter')
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
                var url = $('.filter_url').val();

                HLEPM.ajax.get(url, data, function(ajax_response){
                    if ( HLEPM.ajax.isSuccessful(ajax_response.rc) ){
                        $('tbody.contains').html(ajax_response.data.query_result);
                    }
                });
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
        }
};

$(document).ready(function() {
    HLEPM.init.main();
})
