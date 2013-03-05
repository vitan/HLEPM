from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('HLEPM.apps.track.views',
    url(r'^requirement/$', 'requirement', name="requirement"),
    url(r'^requirement/add/$', 'requirement_add', name="requirement_add"),
    url(r'^requirement/update/(?P<requirement_id>[\d]+)$',
        'requirement_update', name="requirement_update"),
    url(r'^project/$', 'project', name="project"),
    url(r'^risk/$', 'risk', name="risk"),
    url(r'^risk/add/$', 'risk_add', name="risk_add")
)
