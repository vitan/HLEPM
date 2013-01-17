#! /usr/bin/env python

from django.contrib import admin

from apps.track.models import Department, Section
from apps.track.models import Impact
from apps.track.models import Issue
from apps.track.models import IssueStatus
from apps.track.models import MemberType
from apps.track.models import ProjectStatus, ProjectAck
from apps.track.models import Priority
from apps.track.models import Probability
from apps.track.models import Product
from apps.track.models import RequirementStatus, RequirementAck, RequirementContent
from apps.track.models import Response
from apps.track.models import Risk
from apps.track.models import RiskStatus
from apps.track.models import StakeholderType
from apps.track.models import Version


__all__ = ('RequirementStatusAdmin',
           'RequirementAckAdmin',
           'RequirementContentAdmin',
           'ProductAdmin',
           'ProjectStatusAdmin',
           'ProjectAckAdmin',
           'MemberTypeAdmin',
           'StakeholderTypeAdmin',
           'DepartmentAdmin',
           'SectionAdmin',
           'VersionAdmin',
           'ImpactAdmin',
           'ResponseAdmin',
           'PriorityAdmin',
           'ProbabilityAdmin',
           'RiskStatusAdmin',
           'IssueStatusAdmin',
          )


class RequirementStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(RequirementStatus, RequirementStatusAdmin)


class RequirementAckAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(RequirementAck, RequirementAckAdmin)


class RequirementContentAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(RequirementContent, RequirementContentAdmin)


class VersionAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(Version, VersionAdmin)


class ProductAdmin(admin.ModelAdmin):

    list_display = ('name',)
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(Product, ProductAdmin)


class ProjectStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(ProjectStatus, ProjectStatusAdmin)


class ProjectAckAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(ProjectAck, ProjectAckAdmin)


class MemberTypeAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(MemberType, MemberTypeAdmin)


class StakeholderTypeAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(StakeholderType, StakeholderTypeAdmin)


class DepartmentAdmin(admin.ModelAdmin):

    list_display = ('name',)
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(Department, DepartmentAdmin)


class SectionAdmin(admin.ModelAdmin):

    list_display = ('name',)
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(Section, SectionAdmin)


class ImpactAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields = ['name']
    ordering = ['name']

admin.site.register(Impact, ImpactAdmin)


class ResponseAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields = ['name']
    ordering = ['name']

admin.site.register(Response, ResponseAdmin)


class PriorityAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields = ['name']
    ordering = ['name']

admin.site.register(Priority, PriorityAdmin)


class ProbabilityAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields = ['name']
    ordering = ['name']

admin.site.register(Probability, ProbabilityAdmin)


class RiskStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields = ['name']
    ordering = ['name']

admin.site.register(RiskStatus, RiskStatusAdmin)


class IssueStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields = ['name']
    ordering = ['name']

admin.site.register(IssueStatus, IssueStatusAdmin)
