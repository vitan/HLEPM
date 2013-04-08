from settings import *

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


# optional settings
ENGINEERING_SERVICES_URL = "https://engineering.redhat.com/hss-portal/products/"
DEV_MAILING_LIST = ""
BUGZILLA_URL = ""
USER_GUIDE = ""
