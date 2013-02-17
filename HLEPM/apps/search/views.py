#!/usr/bin/env python

from django.http import HttpResponse, Http404
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.core.exceptions import PermissionDenied
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext

from HLEPM.apps.track.models import RequirementOwner, Product, RequirementContent, RequirementStatus
from HLEPM.apps.track.forms import RequirementForm


__all__ = (
    'requirement_search',
)


@login_required
def requirement_search(request, template_name='search/requirement-search.html'):
    """Search the requirements(BRD/MRD/PRD)."""

    if request.method == 'GET':
        pass

    form = RequirementForm()

    return render_to_response(template_name, {
        'subtitle': 'BRD/MRD/PRD',
        'form': form,
        },context_instance=RequestContext(request))
