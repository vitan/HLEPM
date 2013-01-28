from django.conf.urls.defaults import patterns, include, url

from HLEPM.apps.search.views import requirement_search


urlpatterns = patterns('',
    url(r'^requirement/', requirement_search, name="requirement_search"),
)
