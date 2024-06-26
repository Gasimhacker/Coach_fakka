"""blueprint for the views  """

from flask import Blueprint



app_views = Blueprint('app_views', __name__, url_prefix='/api/v1')

from api.v1.views.client import *
from api.v1.views.exercise import *
from api.v1.views.workout import *
from api.v1.views.coach import *