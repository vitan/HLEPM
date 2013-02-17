from django.conf.urls.defaults import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'hlepm.views.home', name='home'),
    # url(r'^hlepm/', include('hlepm.foo.urls')),
    url(r'^search/', include('HLEPM.apps.search.urls')),
    url(r'^track/', include('HLEPM.apps.track.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
