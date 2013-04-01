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
from HLEPM.apps.track.models import Requirement
from HLEPM.apps.track.models import Issue
from HLEPM.apps.track.forms import IssueForm


__all__ = (
    'issue',
    'issue_add',
    'issue_update',
)
#The following is a test function now, will improve it later.
@login_required
def issue(request, app_label, module_name, pk,
          template_name='track/issue/issue-list.html'):
    content_type = ContentType.objects.get(app_label=app_label, model=module_name)
    context_data = {
        'requirement': Requirement.objects.get(pk=pk),
        'reporter_url': add_search_url_for_model(User),
        'reports':Issue.objects.filter(content_type=content_type, object_id=pk),
        }
    response = AjaxResponseMixin()
    issue_detail_html = render_to_string(template_name,
                                         context_data,
                                         context_instance=RequestContext(request))
    issue_detail_data = {'detail': issue_detail_html}
    return response.ajax_response(issue_detail_data)


@require_http_methods(['GET', 'POST'])
@login_required
def issue_add(request, app_label, module_name, pk, template_name='track/issue/one-issue.html'):
    content_type = ContentType.objects.get(app_label=app_label, model=module_name)
    bind_object_data = {'content_type': content_type, 'object_id': pk}
    response = AjaxResponseMixin()
    if request.method == 'POST':
        form = IssueForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            data.update(bind_object_data)
            issue_obj = Issue(**data)
            issue_obj.save()
            new_issue_html = render_to_string(template_name,
                                              {'report': issue_obj},
                                              context_instance=RequestContext(request))
            new_issue_data = {'new_issue': new_issue_html}
            return response.ajax_response(new_issue_data)
        else:
            template_name='track/issue/new-issue.html'
            error_new_issue_html = render_to_string(template_name,
                                                    {'form': form,
                                                     'reporter_url': add_search_url_for_model(User),
                                                     'app_label': app_label,
                                                     'module_name': module_name,
                                                     'pk': pk}, context_instance=RequestContext(request))
            error_new_issue_data = {'error_new_issue': error_new_issue_html}
            response.update_errors(error_new_issue_data)
            return response.ajax_response()
    elif request.method == 'GET':
        template_name = 'track/issue/new-issue.html'
        form = IssueForm()
        new_issue_form_html = render_to_string(template_name,
                                               {'form': form,
                                                'reporter_url': add_search_url_for_model(User),
                                                'start_date_id': 'issue_start_date',
                                                'target_date_id': 'issue_target_date',
                                                'app_label': app_label,
                                                'module_name': module_name,
                                                'pk': pk}, context_instance=RequestContext(request))
        new_issue_form_data = {'new_issue_form': new_issue_form_html}
        return response.ajax_response(new_issue_form_data)


@require_http_methods(['GET', 'POST'])
@login_required
def issue_update(request, issue_id, template_name='track/issue/update-issue.html'):
    if request.method == 'GET':
        response = AjaxResponseMixin()
        issue_obj = get_object_or_404(Issue, pk=issue_id)
        form = IssueForm(initial=issue_obj.get_form_initial())
        old_issue_html = render_to_string(template_name,{'report': issue_obj,
                                         'form': form,
                                         'reporter_url': add_search_url_for_model(User),
                                        },context_instance=RequestContext(request))

        old_issue_data = {'old_issue': old_issue_html}
        return response.ajax_response(old_issue_data)

    elif request.method == 'POST':
        response = AjaxResponseMixin()
        issue_obj = get_object_or_404(Issue, pk=issue_id)
        bind_object_data = {'content_type': issue_obj.content_type, 'object_id':issue_obj.object_id}
        form = IssueForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            data.update(bind_object_data)
            issue_obj = Issue(pk=issue_id, **data)
            issue_obj.save()
            new_template_name = 'track/issue/one-issue.html'
            new_issue_html = render_to_string(new_template_name,
                                              {'report': issue_obj},
                                              context_instance=RequestContext(request))
            new_issue_data = {'update_issue': new_issue_html}
            return response.ajax_response(new_issue_data)
        else:
            error_issue_html = render_to_string(template_name,{'report': issue_obj,
                                                'form': form,
                                                'reporter_url': add_search_url_for_model(User),
                                                },context_instance=RequestContext(request))
            error_issue_data = {'error_issue': error_issue_html}
            response.update_errors(error_issue_data)
            return response.ajax_response()
