#!/usr/bin/env python

from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist, PermissionDenied
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.contrib.contenttypes.models import ContentType
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext, loader, Context
from django.template.loader import render_to_string
from django.views.decorators.http import require_POST, require_http_methods
from django.conf import settings
from django.contrib.auth.models import User

from HLEPM.apps.common.views import AjaxResponseMixin
from HLEPM.apps.search.views import add_search_url_for_model
from HLEPM.apps.track.models import Impact
from HLEPM.apps.track.models import Probability
from HLEPM.apps.track.models import Risk
from HLEPM.apps.track.forms import RiskForm
from HLEPM.apps.track.models import Response
from HLEPM.apps.track.models import RiskStatus

__all__ = (
    'risk',
    'risk_add',
    'risk_update',
)
#The following is a test function now, will improve it later.
@login_required
def risk(request, app_label, module_name, pk, template_name='track/risk/risk.html'):
    content_type = ContentType.objects.get(app_label=app_label, model=module_name)
    context_data = {
        'subtitle': 'Risk',
        'Impacts': Impact.objects.all(),
        'Responses': Response.objects.all(),
        'Probabilities': Probability.objects.all(),
        'statuss': RiskStatus.objects.all(),
        'reporter_url': add_search_url_for_model(User),
        'risks':Risk.objects.filter(content_type=content_type, object_id=pk),
        'app_label': app_label,
        'module_name': module_name,
        'pk': pk,
        }

    return render_to_response(template_name, context_data, context_instance=RequestContext(request))


@require_POST
@login_required
def risk_add(request, app_label, module_name, pk, template_name='track/risk/one-risk.html'):
    content_type = ContentType.objects.get(app_label=app_label, model=module_name)
    bind_object_data = {'content_type': content_type, 'object_id': pk}
    response = AjaxResponseMixin()
    if request.method == 'POST':
        form = RiskForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            data.update(bind_object_data)
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
        risk_obj = get_object_or_404(Risk, pk=risk_id)
        bind_object_data = {'content_type': risk_obj.content_type, 'object_id':risk_obj.object_id}
        form = RiskForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            data.update(bind_object_data)
            risk_obj = Risk(pk=risk_id, **data)
            risk_obj.save()
            new_template_name = 'track/risk/one-risk.html'
            new_risk_html = render_to_string(new_template_name, {'risk': risk_obj})
            new_risk_data = {'update_risk': new_risk_html}
        return response.ajax_response(new_risk_data)
