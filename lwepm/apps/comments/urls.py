from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('lwepm.apps.comments.views',
    url(r'^comment_add/$', 'comment_add', name="comment_add"),
)
