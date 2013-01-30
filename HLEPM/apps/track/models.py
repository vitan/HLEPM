#!/usr/bin/env python

from django.db import models
from django.conf import settings
from django.utils.text import truncate_words
from django.contrib.auth.models import User

from HLEPM.apps.common.models import DictBase


__all__ = ('Department',
           'Impact',
           'Issue',
           'IssueStatus',
           'Member',
           'MemberType',
           'Priority',
           'Probability',
           'Product',
           'Project',
           'ProjectType',
           'ProjectStatus',
           'ProjectAck',
           'ProjectHistory',
           'Risk',
           'RiskStatus',
           'Requirement',
           'RequirementAck',
           'RequirementContent',
           'RequirementHistory',
           'RequirementStatus',
           'Response',
           'Section',
           'Stakeholder',
           'StakeholderType',
           'Version',
          )


class Product(models.Model):

    name = models.CharField(max_length=150)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class RequirementContent(DictBase):
    """ Save the content of Requirement."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class RequirementStatus(DictBase):
    """ Save the status of Requirement."""

    content = models.ForeignKey(RequirementContent)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class RequirementAck(DictBase):
    """ Save the ACK of Requirement."""

    content = models.ForeignKey(RequirementContent)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Version(DictBase):
    """Save the version."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Requirement(models.Model):
    """ An model for requirements record save."""

    name = models.CharField(max_length=150)
    author = models.ForeignKey(User)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField(
        verbose_name='deadline',
    )
    docfile = models.FileField(upload_to=settings.UPLOAD_TO)
    content = models.ForeignKey(RequirementContent)
    status = models.ForeignKey(RequirementStatus)
    ack = models.ForeignKey(RequirementAck)
    requirement = models.ManyToManyField('Requirement',
                                         null=True,
                                         blank=True,
                                        related_name='requirement_requirement')
    product = models.ForeignKey(Product, null=True, blank=True)
    version = models.ForeignKey(Version, null=True, blank=True)
    update = models.DateTimeField(auto_now=True, auto_now_add=True)

    def __str__(self):
        return u'%s - %s' % (self.type.name, self.pk)
    __unicode__ = __str__


class ProjectType(DictBase):
    """Save the type of Project"""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class ProjectStatus(DictBase):
    """Save the status of project."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class ProjectAck(DictBase):
    """Save the ack of project."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Project(models.Model):

    description = models.CharField(max_length=1024, null=True, blank=True)
    product = models.ForeignKey(Product)
    requirement = models.ForeignKey(Requirement)
    version = models.ForeignKey(Version)
    status = models.ForeignKey(ProjectStatus)
    ack = models.ForeignKey(ProjectAck)
    project_manager = models.ForeignKey(User)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField(
        verbose_name='deadline',
    )
    type = models.ForeignKey(ProjectType)
    update = models.DateTimeField(auto_now=True, auto_now_add=True)


class MemberType(DictBase):
    """Save the type of member."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Member(models.Model):

    name = models.CharField(max_length=512)
    type = models.ForeignKey(MemberType)
    project = models.ForeignKey(Project)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class StakeholderType(DictBase):
    """Save the type of stakeholder."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Department(models.Model):

    name = models.CharField(max_length=150)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Section(models.Model):

    name = models.CharField(max_length=150)
    department = models.ForeignKey(Department)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Stakeholder(models.Model):

    type = models.ForeignKey(StakeholderType)
    project = models.ForeignKey(Project)
    section = models.ForeignKey(Section)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Impact(DictBase):

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Response(DictBase):

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Priority(DictBase):

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Probability(DictBase):

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class RiskStatus(DictBase):
    """Save the status of risk."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Risk(models.Model):
    """Save the risk of Requirement&Project."""

    reporter = models.ForeignKey(User)
    impact = models.ForeignKey(Impact)
    probability = models.ForeignKey(Probability)
    response = models.ForeignKey(Response)
    status = models.ForeignKey(RiskStatus)
    start_date = models.DateTimeField()
    due_date = models.DateTimeField()
    description = models.CharField(max_length=1024)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class IssueStatus(DictBase):
    """Save the status of project."""

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Issue(models.Model):
    """Save the issue of Reuqirement&Project."""

    reporter = models.ForeignKey(User)
    impact = models.ForeignKey(Impact)
    priority = models.ForeignKey(Priority)
    status = models.ForeignKey(IssueStatus)
    start_date = models.DateTimeField()
    dur_date = models.DateTimeField()
    description = models.CharField(max_length=1024)

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class RequirementHistory(models.Model):
    """Save the history of Reuqirement."""

    editor = models.ForeignKey(User)
    requirement = models.ForeignKey(Requirement)
    ack = models.ForeignKey(RequirementAck)
    start_date = models.DateTimeField(auto_now=True)
    end_date = models.DateTimeField()

    def __str__(self):
        return u'%s' % truncate_words(self.name, 15)
    __unicode__ = __str__


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
