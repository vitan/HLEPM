# -*- coding: utf-8 -*-

from django.db import models
from django.template import Context
from django.template import Template

from HLEPM.apps.utils.constants import MSG

__all__ = ('EmailPurpose', 'EmailTemplates',)

class NoEmailTemplateUsable(Exception):
    pass

class EmailPurpose(models.Model):
    purpose = models.CharField(max_length=100, help_text=MSG.remind.purpose_helptext)

    def __unicode__(self):
        return self.purpose

    class Meta:
        db_table = 'HLEPM_email_purpose'

class EmailTemplates(models.Model):

    subject = models.CharField(max_length=100, help_text=MSG.remind.subject_helptext)
    mail_to = models.CharField(max_length=100, help_text=MSG.remind.mail_to_helptext)
    message = models.TextField(help_text=MSG.remind.message_helptext)
    purpose = models.ForeignKey(EmailPurpose)
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    enabled = models.BooleanField(default=False,help_text=MSG.remind.enabled_helptext)
    template = None

    def __unicode__(self):
        return self.subject

    class Meta:
        db_table = 'HLEPM_email_config'

    def render(self, data):
        ''' Render template with data to real string content

        - data: an instance of dict, which contains all necessary data
                to render template
        '''

        context = Context(data)
        return self.template.render(context)

    @classmethod
    def get_template(cls, purpose):
        """get latest email template

        - purpose: the purpose of the template which define in the EmailPurpose model
        """

        purpose = EmailPurpose.objects.get(purpose=purpose)
        latest_enabled_templs = cls.objects.filter(purpose=purpose).order_by('-updated_on')
        templates = [templ for templ in latest_enabled_templs]
        if not templates:
            raise NoEmailTemplateUsable()
        template = templates[0]
        template.template = Template(template.message)
        return template
