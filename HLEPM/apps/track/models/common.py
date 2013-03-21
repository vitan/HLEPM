#!/usr/bin/env python

from django.db import models
from django.utils.text import truncate_words

from HLEPM.apps.common.models import DictBase

__all__ = (
    'Impact',
    'Product',
    'Version',
)


class Product(models.Model):

    name = models.CharField(max_length=150)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Version(DictBase):
    """Save the version."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Impact(DictBase):

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


