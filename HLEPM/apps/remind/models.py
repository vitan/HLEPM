from django.db import models
from HLEPM.apps.utils.constants import MSG


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

    def __unicode__(self):
        return self.subject

    class Meta:
        db_table = 'HLEPM_email_config'
