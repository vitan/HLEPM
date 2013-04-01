# -*- coding: utf-8 -*-

from django.conf import settings
from django.core.mail import EmailMessage

from HLEPM.apps.utils.decorators import async
from HLEPM.apps.remind.models import EmailPurpose
from HLEPM.apps.remind.models import EmailTemplates


def make_email_subject(subject):
    ''' Using subject to make HLEPM email service specific subject '''
    return '%s- %s' % (settings.EMAIL_SUBJECT_PREFIX, subject)

@async
def mailto(subject, content, to_mail, cc=None, from_mail=None):
    '''Sending email

    - subject: The subject line of the e-mail
    - content: string, the content to send
    - to_mail: A list or tuple of recipient addresses
    - cc: A list or tuple of recipient addresses used in the "Cc" header when
          sending the e-mail
    - from_mail: The sender's address, noreply@redhat.com is used by default
    '''

    mail_subject = make_email_subject(subject)
    mail_from = from_mail or settings.EMAIL_FROM
    mail_to = to_mail if isinstance(to_mail, list) else list(to_mail)
    if cc is None:
        cc_list = []
    else:
        cc_list = cc if isinstance(cc, list) else list(cc)
    # We use email addresses configured in settings during development and test
    # When deployed in production, DEBUG should be False, then all email will
    # be sent to specified recipients properly.
    if not settings.ALIVE_ON_PRODUCTION:
        mail_to = getattr(settings, 'TEST_EMAIL_TO', ['docai@redhat.com'])
        cc_list = getattr(settings, 'TEST_EMAIL_CC', None)

    mail = EmailMessage(mail_subject, content, mail_from, mail_to, cc=cc_list)
    mail.content_subtype = "html"
    mail.send(fail_silently=False)

def send(subject=None, mail_to=[], mail_cc=[], purpose=None, render_data={}):

    templ = EmailTemplates.get_template(purpose)
    mail_body = templ.render(render_data)
    mailto(subject=subject, content=mail_body, to_mail=mail_to, cc=mail_cc)