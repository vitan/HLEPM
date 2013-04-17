#!/usr/bin/env python

from django.db import models
from django.utils.text import truncate_words
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes import generic
from django.db.models.signals import post_save
from django.contrib.auth.models import User

from LWEPM.apps.attachments.models import Attachment
from LWEPM.apps.common.models import DictBase
from LWEPM.apps.track.models import Risk, Issue, Product, Version

from LWEPM.apps.remind.listeners import send_email_post_save
from LWEPM.apps.track.signals import *


__all__ = (
    'Requirement',
    'RequirementOwner',
    'RequirementType',
    'RequirementHistory',
    'RequirementStatus',
)


class RequirementType(DictBase):
    """ Save the type of Requirement."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class RequirementStatus(DictBase):
    """ Save the status of Requirement."""

    type = models.ForeignKey(RequirementType)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class RequirementOwner(DictBase):
    """ Save the Owner of Requirement."""

    type = models.ForeignKey(RequirementType)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Requirement(models.Model):
    """ An model for requirements record save."""

    author = models.ForeignKey(User)
    name = models.CharField(max_length=64,
                            null=True,
                            blank=True,
                           unique=True)
    start_date = models.DateTimeField(null=True,
                                     blank=True)
    target_date = models.DateTimeField(null=True,
                                      blank=True)
    type = models.ForeignKey(RequirementType)
    status = models.ForeignKey(RequirementStatus)
    owner = models.ForeignKey(RequirementOwner)
    requirement = models.ManyToManyField('Requirement',
                                         null=True,
                                         blank=True,
                                        related_name='requirement_requirement')
    product = models.ForeignKey(Product, null=True, blank=True)
    version = models.ForeignKey(Version, null=True, blank=True)
    update = models.DateTimeField(auto_now=True, auto_now_add=True)
    attachment = generic.GenericRelation(Attachment)
    risk = generic.GenericRelation('Risk')
    issue = generic.GenericRelation('Issue')

    @property
    def open_status_risk(self):
        return self.risk.filter(status__order=1)

    @property
    def open_status_issue(self):
        return self.issue.filter(status__order=1)

    @property
    def high_probability_risk(self):
        return self.risk.filter(probability__order=1)

    @property
    def high_impact_issue(self):
        return self.issue.filter(impact__order=1)

    def __str__(self):
        return u'%s - %s' % (self.type.name, self.pk)
    __unicode__ = __str__

    def save(self, *args, **kwargs):
        """Override for saving attachment file"""
        creator = kwargs.pop('creator')
        file = kwargs.pop('file', None)
        if file:
            file = file['attachment_file']
            self.name = file.name
            super(Requirement, self).save(*args, **kwargs)
            data = {
                'content_type': ContentType.objects.get_for_model(self),
                'object_id': self.pk,
                'creator': creator,
                'attachment_file': file
            }
            attachment_obj = Attachment(**data)
            attachment_obj.save()
        else:
            super(Requirement, self).save(*args, **kwargs)

    def post_save(self, editor, before=None):

        if before is None:
            before = RequirementOwner.objects.get(order=1)
        kwargs = {
            'module': RequirementHistory,
            'editor': User.objects.get(username=editor),
            'before_owner': before,
        }
        requirement_history_save_trigger.send(sender=self, **kwargs)

        requirement_post_save_trigger.send(sender=Requirement,
                                           **{'instance': self})

    def get_form_initial(self):
        result = {
            'type': self.type,
            'product': self.product,
            'version': self.version,
            'status': self.status,
            'author': self.author,
            'owner': self.owner,
            'start_date': self.start_date,
            'target_date': self.target_date,
        }
        parent = self.requirement.all()
        if parent.exists():
            parent_list = parent.values_list('name', flat=True)
            parent_type = parent[0].type
            result.update({
                'parent_type': parent_type,
                'parent': ','.join(parent_list),
            })
        return result

    class Meta:
        app_label = "track"
requirement_post_save_trigger.connect(send_email_post_save, sender=Requirement)


class RequirementHistory(models.Model):
    """Save the history of Reqirement."""

    editor = models.ForeignKey(User)
    requirement = models.ForeignKey(Requirement)
    before_owner = models.ForeignKey(RequirementOwner,
                                     related_name="before_owner")
    after_owner = models.ForeignKey(RequirementOwner,
                                   related_name="after_owner")
    add_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return u'%s from %s to %s' % (self.requirement, self.before_owner, self.after_owner)
    __unicode__ = __str__

    class Meta:
        app_label = "track"
        ordering = ['-add_date']
