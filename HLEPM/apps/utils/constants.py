# -*- coding: utf-8 -*-


class MSG:

    class remind:
        email_subject_prefix = '[HLEPM] '
        email_subject_helptext = u'This is email subject.'
        email_body_helptext = u'This is email body.'
        email_is_with_attachment_helptext = u'Check me if you would like to  \
                send email with related attachments.'
        email_is_enable_helptext = u'Check me to make this template dis-/enable.'
        email_body_example = u"""
        <strong>{{ report }} updated</strong>
        <br>
        <a href="">{{ report }}</a>'s owner has updated to {{ report.owner }}
        <br>
        """
