#!/usr/bin/env python

from django.http import HttpResponse, Http404
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.core.exceptions import PermissionDenied
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.views.decorators.http import require_POST
from django.conf import settings
from django.contrib.auth.models import User

from HLEPM.apps.attachments.views import add_attachment, update_attachment
from HLEPM.apps.search.views import add_search_url_for_model, search
from HLEPM.apps.attachments.models import Attachment
from HLEPM.apps.common.views import AjaxResponseMixin
from HLEPM.apps.track.models import Product
from HLEPM.apps.track.models import Requirement, RequirementType
from HLEPM.apps.track.models import Risk
from HLEPM.apps.track.models import RequirementStatus, RequirementOwner
from HLEPM.apps.track.forms import RequirementForm
from HLEPM.apps.track.forms import RiskForm
from HLEPM.apps.track.models import Version
from HLEPM.apps.track.models import Impact
from HLEPM.apps.track.models import Response
from HLEPM.apps.track.models import Probability
from HLEPM.apps.track.models import RiskStatus

__all__ = (
    'requirement',
    'requirement_add',
    'requirement_update',
)


@login_required
def requirement(request, template_name='track/requirement.html'):

    context_data = {
        'subtitle': 'BRD/MRD/PRD',
        'types': RequirementType.objects.all(),
        'products': Product.objects.all(),
        'versions': Version.objects.all(),
        'statuss': RequirementStatus.objects.all(),
        'owners': RequirementOwner.objects.all(),
        'parent_types': RequirementType.objects.exclude(name__iexact='prd'),
        'filter_url': add_search_url_for_model(Requirement),
        'author_url': add_search_url_for_model(User),
        'media_url': settings.MEDIA_URL,
    }

    return render_to_response(template_name, context_data, context_instance=RequestContext(request))


@require_POST
@login_required
def requirement_add(request, template_name=''):
    """Add a new requirements(BRD/MRD/PRD)."""

    response = AjaxResponseMixin()
    if request.method == 'POST':
        form = RequirementForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            #TODO (weizhou) How to save the parent?
            data.pop('parent')
            requirement_obj = Requirement(**data)
            requirement_obj.save()

            #Save attachment
            if request.FILES:
                add_attachment(
                    request,
                    requirement_obj._meta.app_label,
                    requirement_obj._meta.module_name,
                    requirement_obj.pk,
                    response
                )

            return response.ajax_response()
        else:
            pass


@require_POST
@login_required
def requirement_update(request, requirement_id, template_name=""):
    """Update a requirements(BRD/MRD/PRD)."""

    response = AjaxResponseMixin()
    if request.method == 'POST':
        form = RequirementForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            #TODO (weizhou) How to update the parent?
            data.pop('parent')
            requirement_obj = Requirement(pk=requirement_id, **data)
            requirement_obj.save()

            #Update attachment
            if request.FILES:
                update_attachment(
                    request,
                    requirement_obj._meta.app_label,
                    requirement_obj._meta.module_name,
                    requirement_obj.pk,
                    response
                )

            return response.ajax_response()
        else:
            pass


def project(request, template_name='track/project.html'):

    context_data = {}

    return render_to_response(template_name, context_data, context_instance=RequestContext(request))


#The following is a test function now, will improve it later.
@login_required
def risk(request, template_name='track/risk.html'):

    context_data = {
        'subtitle': 'Risk',
        'Impacts': Impact.objects.all(),
        'Responses': Response.objects.all(),
        'Probabilities': Probability.objects.all(),
        'statuss': RiskStatus.objects.all(),
        'reporter_url': add_search_url_for_model(User),
        }

    return render_to_response(template_name, context_data, context_instance=RequestContext(request))


@require_POST
@login_required
def risk_add(request, template_name=''):

    response = AjaxResponseMixin()
    if request.method == 'POST':
        form = RiskForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            risk_obj = Risk(**data)
            risk_obj.save()
            return response.ajax_response()
        else:
            pass
