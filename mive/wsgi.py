"""
WSGI config for startup project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/howto/deployment/wsgi/
"""

import os
import sys
import site
site.addsitedir('/home/devrakx/Desktop/bkp/host/startup/env/lib/python2.7/site-packages')
sys.path.append('/home/devrakx/Desktop/bkp/host/startup/startup')
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mive.settings")

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
