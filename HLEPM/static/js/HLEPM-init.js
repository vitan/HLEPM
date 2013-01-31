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
            HLEPM.bind.bindDatePicker();
            HLEPM.bind.submitNewRequirement();
        },

};

HLEPM.bind = {
    bindAddModal:
        function() {
            $("#add").live('click', function() {
                HLEPM.ui.showModal("#new");
            });
            $("#save").live('click', function() {
                HLEPM.ui.hideModal("#new");
            });
            $(".close").live('click', function() {
                HLEPM.ui.hideModal("#new");
            });
            $(".close2").live('click', function() {
                HLEPM.ui.hideModal("#new");
            });
        },
    bindDatePicker:
        function() {
            HLEPM.ui.pickingDate(".datePicker");
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
