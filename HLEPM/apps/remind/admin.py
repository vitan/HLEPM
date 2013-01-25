# -*- coding: utf-8 -*-
from django.contrib import admin
from HLEPM.apps.remind.models import EmailTemplates
from HLEPM.apps.remind.models import EmailPurpose

class EmailTemplatesAdmin(admin.ModelAdmin):
    list_display = ('subject', 'mail_to', 'message',
                    'purpose', 'created_on', 'updated_on')
admin.site.register(EmailTemplates, EmailTemplatesAdmin)

class EmailPurposeAdmin(admin.ModelAdmin):
    list_display = ('purpose',)
admin.site.register(EmailPurpose, EmailPurposeAdmin)
