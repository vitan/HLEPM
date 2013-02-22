#!/usr/bin/env python

from django import forms
from django.contrib.auth.models import User
from django.conf import settings

from HLEPM.apps.track.fields import ProductField, VersionField
from HLEPM.apps.track.fields import StartDateField, TargetDateField
from HLEPM.apps.track.models import Issue, Risk
from HLEPM.apps.track.models import Project
from HLEPM.apps.track.models import Requirement, RequirementType
from HLEPM.apps.track.models import RequirementStatus, RequirementOwner


__all__ = (
           "RequirementForm",
          )


class RequirementForm(forms.Form):

    product = ProductField
    version = VersionField
    start_date = StartDateField
    target_date = TargetDateField
    type = forms.ModelChoiceField(
        label=u"Type",
        queryset=RequirementType.objects.all(),
        empty_label=None,
    )
    status = forms.ModelChoiceField(
        label=u"Status",
        queryset=RequirementStatus.objects.all(),
        empty_label=None,
    )
    owner = forms.ModelChoiceField(
        label=u"Owner",
        queryset=RequirementOwner.objects.all(),
        empty_label=None,
    )
    author = forms.CharField(
        label=u"Author",
    )
    parent = forms.CharField(
        label="Parent",
        required=False,
    )

    def clean_author(self):
        data = self.cleaned_data['author']
        obj = User.objects.get(username=data)
        return obj

    def clean_parent(self):
        data = self.cleaned_data['parent']
        #TODO (weizhou) which model should be used for query."
        pass
