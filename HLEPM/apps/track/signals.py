# -*- coding: utf-8 -*-

import django.dispatch

__all__ = (
    'requirement_history_save_trigger'
)

providing_args = ['module', 'editor', 'before_owner']

requirement_history_save_trigger = django.dispatch.Signal(providing_args=providing_args)
