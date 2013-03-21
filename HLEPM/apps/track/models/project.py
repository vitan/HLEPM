#!/usr/bin/env python

from django.db import models
from django.utils.text import truncate_words
from django.contrib.auth.models import User

from HLEPM.apps.common.models import DictBase
from HLEPM.apps.track.models import Product, Version


__all__ = (
    'Department',
    'Member',
    'MemberType',
    'Phase',
    'Project',
    'ProjectType',
    'ProjectStatus',
    'ProjectOwner',
    'ProjectHistory',
    'Section',
    'Stakeholder',
    'StakeholderType',
)


class Phase(DictBase):
    """Save the Phase of Project"""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class ProjectType(DictBase):
    """Save the type of Project"""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class ProjectStatus(DictBase):
    """Save the status of project."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class ProjectOwner(DictBase):
    """Save the owner of project."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Project(models.Model):

    description = models.CharField(max_length=1024, null=True, blank=True)
    product = models.ForeignKey(Product)
    requirement = models.ForeignKey('Requirement')
    version = models.ForeignKey(Version)
    status = models.ForeignKey(ProjectStatus)
    owner = models.ForeignKey(ProjectOwner)
    project_manager = models.ForeignKey(User)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField(
        verbose_name='deadline',
    )
    type = models.ForeignKey(ProjectType)
    update = models.DateTimeField(auto_now=True, auto_now_add=True)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class MemberType(DictBase):
    """Save the type of member."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Member(models.Model):

    name = models.CharField(max_length=512)
    type = models.ForeignKey(MemberType)
    project = models.ForeignKey(Project)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class StakeholderType(DictBase):
    """Save the type of stakeholder."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Department(models.Model):

    name = models.CharField(max_length=150)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Section(models.Model):

    name = models.CharField(max_length=150)
    department = models.ForeignKey(Department)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class Stakeholder(models.Model):

    type = models.ForeignKey(StakeholderType)
    project = models.ForeignKey(Project)
    section = models.ForeignKey(Section)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"


class ProjectHistory(models.Model):
    """Save the history of Project."""

    editor = models.ForeignKey(User)
    project = models.ForeignKey(Project)
    type = models.ForeignKey(ProjectType)
    start_date = models.DateTimeField(auto_now=True)
    end_date = models.DateTimeField()

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__

    class Meta:
        app_label = "track"
