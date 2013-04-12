# -*- coding: utf-8 -*-

import django.dispatch

__all__ = (
    'requirement_post_save_trigger',
    'requirement_history_save_trigger',
)

providing_args_for_post_save = ['instance']
providing_args_for_history_save = ['module', 'editor', 'before_owner']

requirement_post_save_trigger = django.dispatch.Signal(
    providing_args=providing_args_for_post_save)
requirement_history_save_trigger = django.dispatch.Signal(
    providing_args=providing_args_for_history_save)
