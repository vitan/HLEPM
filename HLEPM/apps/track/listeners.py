# -*- coding: utf-8 -*-

'''
Signals listeners for current app.
'''

from django.dispatch import receiver

from HLEPM.apps.track.models import RequirementHistory
from HLEPM.apps.track.signals import requirement_history_save_trigger

@receiver(requirement_history_save_trigger)
def requirement_history_save(sender, **kwargs):
    obj = RequirementHistory(**{
        'editor': kwargs['editor'],
        'requirement': sender,
        'before_owner': kwargs['before_owner'],
        'after_owner': sender.owner,
    })
    obj.save()
