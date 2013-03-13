#!/usr/bin/env python

from django.shortcuts import render_to_response
from django.template import RequestContext, loader, Context


__all__ = (
    'project',
)


def project(request, template_name='track/project/project.html'):

    context_data = {}

    return render_to_response(template_name, context_data, context_instance=RequestContext(request))
