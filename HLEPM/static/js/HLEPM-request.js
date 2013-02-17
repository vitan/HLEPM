HLEPM.editRequest = {
    addOneRequirement:
        function() {
            //TODO (weizhou) need to add form verify
            var form = $("#form-add-one-requirement");
            var url = form.attr('action');
            var data = form.serialize();
            HLEPM.ajax.post(url, data, function(response) {
                if ( HLEPM.ajax.isSuccessful(response.rc) ) {
                    ;
                } else {
                    ;
                }
            });
        }
}
