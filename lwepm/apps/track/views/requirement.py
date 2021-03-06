#!/usr/bin/env python

from django.http import Http404
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist, PermissionDenied
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext, loader, Context
from django.views.decorators.http import require_POST, require_http_methods
from django.conf import settings
from django.contrib.auth.models import User

from lwepm.apps.search.views import add_search_url_for_model
from lwepm.apps.common.views import AjaxResponseMixin
from lwepm.apps.track.models import Product, RequirementHistory
from lwepm.apps.track.models import Requirement, RequirementType
from lwepm.apps.track.models import RequirementStatus, RequirementOwner
from lwepm.apps.track.models import Risk, Issue
from lwepm.apps.track.forms import RequirementForm
from lwepm.apps.track.models import Version


__all__ = (
    'requirement',
    'requirement_add',
    'requirement_update',
    'requirement_detail',
    'requirement_history',
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


@login_required
def requirement_detail(request, pk,
                       template_name='track/requirement/requirement-detail.html'):

    context_data = {
        'subtitle': 'BRD/MRD/PRD',
        'report': Requirement.objects.get(pk=pk),
        'app_label': Requirement._meta.app_label,
        'module_name': Requirement._meta.module_name,
        'risk_label': Risk._meta.app_label,
        'risk_module': Risk._meta.module_name,
        'issue_label': Issue._meta.app_label,
        'issue_module': Issue._meta.module_name,
        'search_url': add_search_url_for_model(Requirement,
                                               'track/requirement/requirement-table.html'),
        'filter': 'requirement__id#has#'+pk,
        #TODO (weizhou) Here I have to add another query for getting related
        #documents count.
        'relate_docs': Requirement.objects.filter(requirement__id__in=pk),
    }

    return render_to_response(template_name, context_data, context_instance=RequestContext(request))


@require_http_methods(['GET'])
@login_required
def requirement_history(request,
                        pk,
                        template_name='track/requirement/requirement-history.html'):
    """Get the history of one requirement."""

    response = AjaxResponseMixin()
    if request.method == 'GET':
        objs = RequirementHistory.objects.filter(requirement__pk=pk)
        template = loader.get_template(template_name)
        request_context = RequestContext(request, {'reports': objs })
        data = template.render(request_context)
        context = { 'detail': data }
        return response.ajax_response(**context)


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
            data.pop('parent_type')
            parent_set = data.pop('parent')
            requirement_obj = Requirement(**data)
            try:
                requirement_obj.save(**{
                    'creator': request.user,
                    'file': request.FILES})

                for parent in parent_set:
                    requirement_obj.requirement.add(parent)

                requirement_obj.post_save(editor=request.user)
            except Http404, err:
                response.update_errors({'DBerror': err.message })
                return response.ajax_response()
            except IntegrityError as err:
                response.update_errors({'DBerror': err.args[1] })
                return response.ajax_response()

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
            data.pop('parent_type')
            parent_set = data.pop('parent')
            try:
                requirement_obj = get_object_or_404(Requirement, pk=requirement_id)
                before_owner=requirement_obj.owner
                requirement_obj = Requirement(pk=requirement_id, **data)
                requirement_obj.save(**{
                    'creator': request.user,
                    'file': request.FILES})

                for parent in parent_set:
                    requirement_obj.requirement.add(parent)

                requirement_obj.post_save(editor=request.user, before=before_owner)
            except Http404, err:
                response.update_errors({'DBerror': err.message })
                return response.ajax_response()
            except IntegrityError as err:
                response.update_errors({'DBerror': err.args[1] })
                return response.ajax_response()

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
