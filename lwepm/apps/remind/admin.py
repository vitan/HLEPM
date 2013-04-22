# -*- coding: utf-8 -*-
from django.contrib import admin
from lwepm.apps.remind.models import EmailTemplate

class EmailTemplateAdmin(admin.ModelAdmin):

    list_display = ('content_type',
                    'subject',
                    'from_email',
                    'is_with_attachment',
                    'is_enable')
    ordering = ['-update']
admin.site.register(EmailTemplate, EmailTemplateAdmin)
