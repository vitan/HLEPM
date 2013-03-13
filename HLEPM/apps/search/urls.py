from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('HLEPM.apps.search.views',
    url(r'^(?P<app_label>track)/(?P<module_name>requirement)/', 'search',\
        {'template_name':'track/requirement/requirement-table.html'}, name="search"),
    url(r'^(?P<app_label>[\w\-]+)/(?P<module_name>[\w\-]+)/', 'search', name="search"),
)
