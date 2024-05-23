"""app for api"""

from flask import Flask, jsonify, make_response
from api.v1.views import app_views
from flask_cors import CORS


app = flask(__name__)
cros = CORS(app, resources={r"app/v1/*": {"origins": "*"}})

@app_views.errorhandler(404)
def not_found(error):
    """error 404"""
    return make_response(jsonify({'error': 'Not found'}), 404)

# @app_views.teardown_appcontext(error)
# def tearodown(error):
#     """for now it will be lik airbnb"""
#     storage.close()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True) 