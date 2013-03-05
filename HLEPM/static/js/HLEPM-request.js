HLEPM.editRequest = {
    addOneRequirement:
        function() {
            //TODO (weizhou) need to add form verify
            var form = $("#add-requirement");
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response) {
                if ( HLEPM.ajax.isSuccessful(response.rc) ) {
                    HLEPM.ui.hideModal("#new");
                } else {
                    ;
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
                 } else {
                     ;
                 }
            });
        },
    updateOneRequirement:
        function() {
            //TODO (weizhou) need to add form verify
            var form = $("#update-requirement");
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response) {
                if ( HLEPM.ajax.isSuccessful(response.rc) ) {
                    HLEPM.ui.hideModal("#update");
                } else {
                    ;
                }
            });
        }
}
