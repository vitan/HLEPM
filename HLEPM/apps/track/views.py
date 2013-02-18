#!/usr/bin/env python

from django.http import HttpResponse, Http404
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.core.exceptions import PermissionDenied
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.views.decorators.http import require_POST

from HLEPM.apps.attachments.views import add_attachment
from HLEPM.apps.common.views import AjaxResponseMixin
from HLEPM.apps.track.models import Product
from HLEPM.apps.track.models import Requirement
from HLEPM.apps.track.forms import RequirementForm


__all__ = {
    'requirement_add',
}


@require_POST
@login_required
def requirement_add(request):
    """Add a new requirements(BRD/MRD/PRD)."""

    response = AjaxResponseMixin()
    if request.method == 'POST':
        form = RequirementForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            data.pop('requirement')
            requirement_obj = Requirement(**data)
            requirement_obj.save()

            #Save attachment
            if request.FILES:
                add_attachment(request, 'track', 'Requirement',\
                               requirement_obj.pk, response)

            return response.ajax_response()
        else:
            pass
