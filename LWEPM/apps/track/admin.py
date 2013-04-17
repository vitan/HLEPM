#! /usr/bin/env python

from django.contrib import admin

from LWEPM.apps.track.models import Department, Section
from LWEPM.apps.track.models import Impact
from LWEPM.apps.track.models import Issue, IssueStatus
from LWEPM.apps.track.models import Member, MemberType
from LWEPM.apps.track.models import Mitigation
from LWEPM.apps.track.models import Phase
from LWEPM.apps.track.models import Project, ProjectStatus, ProjectOwner, ProjectType
from LWEPM.apps.track.models import Priority
from LWEPM.apps.track.models import Probability
from LWEPM.apps.track.models import Product
from LWEPM.apps.track.models import Requirement,  RequirementType
from LWEPM.apps.track.models import RequirementStatus, RequirementOwner
from LWEPM.apps.track.models import Response
from LWEPM.apps.track.models import Risk, RiskStatus
from LWEPM.apps.track.models import Stakeholder, StakeholderType
from LWEPM.apps.track.models import Version


__all__ = (
    'DepartmentAdmin',
    'ImpactAdmin',
    'IssueAdmin',
    'IssueStatusAdmin',
    'MemberAdmin',
    'MemberTypeAdmin',
    'MitigationAdmin',
    'PhaseAdmin',
    'PriorityAdmin',
    'ProbabilityAdmin',
    'ProductAdmin',
    'ProjectAdmin',
    'ProjectOwnerAdmin',
    'ProjectStatusAdmin',
    'ProjectTypeAdmin',
    'RiskAdmin',
    'RiskStatusAdmin',
    'RequirementAdmin',
    'RequirementStatusAdmin',
    'RequirementOwnerAdmin',
    'RequirementTypeAdmin',
    'ResponseAdmin',
    'SectionAdmin',
    'StakeholderAdmin',
    'StakeholderTypeAdmin',
    'VersionAdmin',
)


class RequirementStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(RequirementStatus, RequirementStatusAdmin)


class RequirementAdmin(admin.ModelAdmin):
    pass

admin.site.register(Requirement, RequirementAdmin)


class RequirementOwnerAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(RequirementOwner, RequirementOwnerAdmin)


class RequirementTypeAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(RequirementType, RequirementTypeAdmin)


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


class PhaseAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(Phase, PhaseAdmin)


class ProjectAdmin(admin.ModelAdmin):
    pass

admin.site.register(Project, ProjectAdmin)


class ProjectStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(ProjectStatus, ProjectStatusAdmin)


class ProjectOwnerAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(ProjectOwner, ProjectOwnerAdmin)


class ProjectTypeAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(ProjectType, ProjectTypeAdmin)


class MemberAdmin(admin.ModelAdmin):

    list_display = ('name', 'type', 'project')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(Member, MemberAdmin)


class MemberTypeAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(MemberType, MemberTypeAdmin)

class MitigationAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields = ['name',]
    ordering = ['name',]

admin.site.register(Mitigation,MitigationAdmin)

class StakeholderAdmin(admin.ModelAdmin):

    list_display = ('type', 'project', 'section')
    search_fields  = ['type',]
    ordering = ['type',]

admin.site.register(Stakeholder, StakeholderAdmin)


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


class RiskAdmin(admin.ModelAdmin):

    list_display = ('reporter',
                    'impact',
                    'probability',
                    'response',
                    'status',
                    'start_date',
                    'target_date',
                   )
    search_fields = ['reporter']
    ordering = ['reporter']

admin.site.register(Risk, RiskAdmin)


class RiskStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields = ['name']
    ordering = ['name']

admin.site.register(RiskStatus, RiskStatusAdmin)


class IssueAdmin(admin.ModelAdmin):

    list_display = ('reporter',
                    'impact',
                    'priority',
                    'status',
                    'start_date',
                    'target_date',
                   )
    search_fields = ['status']
    ordering = ['status']

admin.site.register(Issue, IssueAdmin)


class IssueStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields = ['name']
    ordering = ['name']

admin.site.register(IssueStatus, IssueStatusAdmin)
