#!/usr/bin/env python

from django.http import HttpResponse, Http404
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.core.exceptions import PermissionDenied
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.views.decorators.http import require_POST
from django.contrib.auth.models import User

from HLEPM.apps.attachments.views import add_attachment
from HLEPM.apps.search.views import add_search_url_for_model, search
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
        'author_url': add_search_url_for_model(User),
        'author_field': 'username',
        'parent_types': RequirementType.objects.exclude(name__iexact='prd'),
        'parent_url': add_search_url_for_model(Attachment),
        #TODO (weizhou) Need to talk about parent input autocomplete.
        'parent_field': 'attachment_file',
    }

    return render_to_response(template_name, context_data, context_instance=RequestContext(request))


@require_POST
@login_required
def requirement_add(request):
    """Add a new requirements(BRD/MRD/PRD)."""

    response = AjaxResponseMixin()
    if request.method == 'POST':
        form = RequirementForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
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
