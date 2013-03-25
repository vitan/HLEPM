#!/usr/bin/env python

from django.db import models
from django.utils.text import truncate_words
from django.contrib.contenttypes import generic
from django.contrib.auth.models import User

from HLEPM.apps.attachments.models import Attachment
from HLEPM.apps.common.models import DictBase
from HLEPM.apps.track.models import Risk, Issue, Product, Version


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
    def high_probability_risk(self):
        return self.risk.filter(probability__order=1)

    @property
    def high_impact_issue(self):
        return self.issue.filter(impact__order=1)

    def __str__(self):
        return u'%s - %s' % (self.type.name, self.pk)
    __unicode__ = __str__

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


class RequirementHistory(models.Model):
    """Save the history of Reuqirement."""

    editor = models.ForeignKey(User)
    requirement = models.ForeignKey(Requirement)
    owner = models.ForeignKey(RequirementOwner)
    start_date = models.DateTimeField(auto_now=True)
    end_date = models.DateTimeField()

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"
