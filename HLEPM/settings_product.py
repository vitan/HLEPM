from settings.default import *

DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    # ('Your Name', 'your_email@example.com'),
)

MANAGERS = ADMINS

KRB5_REALM = "REDHAT.COM"

AUTHENTICATION_BACKENDS = (
    'HLEPM.apps.utils.backends.ModAuthKerbBackend',
)

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
MEDIA_ROOT = "/var/lib/HLEPM/"

# optional settings
ENGINEERING_SERVICES_URL = "https://engineering.redhat.com/hss-portal/products/"
DEV_MAILING_LIST = ""
BUGZILLA_URL = ""
USER_GUIDE = ""
