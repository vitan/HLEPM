#!/usr/bin/env python

from django.http import HttpResponse, Http404
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist, PermissionDenied
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext, loader, Context
from django.template.loader import render_to_string
from django.views.decorators.http import require_POST, require_http_methods
from django.conf import settings
from django.contrib.auth.models import User

from HLEPM.apps.attachments.views import add_attachment, update_attachment
from HLEPM.apps.search.views import add_search_url_for_model
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
def requirement(request, template_name='track/requirement/requirement.html'):

    form = RequirementForm()
    context_data = {
        'subtitle': 'BRD/MRD/PRD',
        'types': RequirementType.objects.all(),
        'products': Product.objects.all(),
        'statuss': RequirementStatus.objects.all(),
        'owners': RequirementOwner.objects.all(),
        'form': form,
        'search_url': add_search_url_for_model(Requirement),
        'parent_url': add_search_url_for_model(Attachment),
        'author_url': add_search_url_for_model(User),
    }

    return render_to_response(template_name, context_data, context_instance=RequestContext(request))


@require_http_methods(['GET', 'POST'])
@login_required
def requirement_add(request, template_name='track/requirement/requirement-form-fields.html'):
    """Add a new requirements(BRD/MRD/PRD)."""

    response = AjaxResponseMixin()
    if request.method == 'POST':
        form = RequirementForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            #TODO (weizhou) How to save the parent?
            data.pop('parent_type')
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
    elif request.method == 'GET':
        form = RequirementForm()
        template = loader.get_template(template_name)
        data = template.render(Context({
            'form': form,
            'parent_url': add_search_url_for_model(Attachment),
            'author_url': add_search_url_for_model(User),
        }))
        context = {'add_form_html': data }
        return response.ajax_response(**context)


@require_http_methods(['GET', 'POST'])
@login_required
def requirement_update(request, requirement_id, template_name="track/requirement/requirement-form-fields.html"):
    """Update a requirements(BRD/MRD/PRD)."""

    response = AjaxResponseMixin()
    if request.method == 'POST':
        form = RequirementForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            #TODO (weizhou) How to update the parent?
            data.pop('parent_type')
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
    elif request.method == 'GET':
        requirement_obj = get_object_or_404(Requirement, pk=requirement_id)
        form = RequirementForm(initial=requirement_obj.get_form_initial())
        template = loader.get_template(template_name)
        data = template.render(Context({
            'form': form,
            'parent_url': add_search_url_for_model(Attachment),
            'author_url': add_search_url_for_model(User),
        }))
        context = { 'update_form_html': data }
        return response.ajax_response(**context)

@login_required
def risk(request, template_name='track/risk/risk.html'):

    context_data = {
        'subtitle': 'Risk',
        'Impacts': Impact.objects.all(),
        'Responses': Response.objects.all(),
        'Probabilities': Probability.objects.all(),
        'statuss': RiskStatus.objects.all(),
        'reporter_url': add_search_url_for_model(User),
        'risks':Risk.objects.all(),
        }

    return render_to_response(template_name, context_data, context_instance=RequestContext(request))


@require_POST
@login_required
def risk_add(request, template_name='track/risk/one-risk.html'):
    response = AjaxResponseMixin()
    if request.method == 'POST':
        form = RiskForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            risk_obj = Risk(**data)
            risk_obj.save()
            new_risk_html = render_to_string(template_name, {'risk': risk_obj})
            new_risk_data = {'new_risk': new_risk_html}
            return response.ajax_response(new_risk_data)
        else:
            pass

@require_http_methods(['GET', 'POST'])
@login_required
def risk_update(request, risk_id, template_name='track/risk/update-risk.html'):
    if request.method == 'GET':
        response = AjaxResponseMixin()
        risk_obj = get_object_or_404(Risk, pk=risk_id)
        form = RiskForm(initial=risk_obj.get_form_initial())
        old_risk_html = render_to_string(template_name,{'risk': risk_obj,
                                         'form': form,
                                         'statuss': RiskStatus.objects.all(),
                                         'Impacts': Impact.objects.all(),
                                         'Responses': Response.objects.all(),
                                         'Probabilities': Probability.objects.all(),
                                         'reporter_url': add_search_url_for_model(User),
                                        },context_instance=RequestContext(request))

        old_risk_data = {'old_risk': old_risk_html}
        return response.ajax_response(old_risk_data)

    elif request.method == 'POST':
        response = AjaxResponseMixin()
        form = RiskForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            risk_obj = Risk(pk=risk_id, **data)
            risk_obj.save()
            new_template_name = 'track/risk/one-risk.html'
            new_risk_html = render_to_string(new_template_name, {'risk': risk_obj})
            new_risk_data = {'update_risk': new_risk_html}
        return response.ajax_response(new_risk_data)


