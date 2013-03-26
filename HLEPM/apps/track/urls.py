from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('HLEPM.apps.track.views',
    url(r'^requirement/$', 'requirement.requirement', name="requirement"),
    url(r'^requirement/detail/(?P<pk>\d+)$', 'requirement.requirement_detail',
        name="requirement_detail"),
    url(r'^requirement/add/$', 'requirement.requirement_add', name="requirement_add"),
    url(r'^requirement/update/(?P<requirement_id>[\d]+)$',
        'requirement.requirement_update', name="requirement_update"),
    url(r'^risk/(?P<app_label>[\w\-]+)/(?P<module_name>[\w\-]+)/(?P<pk>\d+)/$', 'risk.risk', name="risk"),
    url(r'^risk/add/(?P<app_label>[\w\-]+)/(?P<module_name>[\w\-]+)/(?P<pk>\d+)/$', 'risk.risk_add', name="risk_add"),
    url(r'^risk/update/(?P<risk_id>[\d]+)$','risk.risk_update', name="risk_update"),
    url(r'^issue/(?P<app_label>[\w\-]+)/(?P<module_name>[\w\-]+)/(?P<pk>\d+)/$', 'issue.issue', name="issue"),
    url(r'^issue/add/(?P<app_label>[\w\-]+)/(?P<module_name>[\w\-]+)/(?P<pk>\d+)/$', 'issue.issue_add', name="issue_add"),
    url(r'^issue/update/(?P<issue_id>[\d]+)$','issue.issue_update', name="issue_update"),
)
