#!/usr/bin/env python

from django.db.models.loading import get_model
from django.shortcuts import get_object_or_404
from django.http import HttpResponse, Http404
from django.contrib.auth.decorators import login_required
from django.template import loader, RequestContext
from django.core.exceptions import ObjectDoesNotExist, PermissionDenied
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.core.urlresolvers import reverse
from django.views.decorators.http import require_GET
from django.contrib.auth.models import User

from HLEPM.apps.common.views import AjaxResponseMixin


__all__ = (
    'QueryKeywordsMap',
    'add_search_url_for_model',
    'search',
)


class QueryKeywordsMap:
    """Here recorded the query-keywords/symbols map between frontend and django.

    The Map will be built up as the development progressing.
    """
    Map = {
        'like': '__icontains',
        '=': '',
        'has': '__in',
    }


def add_search_url_for_model(model, template_name=''):
    kwargs = {
            'app_label': model._meta.app_label,
            'module_name': model._meta.module_name,
            'template_name': template_name
    }
    return reverse('search', kwargs = kwargs)


@require_GET
@login_required
def search(request, app_label, module_name, template_name):
    """Return a JSON data or a piece of HTML-wrapper data of that for frontend ajax search."""

    response = AjaxResponseMixin()
    if request.method == "GET":
        model = get_model(app_label, module_name)
        if model is None:
            return

        # TODO (weizhou) expected performance optimization. refer: memory_cache.
        filter = request.GET.get('filters', '')
        order_fields = request.GET.get('orders', '')
        if order_fields:
            order_fields = order_fields.split(',')
        filter_kwargs = generate_filter(filter)
        data = model.objects.filter(**filter_kwargs).order_by(*order_fields)

        if template_name:
            num_per_page = request.GET.get('num_per_page', 20)
            paginator = Paginator(data, num_per_page)
            try:
                page = int(request.GET.get('page', '1'))
            except ValueError:
                page = 1

            try:
                reports = paginator.page(page)
            except (EmptyPage, InvalidPage):
                reports = paginator.page(paginator.num_pages)

            template = loader.get_template(template_name)
            request_context = RequestContext(request, {'reports': reports })
            data = template.render(request_context)
        else:
            select_fields = request.GET.get('select_fields', '').split(',')
            data = list(data.values(*select_fields))


        context = { 'query_result': data }
        return response.ajax_response(**context)

    else:
        pass


def generate_filter(filter_str):
    """Cleaned up the frontend filter string to be django-readable data."""

    result = {}
    for item in filter_str.split(','):
        if item:
            query = item.split('#')
            query[1] = QueryKeywordsMap.Map.get(query[1], '')
            filter = ''.join(query[:2])
            result[filter] = query[2]

    return result
