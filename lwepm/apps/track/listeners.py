# -*- coding: utf-8 -*-

'''
Signals listeners for current app.
'''

from django.dispatch import receiver

from lwepm.apps.track.signals import requirement_history_save_trigger

__all__ =(
    'requirement_history_save',
)

@receiver(requirement_history_save_trigger)
def requirement_history_save(sender, **kwargs):
    module = kwargs.pop('module')
    kwargs.pop('signal')
    kwargs.update({
        'requirement': sender,
        'after_owner': sender.owner,
    })
    obj = module(**kwargs)
    obj.save()
