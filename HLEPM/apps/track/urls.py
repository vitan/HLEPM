from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('HLEPM.apps.track.views',
    url(r'^requirement/$', 'requirement.requirement', name="requirement"),
    url(r'^requirement/add/$', 'requirement.requirement_add', name="requirement_add"),
    url(r'^requirement/update/(?P<requirement_id>[\d]+)$',
        'requirement.requirement_update', name="requirement_update"),
    url(r'^risk/(?P<app_label>[\w\-]+)/(?P<module_name>[\w\-]+)/(?P<pk>\d+)/$', 'risk.risk', name="risk"),
    url(r'^risk/add/(?P<app_label>[\w\-]+)/(?P<module_name>[\w\-]+)/(?P<pk>\d+)/$', 'risk.risk_add', name="risk_add"),
    url(r'^risk/update/(?P<risk_id>[\d]+)$',
        'risk.risk_update', name="risk_update"),
)
