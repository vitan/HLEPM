#!/usr/bin/env python

from django import forms
from django.conf import settings

from HLEPM.apps.track.models import Issue, Risk
from HLEPM.apps.track.models import Product
from HLEPM.apps.track.models import Project
from HLEPM.apps.track.models import Requirement, RequirementContent
from HLEPM.apps.track.models import RequirementStatus, RequirementAck
from HLEPM.apps.track.models import Version


__all__ = ("ProjectForm",
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
    ack = forms.ModelChoiceField(
        label=u"Ack",
        queryset=RequirementAck.objects.all(),
        empty_label=None,
    )
    #TODO (weizhou) How to develop auto-match
    parent_type = forms.ModelChoiceField(
        label=u"Parent",
        queryset=RequirementContent.objects.exclude(name__iexact="prd"),
        empty_label=None,
    )
    parent_req = forms.CharField(
    )
    author = forms.CharField(
        label=u"Author",
    )
    start_date = forms.DateTimeField(
        label=u"Start Date",
    )
    target_date = forms.DateTimeField(
        label=u"Target Date",
    )
    file = forms.FileField(
        label=u"Document",
    )
