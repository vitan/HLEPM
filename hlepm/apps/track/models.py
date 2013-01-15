#!/usr/bin/env python

from django.db import models
from django.conf import settings
from django.utils.text import truncate_words
from django.contrib.auth.models import User

from apps.common.models import DictBase


__all__ = ('BrdStatus',
           'BrdAck',
           'Brd',
           'MrdStatus',
           'MrdAck',
           'Mrd',
           'PrdStatus',
           'PrdAck',
           'Prd',
           'Version',
           'Product',
           'ProjectStatus',
           'ProjectAck',
           'Project',
           'MemberType',
           'Member',
           'StakeholderType',
           'Stakeholder',
           'Department',
           'Section',
          )


class Product(models.Model):

    name = models.CharField(max_length=150)

    def __str__(self):
        return u'Product - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class DocBase(models.Model):
    """ An abstract model for documents such as BRD/PRD/MRD"""

    name = models.CharField(max_length=150)
    creater = models.ForeignKey(User)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField(
        verbose_name='deadline',
    )
    docfile = models.FileField(upload_to=settings.UPLOAD_TO)

    class Meta:
        abstract = True


class BrdStatus(DictBase):
    """ Save the status of BRD."""

    def __str__(self):
        return u'BrdStatus - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class BrdAck(DictBase):
    """ Save the ACK of BRD."""

    def __str__(self):
        return u'BrdAck - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Brd(DocBase):

    status = models.ForeignKey(BrdStatus)
    ack = models.ForeignKey(BrdAck)

    def __str__(self):
        return u'BRD - %s' % self.pk
    __unicode__ = __str__


class MrdStatus(DictBase):
    """ Save the status of MRD."""

    def __str__(self):
        return u'MrdStatus - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class MrdAck(DictBase):
    """ Save the ack of MRD."""

    def __str__(self):
        return u'MrdAck - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Mrd(DocBase):

    brd = models.ManyToManyField(Brd, null=True, blank=True)
    product = models.ForeignKey(Product)
    status = models.ForeignKey(MrdStatus)
    ack = models.ForeignKey(MrdAck)

    def __str__(self):
        return u'MRD - %s' % self.pk
    __unicode__ = __str__


class Version(DictBase):
    """Save the version."""

    def __str__(self):
        return u'Version - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class PrdStatus(DictBase):
    """ Save the status of PRD."""

    def __str__(self):
        return u'PrdStatus - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class PrdAck(DictBase):
    """ Save the ack of PRD."""

    def __str__(self):
        return u'PrdAck - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Prd(DocBase):

    mrd = models.ForeignKey(Mrd)
    version = models.ForeignKey(Version)
    status = models.ForeignKey(PrdStatus)
    ack = models.ForeignKey(PrdAck)

    def __str__(self):
        return u'PRD - %s' % self.pk
    __unicode__ = __str__


class ProjectType(DictBase):
    """Save the type of Project"""

    def __str__(self):
        return u'ProjectType - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class ProjectStatus(DictBase):
    """Save the status of project."""

    def __str__(self):
        return u'ProjectStatus - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class ProjectAck(DictBase):
    """Save the ack of project."""

    def __str__(self):
        return u'ProjectAck - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Project(models.Model):

    description = models.CharField(max_length=1024, null=True, blank=True)
    product = models.ForeignKey(Product)
    prd = models.ForeignKey(Prd)
    version = models.ForeignKey(Version)
    status = models.ForeignKey(ProjectStatus)
    ack = models.ForeignKey(ProjectAck)
    #TODO (weizhou) project manager be saved as text?
    project_manager = models.ForeignKey(User)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField(
        verbose_name='deadline',
    )
    type = models.ForeignKey(ProjectType)


class MemberType(DictBase):
    """Save the type of member."""

    def __str__(self):
        return u'MemberType - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Member(models.Model):

    name = models.CharField(max_length=512)
    type = models.ForeignKey(MemberType)
    project = models.ForeignKey(Project)

    def __str__(self):
        return u'Member - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class StakeholderType(DictBase):
    """Save the type of stakeholder."""

    def __str__(self):
        return u'StakeholderType - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Department(models.Model):

    name = models.CharField(max_length=150)

    def __str__(self):
        return u'Department - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Section(models.Model):

    name = models.CharField(max_length=150)
    department = models.ForeignKey(Department)

    def __str__(self):
        return u'Section - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__


class Stakeholder(models.Model):

    type = models.ForeignKey(StakeholderType)
    project = models.ForeignKey(Project)
    section = models.ForeignKey(Section)

    def __str__(self):
        return u'Stakeholder - %s' % truncate_words(self.name, 15)
    __unicode__ = __str__
