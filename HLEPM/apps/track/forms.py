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
from HLEPM.apps.track.models import Impact
from HLEPM.apps.track.models import Response
from HLEPM.apps.track.models import Probability
from HLEPM.apps.track.models import RiskStatus


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
    parent_type = forms.ModelChoiceField(
        label=u"Parent Type",
        queryset=RequirementType.objects.exclude(name__iexact='prd'),
        empty_label=None,
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

class RiskForm(forms.Form):
    reporter = forms.CharField(
        label=u"Reporter"
    )
    start_date = StartDateField
    target_date = TargetDateField
    description = forms.CharField(
        label="Description",
        required=False,
    )
    impact = forms.ModelChoiceField(
        label=u"Impact",
        queryset=Impact.objects.all(),
        empty_label=None,
    )
    response = forms.ModelChoiceField(
        label=u"Response",
        queryset=Response.objects.all(),
        empty_label=None,
    )
    probability = forms.ModelChoiceField(
        label=u"Probability",
        queryset=Probability.objects.all(),
        empty_label=None,
    )
    status = forms.ModelChoiceField(
        label=u"Status",
        queryset=RiskStatus.objects.all(),
        empty_label=None,
    )

    def clean_reporter(self):
        data = self.cleaned_data['reporter']
        obj = User.objects.get(username=data)
        return obj
