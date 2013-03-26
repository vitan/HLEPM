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
from HLEPM.apps.track.models import Impact
from HLEPM.apps.track.models import Priority
from HLEPM.apps.track.models import Issue
from HLEPM.apps.track.forms import IssueForm
from HLEPM.apps.track.models import Mitigation
from HLEPM.apps.track.models import IssueStatus

__all__ = (
    'issue',
    'issue_add',
    'issue_update',
)
#The following is a test function now, will improve it later.
@login_required
def issue(request, app_label, module_name, pk, template_name='track/issue/issue.html'):
    content_type = ContentType.objects.get(app_label=app_label, model=module_name)
    context_data = {
        'subtitle': 'Issue',
        'requirement': Requirement.objects.get(pk=pk),
        'Impacts': Impact.objects.all(),
        'Priorities': Priority.objects.all(),
        'Mitigations': Mitigation.objects.all(),
        'statuss': IssueStatus.objects.all(),
        'reporter_url': add_search_url_for_model(User),
        'issues':Issue.objects.filter(content_type=content_type, object_id=pk),
        'app_label': app_label,
        'module_name': module_name,
        'pk': pk,
        }
    return render_to_response(template_name, context_data, context_instance=RequestContext(request))


@require_POST
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
            new_issue_html = render_to_string(template_name, {'issue': issue_obj})
            new_issue_data = {'new_issue': new_issue_html}
            return response.ajax_response(new_issue_data)
        else:
            template_name='track/issue/new-issue.html'
            error_new_issue_html = render_to_string(template_name,
                                                    {'form': form,
                                                     'Impacts': Impact.objects.all(),
                                                     'Priorities': Priority.objects.all(),
                                                     'Mitigations': Mitigation.objects.all(),
                                                     'statuss': IssueStatus.objects.all(),
                                                     'reporter_url': add_search_url_for_model(User),
                                                     'app_label': app_label,
                                                     'module_name': module_name,
                                                     'pk': pk}, context_instance=RequestContext(request))
            error_new_issue_data = {'error_new_issue': error_new_issue_html}
            response.update_errors(error_new_issue_data)
            return response.ajax_response()


@require_http_methods(['GET', 'POST'])
@login_required
def issue_update(request, issue_id, template_name='track/issue/update-issue.html'):
    if request.method == 'GET':
        response = AjaxResponseMixin()
        issue_obj = get_object_or_404(Issue, pk=issue_id)
        form = IssueForm(initial=issue_obj.get_form_initial())
        old_issue_html = render_to_string(template_name,{'issue': issue_obj,
                                         'form': form,
                                         'statuss': IssueStatus.objects.all(),
                                         'Impacts': Impact.objects.all(),
                                         'Priority': Priority.objects.all(),
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
            new_issue_html = render_to_string(new_template_name, {'issue': issue_obj})
            new_issue_data = {'update_issue': new_issue_html}
        return response.ajax_response(new_issue_data)
