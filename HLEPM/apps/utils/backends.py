# -*- coding: utf-8 -*-
from django.conf import settings
from django.contrib.auth.backends import RemoteUserBackend

from django.contrib.auth.models import User


class ModAuthKerbBackend(RemoteUserBackend):
    """
    mod_auth_kerb modules authorization backend for HLEPM.
    Based on DjangoRemoteUser backend.

    Required correct /etc/krb5.conf, /etc/krb5.keytab and
    Correct mod_auth_krb5 module settings for apache.

    Example apache settings:

    # Set a httpd config to protect krb5login page with kerberos.
    # You need to have mod_auth_kerb installed to use kerberos auth.
    # Httpd config /etc/httpd/conf.d/<project>.conf should look like this:

    <Location "/">
        SetHandler python-program
        PythonHandler django.core.handlers.modpython
        SetEnv DJANGO_SETTINGS_MODULE <project>.settings
        PythonDebug On
    </Location>

    <Location "/auth/krb5login">
        AuthType Kerberos
        AuthName "<project> Kerberos Authentication"
        KrbMethodNegotiate on
        KrbMethodK5Passwd off
        KrbServiceName HTTP
        KrbAuthRealms EXAMPLE.COM
        Krb5Keytab /etc/httpd/conf/http.<hostname>.keytab
        KrbSaveCredentials off
        Require valid-user
    </Location>
    """

    def authenticate(self, remote_user):
        """
        Override of RemoteUserBackend.authenticate().
        """
        if not remote_user:
            return
        user = None
        username = self.clean_username(remote_user)

        # Note that this could be accomplished in one try-except clause, but
        # instead we use get_or_create when creating unknown users since it has
        # built-in safeguards for multiple threads.
        if self.create_unknown_user:
            user, created = User.objects.get_or_create(username=username,
                                                       email=remote_user)
            if created:
                user = self.configure_user(user)
        else:
            try:
                user = User.objects.get(username=username)
            except User.DoesNotExist:
                pass
        return user

    def configure_user(self, user):
        """
        Configures a user after creation and returns the updated user.

        By default, returns the user unmodified.
        """
        return user

    def clean_username(self, username):
        """
        Performs any cleaning on the "username" prior to using it to get or

        create the user object.  Returns the cleaned username.
        For more info, reference clean_username function in
        django/auth/backends.py
        """
        return username.replace('@' + settings.KRB5_REALM, '')
