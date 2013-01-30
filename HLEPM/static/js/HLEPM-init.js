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
            HLEPM.ui.pickingDate("#id_start_date");
            HLEPM.ui.pickingDate("#id_target_date");
        }
};

$(document).ready(function() {
    HLEPM.init.main();
})
