from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('HLEPM.apps.search.views',
    url(r'^requirement/', 'requirement_search', name="requirement_search"),
)
