from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('HLEPM.apps.track.views',
    url(r'^requirement/$', 'requirement', name="requirement"),
    url(r'^requirement/add/$', 'requirement_add', name="requirement_add"),
)
