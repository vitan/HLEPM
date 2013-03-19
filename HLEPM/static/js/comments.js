function show_reply_form(event) {
    var $this = $(this);
    var form = $this.closest('.wrap_comments').siblings('#wrap_write_comment').children('#form-comment');
    var comment_id = $this.data('comment-id');

    form.find('#id_parent').val(comment_id);
    form.insertAfter($this.closest('.comment'));
};

function cancel_reply_form(event) {
    var form = $(this).closest('#form-comment');
    var form_wrap = $(this).closest('.wrap_comments').siblings('#wrap_write_comment');

    form.find('#id_comment').val('');
    form.find('#id_parent').val('');
    form.appendTo(form_wrap);
};

function show_comments(event) {
    var $this=$(this);
    $this.siblings('.comments').show();
    $this.siblings('.turn-off').show();
    $this.hide();
};

function hide_comments(event) {
    var $this=$(this);
    $this.siblings('.comments').hide();
    $this.siblings('.turn-on').show();
    $this.hide();
};

function ajaxSubmitComment(selector) {
    var url = $(selector).attr('action');
    var data = $(selector).serialize();

    //TODO (weizhou) How to solve that successful posted event lead to redirect page.
    ////So I can't get the response, and I can't get the posted failed info.
    HLEPM.ajax.post(url, data, function(response){
        ;
    });

    $('.cancel_reply').trigger('click');
};

function comments_initial() {
    $('.comment_reply_link').click(show_reply_form);
    $('.cancel_reply').click(cancel_reply_form);
    $('.turn-on').click(show_comments);
    $('.turn-off').click(hide_comments);
    $('.comment-form').submit(function() {
        ajaxSubmitComment($(this));
        return false;
    });
}
