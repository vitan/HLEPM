HLEPM.ui = {
    exists:
        function(selector) {
            return ($(selector).length > 0);
        },
    showModal:
        function(selector) {
            $(selector).show();
        },
    hideModal:
        function(selector) {
            $(selector).hide();
        },
    pickingDate:
        function(selector) {
            $(selector).datepicker();
        }
}
