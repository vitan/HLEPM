#!/usr/bin/env python

from django import forms
from django.contrib.auth.models import User
from django.conf import settings

from lwepm.apps.track.fields import ProductField, VersionField
from lwepm.apps.track.fields import StartDateField, TargetDateField
from lwepm.apps.track.models import Issue, Risk
from lwepm.apps.track.models import Project
from lwepm.apps.track.models import Requirement, RequirementType
from lwepm.apps.track.models import Mitigation
from lwepm.apps.track.models import RequirementStatus, RequirementOwner
from lwepm.apps.track.models import Impact
from lwepm.apps.track.models import Response
from lwepm.apps.track.models import Priority
from lwepm.apps.track.models import Probability
from lwepm.apps.track.models import RiskStatus
from lwepm.apps.track.models import IssueStatus


__all__ = (
           "RequirementForm",
           "RiskForm",
           "IssueForm"
          )


class RequirementForm(forms.Form):

    type = forms.ModelChoiceField(
        label=u"Type",
        queryset=RequirementType.objects.all(),
        empty_label='-'*7,
    )
    product = ProductField
    version = VersionField
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
        empty_label='-'*7,
        required=False,
    )
    parent = forms.CharField(
        label="Parent",
        required=False,
        help_text = 'Separate your parents by commas, please.',
    )
    start_date = StartDateField
    target_date = TargetDateField

    def clean_author(self):
        data = self.cleaned_data['author']
        obj = User.objects.get(username=data)
        return obj

    def clean_parent(self):
        return [p for p in self.cleaned_data['parent'].split(u',') if p]

    def clean(self):
        cleaned_data = super(RequirementForm, self).clean()
        type = cleaned_data.get("type")
        product = cleaned_data.get("product")

        if type and type.order != 1 and product is None:
            msg = u"Invalid select(product must be required when type is not BRD."
            self._errors["product"] = self.error_class([msg])

            del cleaned_data['product']

        parent_type = cleaned_data.get("parent_type")
        parent_list = set()
        for parent in cleaned_data.get("parent"):
            try:
                req_obj = Requirement.objects.get(name=parent.strip(),
                                                  type=parent_type)
                parent_list.add(req_obj)
            except Requirement.DoesNotExist:
                self._errors["parent"] = self.error_class(['Cannot find %s %s' %
                                                           (parent_type, parent)])

        cleaned_data['parent'] = parent_list
        return cleaned_data


class RiskForm(forms.Form):
    reporter = forms.CharField(
        label=u"Reporter"
    )
    start_date = StartDateField
    target_date = TargetDateField
    description = forms.CharField(
        widget=forms.Textarea(attrs={ "cols":"1", "rows":"1" }),
        label="Description",
        required=True,
    )
    impact = forms.ModelChoiceField(
        widget=forms.RadioSelect,
        label=u"Impact",
        queryset=Impact.objects.all(),
        empty_label=None,
    )
    response = forms.ModelChoiceField(
        widget=forms.RadioSelect,
        label=u"Response",
        queryset=Response.objects.all(),
        empty_label=None,
    )
    probability = forms.ModelChoiceField(
        widget=forms.RadioSelect,
        label=u"Probability",
        queryset=Probability.objects.all(),
        empty_label=None,
    )
    status = forms.ModelChoiceField(
        widget=forms.RadioSelect,
        label=u"Status",
        queryset=RiskStatus.objects.all(),
        empty_label=None,
    )

    def clean_reporter(self):
        data = self.cleaned_data['reporter']
        obj = User.objects.get(username=data)
        return obj

class IssueForm(forms.Form):
    reporter = forms.CharField(
        label=u"Reporter"
    )
    start_date = StartDateField
    target_date = TargetDateField
    description = forms.CharField(
        widget=forms.Textarea(attrs={ "cols":"1", "rows":"1" }),
        label="Description",
    )
    impact = forms.ModelChoiceField(
        widget=forms.RadioSelect,
        label=u"Impact",
        queryset=Impact.objects.all(),
        empty_label=None,
    )
    mitigation = forms.ModelChoiceField(
        widget=forms.RadioSelect,
        label=u"Mitigation",
        queryset=Mitigation.objects.all(),
        empty_label=None,
    )
    priority = forms.ModelChoiceField(
        widget=forms.RadioSelect,
        label=u"Priority",
        queryset=Priority.objects.all(),
        empty_label=None,
    )
    status = forms.ModelChoiceField(
        widget=forms.RadioSelect,
        label=u"Status",
        queryset=IssueStatus.objects.all(),
        empty_label=None,
    )

    def clean_reporter(self):
        data = self.cleaned_data['reporter']
        obj = User.objects.get(username=data)
        return obj
