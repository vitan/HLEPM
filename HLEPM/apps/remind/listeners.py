# -*- coding: utf-8 -*-

'''
Signals listeners for current app.
Using signal to trigger email.
'''

from django.contrib.contenttypes.models import ContentType

from HLEPM.apps.remind.sendmail import send_email

def sendEmailWhenObjectSave(sender, **kwargs):
    send_email(content_type = ContentType.objects.get_for_model(sender),
               updated_obj =  kwargs['instance'])
