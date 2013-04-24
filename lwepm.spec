%{!?python_sitelib: %global python_sitelib %(%{__python} -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")}
%define srcname lwepm
%define version 1.0.0
%define release 5

Summary:       LWEPM is a light-weight enterprise project management system.
Name:          python-%{srcname}
Version:       %{version}
Release:       %{release}
URL:           http://code.engineering.redhat.com/gerrit/gitweb?p=HLEPM.git
Source0:       %{srcname}-%{version}.tar.gz
License:       GPLv3
Group:         Development/Libraries
BuildRoot:     %{_tmppath}/%{srcname}-%{version}-%{release}-buildroot
Prefix:        %{_prefix}
BuildArch:     noarch
Vendor:        weizhou <weizhou@redhat.com>, docai <docai@redhat.com>

BuildRequires: python-setuptools

Requires:      Django == 1.4.3
Requires:      MySQL-python >= 1.2.3
Requires:      django-threadedcomments == 0.9
Requires:      django-widget-tweaks == 1.3
Requires:      python-krbcontext >= 0.2.1
Requires:      kobo >= 0.3.6
Requires:      python-kerberos >= 1.1
Requires:      mod_wsgi >= 3.3

%description
LWEPM is a light-weight enterprise project management system

%prep
%setup -q -n %{srcname}-%{version}

%build
%{__python} setup.py build

%install
rm -rf $RPM_BUILD_ROOT
%{__python} setup.py install -O1 --root=$RPM_BUILD_ROOT
mkdir -p ${RPM_BUILD_ROOT}%{_datadir}/%{srcname}
mkdir -p ${RPM_BUILD_ROOT}%{_docdir}/%{srcname}

data_dirs="%{srcname}/fixtures"
for d in ${data_dirs}
do
    cp -R ${d} ${RPM_BUILD_ROOT}%{_datadir}/%{srcname}
done

dir_to_remove="fixtures"
for dir in ${dir_to_remove}
do
    rm -rf ${RPM_BUILD_ROOT}%{python_sitelib}/%{srcname}/${dir}
done

#Install apache config for the app:
install -m 0644 -D -p conf/%{srcname}-httpd.conf ${RPM_BUILD_ROOT}%{_sysconfdir}/httpd/conf.d/%{srcname}.conf

#create dir for media
mkdir -p ${RPM_BUILD_ROOT}%{_localstatedir}/lib/%{srcname}

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%doc README.md requirements.txt
%{_datadir}/%{srcname}/
%attr(0755, apache, apache) %{_localstatedir}/lib/%{srcname}
%{python_sitelib}/%{srcname}/
%{python_sitelib}/%{srcname}*.egg-info
%config(noreplace) %{_sysconfdir}/httpd/conf.d/%{srcname}.conf
