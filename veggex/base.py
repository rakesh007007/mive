import sys
import datetime
import operator
from datetime import date, timedelta
import pytz
from django.db import transaction
from rest_framework.renderers import JSONRenderer
from django.db.models import Count, Min, Sum, Avg,F

from django.shortcuts import render
from django.shortcuts import render
from rest_framework import authentication
from rest_framework import permissions
import veggex.views
from django.contrib.auth.models import User as authUser
from veggex.serializers import *
from django.core import serializers as CoreSez

from django.template.response import TemplateResponse
from django.template import Context, loader
from django.http import HttpResponse
from django.contrib import sessions
from rest_framework import viewsets
#from buyold.quickstart import *
from django.middleware import csrf
from veggex.models import *
from mive.settings import *
from django.contrib.sessions.backends.db import SessionStore
from django.shortcuts import redirect
import json
import logging
from django.core.files.storage import default_storage
logger = logging.getLogger(__name__)
from django.core.files.base import ContentFile
#token wala masala

from rest_framework.authtoken.models import Token
from rest_framework.exceptions import ParseError
from rest_framework import status
 
from django.contrib.auth.models import make_password,check_password
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from veggex.serializers import ProductsByCategorySerializer
from rest_framework import generics