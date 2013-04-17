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

    LWEPM.ajax.post(url, data, function(response){
        if ( LWEPM.ajax.isSuccessful(response.rc) ) {
            var li = $(selector).closest('li.comment_li');
            var section = $(selector).closest('section#comments-all');
            if(li.length) {
                //Insert nth-depth comment.
                li.append(response.data.latest_added);
            }
            else {
                //Insert one root_level comment.
                var root_comment = section.find('.comments');
                root_comment.append(response.data.latest_added);
            }
            //comments count + 1.
            var count = parseInt(section.find('span.comments_count').text());
            section.find('span.comments_count').text(count+1);
            $('.cancel_reply').trigger('click');
        }
    });
};

function comments_initial() {
    $('.comment_reply_link').live('click', show_reply_form);
    $('.cancel_reply').live('click', cancel_reply_form);
    $('.turn-on').live('click', show_comments);
    $('.turn-off').live('click', hide_comments);
    $('.comment-form').live('submit', function() {
        ajaxSubmitComment($(this));
        return false;
    });
}
