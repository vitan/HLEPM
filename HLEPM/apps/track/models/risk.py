#!/usr/bin/env python

from django.db import models
from django.utils.text import truncate_words
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes import generic
from django.db.models.signals import post_save
from django.contrib.auth.models import User

from HLEPM.apps.common.models import DictBase
from HLEPM.apps.track.models import Impact

from HLEPM.apps.remind.listeners import send_email_post_save


__all__ = (
    'Probability',
    'Response',
    'Risk',
    'RiskStatus',
)

class Response(DictBase):

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Probability(DictBase):

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class RiskStatus(DictBase):
    """Save the status of risk."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Risk(models.Model):
    """Save the risk of Requirement&Project."""

    content_type = models.ForeignKey(ContentType)
    object_id = models.PositiveIntegerField()
    content_object = generic.GenericForeignKey('content_type', 'object_id')
    reporter = models.ForeignKey(User)
    impact = models.ForeignKey(Impact)
    probability = models.ForeignKey(Probability)
    response = models.ForeignKey(Response)
    status = models.ForeignKey(RiskStatus)
    start_date = models.DateTimeField(null=True, blank=True)
    target_date = models.DateTimeField(null=True, blank=True)
    description = models.CharField(max_length=1024)

    def get_form_initial(self):
        return {
            'reporter': self.reporter,
            'impact': self.impact,
            'probability': self.probability,
            'response': self.response,
            'status': self.status,
            'target_date': self.target_date,
            'start_date': self.start_date,
            'description': self.description,
            }

    def __str__(self):
        return u'%s' % truncate_words(self.reporter.username, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"
post_save.connect(send_email_post_save, sender=Risk)
