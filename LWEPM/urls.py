from django.conf.urls.defaults import patterns, include, url
from django.views.generic.simple import redirect_to
from django.conf import settings
from django.conf.urls.static import static

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', redirect_to, {'url': '/track/requirement/'}),
    url(r'^track/', include('LWEPM.apps.track.urls')),
    url(r'^search/', include('LWEPM.apps.search.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^comments/', include('LWEPM.apps.comments.urls')),
) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
