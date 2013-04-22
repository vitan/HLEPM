#!/usr/bin/env python

from django.db import models
from django.utils.text import truncate_words
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes import generic
from django.db.models.signals import post_save
from django.contrib.auth.models import User

from lwepm.apps.common.models import DictBase
from lwepm.apps.track.models import Impact

from lwepm.apps.remind.listeners import send_email_post_save


__all__ = (
    'Issue',
    'IssueStatus',
    'Priority',
    'Mitigation',
)


class IssueStatus(DictBase):
    """Save the status of project."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Priority(DictBase):

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Mitigation(DictBase):

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Issue(models.Model):
    """Save the issue of Reuqirement&Project."""

    content_type = models.ForeignKey(ContentType)
    object_id = models.PositiveIntegerField()
    content_object = generic.GenericForeignKey('content_type', 'object_id')
    reporter = models.ForeignKey(User)
    impact = models.ForeignKey(Impact)
    mitigation = models.ForeignKey(Mitigation)
    priority = models.ForeignKey(Priority)
    status = models.ForeignKey(IssueStatus)
    start_date = models.DateTimeField(null=True, blank=True)
    target_date = models.DateTimeField(null=True, blank=True)
    description = models.CharField(max_length=1024)

    def __str__(self):
        return u'%s' % truncate_words(self.reporter.username, 15)
    __unicode__ = __str__

    def get_form_initial(self):
        return {
            'reporter': self.reporter,
            'impact': self.impact,
            'mitigation': self.mitigation,
            'priority': self.priority,
            'status': self.status,
            'target_date': self.target_date,
            'start_date': self.start_date,
            'description': self.description,
            }

    class Meta:
        app_label = "track"
post_save.connect(send_email_post_save, sender=Issue)
