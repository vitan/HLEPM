# -*- coding: utf-8 -*-

from django import forms

from HLEPM.apps.track.models import Product, Version


__all__ = (
    'ProductField',
    'VersionField',
    'StartDateField',
    'TargetDateField',
)


ProductField = forms.ModelChoiceField(
    label=u"Product",
    queryset=Product.objects.all(),
    empty_label=None,
)
VersionField = forms.ModelChoiceField(
    label=u"Version",
    queryset=Version.objects.all(),
    empty_label=None,
)
StartDateField = forms.DateTimeField(
    label=u"Start Date",
    required=False,
    widget=forms.DateTimeInput(
        format='%m/%d/%Y',
    ),
)
TargetDateField = forms.DateTimeField(
    label=u"Target Date",
    required=False,
    widget=forms.DateTimeInput(
        format='%m/%d/%Y',
    ),
)
