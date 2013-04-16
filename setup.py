# -*- coding: utf-8 -*-

'''Setup for HLEPM project
'''

import os

from setuptools import setup, find_packages

def read(fname):
    filename = os.path.join(os.path.dirname(__file__), fname)
    return open(filename, 'r').read()

def get_version():
    VERSION_FILE = 'VERSION.txt'
    return read(VERSION_FILE).strip()

def get_install_requires():
    return [line.strip() for line in open('requirements.txt', 'r')]

setup(
    name='HLEPM',
    description='HLEPM is a highlight enterprise project management system.\
    author_email: weizhou@redhat.com, docai@redhat.com',
    author='weizhou, docai',
    author_email='weizhou@redhat.com',
    #url='https://engineering.redhat.com/trac/Treasury',
    version=get_version(),
    classifiers=[
        'Programming Language :: Python :: 2.6.8',
    ],

    packages = find_packages(),
    #django-threadedcomments is needed but not on pypi, please install it manually
    #'django-threadedcomments==0.9',
    include_package_data = True,
    install_requires=get_install_requires(),
)
