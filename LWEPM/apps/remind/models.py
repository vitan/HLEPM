# -*- coding: utf-8 -*-

from django.contrib.contenttypes.models import ContentType
from django.db import models
from django.conf import settings
from django.contrib.auth.models import User, Group

from LWEPM.apps.utils.constants import MSG

__all__ = (
    'EmailTemplate',
)

class EmailTemplate(models.Model):
    """ Save the message template."""

    content_type = models.ForeignKey(ContentType)
    subject = models.CharField(max_length=100,
                               default=MSG.remind.email_subject_prefix,
                               help_text=MSG.remind.email_subject_helptext)
    body = models.TextField(default = MSG.remind.email_body_example,
                               help_text=MSG.remind.email_body_helptext)
    from_email = models.CharField(max_length=100,
                                 default = settings.DEFAULT_FROM_EMAIL,
                                 null=True,
                                 blank=True)
    to = models.ManyToManyField(User,
                               related_name="mail_to")
    cc_users = models.ManyToManyField(User,
                                      null=True,
                                      blank=True,
                                     related_name="mail_cc_users")
    cc_groups = models.ManyToManyField(Group,
                                       null=True,
                                       blank=True,
                                     related_name="mail_cc_groups")
    is_with_attachment = models.BooleanField(default=False,
                                    help_text=MSG.remind.email_is_with_attachment_helptext)
    is_enable = models.BooleanField(default=True,
                                    help_text=MSG.remind.email_is_enable_helptext)
    update = models.DateTimeField(auto_now=True, auto_now_add=True)

    def __str__(self):
        return u'%s' % self.subject
    __unicode__ = __str__

    class Meta:
        ordering = ['-update']
