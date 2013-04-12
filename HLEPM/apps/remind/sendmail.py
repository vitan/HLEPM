# -*- coding: utf-8 -*-

from django.shortcuts import get_object_or_404
from django.core.mail import EmailMessage
from django.template import Context, Template
from django.contrib.auth.models import User

from HLEPM.apps.utils.decorators import async
from HLEPM.apps.remind.models import EmailTemplate

__all__ = (
    'send_email',
)

@async
def send_email(content_type, updated_obj):
    """Sending email to remind related users."""

    obj = get_object_or_404(EmailTemplate,
                            content_type=content_type,
                           is_enable=True)
    cc = list(obj.cc_users.all().values_list('email', flat=True))
    cc_from_groups = User.objects.filter(groups__in=obj.cc_groups.all())
    cc.extend(list(cc_from_groups.values_list('email', flat=True)))

    template = Template(obj.body)
    body = template.render(Context({'report': updated_obj }))

    kwargs = {
        'subject': obj.subject,
        'from_email': obj.from_email,
        'to': list(obj.to.all().values_list('email', flat=True)),
        'cc': cc,
        'body': body,
    }

    mail = EmailMessage(**kwargs)
    mail.content_subtype = "html"

    if obj.is_with_attachment:
        for attachment in updated_obj.attachment.all():
            if not attachment.is_removed:
                mail.attach_file(attachment.attachment_file.path)

    mail.send(fail_silently=False)
