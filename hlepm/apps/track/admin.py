#! /usr/bin/env python

from django.contrib import admin

from apps.track.models import BrdStatus, BrdAck
from apps.track.models import Department, Section
from apps.track.models import MrdStatus, MrdAck
from apps.track.models import MemberType
from apps.track.models import PrdStatus, PrdAck
from apps.track.models import ProjectStatus, ProjectAck
from apps.track.models import Product
from apps.track.models import StakeholderType
from apps.track.models import Version


__all__ = ('BrdStatusAdmin',
           'BrdAckAdmin',
           'MrdStatusAdmin',
           'MrdAckAdmin',
           'PrdStatusAdmin',
           'PrdAckAdmin',
           'ProductAdmin',
           'ProjectStatusAdmin',
           'ProjectAckAdmin',
           'MemberTypeAdmin',
           'StakeholderTypeAdmin',
           'DepartmentAdmin',
           'SectionAdmin',
           'VersionAdmin',
          )


class BrdStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(BrdStatus, BrdStatusAdmin)


class BrdAckAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(BrdAck, BrdAckAdmin)


class MrdStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(MrdStatus, MrdStatusAdmin)


class MrdAckAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(MrdAck, MrdAckAdmin)


class VersionAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(Version, VersionAdmin)


class PrdStatusAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(PrdStatus, PrdStatusAdmin)


class PrdAckAdmin(admin.ModelAdmin):

    list_display = ('name', 'order')
    search_fields  = ['name',]
    ordering = ['name',]

admin.site.register(PrdAck, PrdAckAdmin)


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
