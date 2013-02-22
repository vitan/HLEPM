from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('HLEPM.apps.search.views',
    url(r'^search/(?P<app_label>[\w\-]+)/(?P<module_name>[\w\-]+)/', 'search', name="search"),
)
