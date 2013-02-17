#!/usr/bin/env python

from django import forms
from django.contrib.auth.models import User
from django.conf import settings

from HLEPM.apps.track.models import Issue, Risk
from HLEPM.apps.track.models import Product
from HLEPM.apps.track.models import Project
from HLEPM.apps.track.models import Requirement, RequirementContent
from HLEPM.apps.track.models import RequirementStatus, RequirementOwner
from HLEPM.apps.track.models import Version


__all__ = (
           "RequirementForm",
          )


class RequirementForm(forms.Form):

    type = forms.ModelChoiceField(
        label=u"Type",
        queryset=RequirementContent.objects.all(),
        empty_label=None,
    )
    product = forms.ModelChoiceField(
        label=u"Product",
        queryset=Product.objects.all(),
        empty_label=None,
    )
    version = forms.ModelChoiceField(
        label=u"Version",
        queryset=Version.objects.all(),
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
    #TODO (weizhou) How to develop auto-match
    parent_type = forms.ModelChoiceField(
        label=u"Parent",
        queryset=RequirementContent.objects.exclude(name__iexact="prd"),
        empty_label=None,
    )
    parent_req = forms.CharField(
        required=False,
    )
    author = forms.ModelChoiceField(
        label=u"Author",
        queryset=User.objects.all(),
        empty_label=None,
    )
    """
    author = forms.CharField(
        label=u"Author",
    )
    """
    start_date = forms.DateTimeField(
        label=u"Start Date",
        required=False,
    )
    target_date = forms.DateTimeField(
        label=u"Target Date",
        required=False,
    )
    file = forms.FileField(
        label=u"Document",
        required=False,
    )

    def get_cleaned_data(self):
        return {
            'type': self.cleaned_data['type'],
            'product': self.cleaned_data['product'],
            'version': self.cleaned_data['version'],
            'status': self.cleaned_data['status'],
            'owner': self.cleaned_data['owner'],
            'parent_type': self.cleaned_data['parent_type'],
            'parent_req': self.cleaned_data['parent_req'],
            'author': self.cleaned_data['author'],
            'start_date': self.cleaned_data['start_date'],
            'target_date': self.cleaned_data['target_date'],
        }
