# -*- coding: utf-8 -*-

import threading

from django.conf import settings


__all__ = ['async']


class async(object):
    '''
    Decorator that turns a callable
    into a thread.
    '''

    def __init__(self, func):
        self.func = func

    def __call__(self, *args, **kwargs):
        return self.run(*args, **kwargs)

    def run(self, *args, **kwargs):
        thread = threading.Thread(
            target = self.func,
            args = args,
            kwargs = kwargs,
        )
        thread.start()
        return True


# During development, disable async
if not settings.ALIVE_ON_PRODUCTION:
    class _async(async):
        def __call__(self, *args, **kwargs):
            return self.func(*args, **kwargs)
    async = _async
