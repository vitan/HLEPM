#!/usr/bin/env python

from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist, PermissionDenied
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext, loader, Context
from django.views.decorators.http import require_POST, require_http_methods
from django.conf import settings
from django.contrib.auth.models import User

from HLEPM.apps.attachments.views import add_attachment, update_attachment
from HLEPM.apps.search.views import add_search_url_for_model
from HLEPM.apps.attachments.models import Attachment
from HLEPM.apps.common.views import AjaxResponseMixin
from HLEPM.apps.track.models import Product
from HLEPM.apps.track.models import Requirement, RequirementType
from HLEPM.apps.track.models import RequirementStatus, RequirementOwner
from HLEPM.apps.track.forms import RequirementForm
from HLEPM.apps.track.models import Version

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
        'search_url': add_search_url_for_model(Requirement,
                                               'track/requirement/requirement-table.html'),
    }

    return render_to_response(template_name, context_data, context_instance=RequestContext(request))


@require_http_methods(['GET', 'POST'])
@login_required
def requirement_add(request,
                    template_form='track/requirement/requirement-form-fields.html',
                    template_tr='track/requirement/requirement-table-tr.html'):
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

            template = loader.get_template(template_tr)
            request_context = RequestContext(request, {'report': requirement_obj })
            data = template.render(request_context)
            context = { 'latest_added': data }
            return response.ajax_response(**context)

        else:
            template = loader.get_template(template_form)
            data = template.render(Context({
                'form': form,
                'parent_url': add_search_url_for_model(Requirement),
                'author_url': add_search_url_for_model(User),
            }))
            response.update_errors({'invalid_form_html': data })
            return response.ajax_response()


    elif request.method == 'GET':
        form = RequirementForm()
        template = loader.get_template(template_form)
        data = template.render(Context({
            'form': form,
            'parent_url': add_search_url_for_model(Requirement),
            'author_url': add_search_url_for_model(User),
        }))
        context = {'add_form_html': data }
        return response.ajax_response(**context)


@require_http_methods(['GET', 'POST'])
@login_required
def requirement_update(request,
                       requirement_id,
                       template_name="track/requirement/requirement-form-fields.html",
                       template_tr='track/requirement/requirement-table-tr.html'):
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

            template = loader.get_template(template_tr)
            request_context = RequestContext(request, {'report': requirement_obj })
            data = template.render(request_context)
            context = { 'latest_updated': data }
            return response.ajax_response(**context)

        else:
            template = loader.get_template(template_name)
            data = template.render(Context({
                'form': form,
                'parent_url': add_search_url_for_model(Requirement),
                'author_url': add_search_url_for_model(User),
            }))
            response.update_errors({'invalid_form_html': data })
            return response.ajax_response()

    elif request.method == 'GET':
        requirement_obj = get_object_or_404(Requirement, pk=requirement_id)
        form = RequirementForm(initial=requirement_obj.get_form_initial())
        template = loader.get_template(template_name)
        data = template.render(Context({
            'form': form,
            'parent_url': add_search_url_for_model(Requirement),
            'author_url': add_search_url_for_model(User),
        }))
        context = { 'update_form_html': data }
        return response.ajax_response(**context)
