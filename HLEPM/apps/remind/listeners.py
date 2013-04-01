# -*- coding: utf-8 -*-

'''
Signals listeners for apps.
Using signal to trigger email.
'''

from django.db.models.signals import post_save
from django.dispatch import receiver

from HLEPM.apps.track.models.requirement import Requirement
from HLEPM.apps.track.models.risk import Risk
from HLEPM.apps.remind.sendmail import send

#This is an example for sending email when requirement owner have changed.
#Will be improved based on the  business logic in the future.
@receiver(post_save, sender=Requirement)
def sendEmailToRequirementOwner(sender, **kwargs):
    instance = kwargs['instance']
    purpose = instance.owner
    send(purpose=purpose, render_data={'data': 'requirement'})


#This is an example for sending email when add/update requirement risk.
#Will be improved based on the  business logic in the future.
@receiver(post_save, sender=Risk)
def sendEmailWhenUpdateRisk(sender, **kwargs):
    purpose = 'risk'
    send(purpose=purpose)