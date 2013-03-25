from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('HLEPM.apps.search.views',
    url(r'^(?P<app_label>[\w\-]+)/(?P<module_name>[\w\-]+)/(?P<template_name>([\w]{0}|[\w\-/]+\.html?))$', 'search', name="search"),
)
