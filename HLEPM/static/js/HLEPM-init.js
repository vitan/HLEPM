HLEPM.init = {
    main:
        function() {
            if( HLEPM.ui.exists('.requirementHome') ) {
                this.requirementHome();
            }
        },
    requirementHome:
        function() {
            HLEPM.bind.bindAddModal();
            HLEPM.bind.bindAutoComplete();
            HLEPM.bind.bindDatePicker();
            HLEPM.bind.bindParentListener();
            HLEPM.bind.submitNewRequirement();
        },

};

HLEPM.bind = {
    bindAddModal:
        function() {
            $("#add").live('click', function() {
                HLEPM.ui.showModal("#new");
            });
            $(".close").live('click', function() {
                HLEPM.ui.hideModal("#new");
            });
            $(".close2").live('click', function() {
                HLEPM.ui.hideModal("#new");
            });
        },
    bindAutoComplete:
        function() {
            HLEPM.ui.autoComplete('.author');
            HLEPM.ui.autoComplete('.parent');
        },
    bindDatePicker:
        function() {
            HLEPM.ui.pickingDate(".datePicker");
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
    submitNewRequirement:
        function() {
            $('#submit-new-requirement').live('click', function() {
                HLEPM.editRequest.addOneRequirement();
            });
        }
};

$(document).ready(function() {
    HLEPM.init.main();
})
