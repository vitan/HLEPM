HLEPM.editRequest = {
    addOneRequirement:
        function() {
            //Pseudo ajax post for file uploading
            $('#add-requirement').iframePostForm({
                json: true,
                complete: function(response) {
                    if ( HLEPM.ajax.isSuccessful(response.rc) ) {
                        HLEPM.ui.hideModal("#new");
                    } else {
                        ;
                    }
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
            //Pseudo ajax post for file uploading
            $('#update-requirement').iframePostForm({
                json: true,
                complete: function(response) {
                    if ( HLEPM.ajax.isSuccessful(response.rc) ) {
                        HLEPM.ui.hideModal("#update");
                    } else {
                        ;
                    }
                }
            });
        }
}
