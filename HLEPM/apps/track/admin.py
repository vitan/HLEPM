#! /usr/bin/env python

from django.contrib import admin

from HLEPM.apps.track.models import Department, Section
from HLEPM.apps.track.models import Impact
from HLEPM.apps.track.models import Issue, IssueStatus
from HLEPM.apps.track.models import Member, MemberType
from HLEPM.apps.track.models import Phase
from HLEPM.apps.track.models import Project, ProjectStatus, ProjectOwner, ProjectType
from HLEPM.apps.track.models import Priority
from HLEPM.apps.track.models import Probability
from HLEPM.apps.track.models import Product
from HLEPM.apps.track.models import Requirement,  RequirementContent
from HLEPM.apps.track.models import RequirementStatus, RequirementOwner
from HLEPM.apps.track.models import Response
from HLEPM.apps.track.models import Risk, RiskStatus
from HLEPM.apps.track.models import Stakeholder, StakeholderType
from HLEPM.apps.track.models import Version


__all__ = (
    'DepartmentAdmin',
    'ImpactAdmin',
    'IssueAdmin',
    'IssueStatusAdmin',
    'MemberAdmin',
    'MemberTypeAdmin',
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
    'RequirementContentAdmin',
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

    list_display = ('name',
                    'author',
                    'start_date',
                    'target_date',
                    'content',
                    'status',
                    'owner',
                    'product',
                    'version',
                   )
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(Requirement, RequirementAdmin)


class RequirementOwnerAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(RequirementOwner, RequirementOwnerAdmin)


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


class PhaseAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(Phase, PhaseAdmin)


class ProjectAdmin(admin.ModelAdmin):

    list_display = ('product',
                    'requirement',
                    'version',
                    'status',
                    'owner',
                    'project_manager',
                    'start_date',
                    'end_date',
                   )
    search_fields  = ['product',]
    ordering = ['product',]

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
                    'due_date',
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
                    'dur_date',
                   )
    search_fields = ['status']
    ordering = ['status']

admin.site.register(Issue, IssueAdmin)


class IssueStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields = ['name']
    ordering = ['name']

admin.site.register(IssueStatus, IssueStatusAdmin)
