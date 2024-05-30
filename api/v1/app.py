#!/usr/bin/python3
"""app for api"""
from models import storage
from flask import Flask, jsonify, make_response
from api.v1.views import app_views
from flask_cors import CORS


app = Flask(__name__)
app.register_blueprint(app_views)
cros = CORS(app, resources={r"app/v1/*": {"origins": "*"}})

@app.errorhandler(404)
def not_found(error):
    """error 404"""
    return make_response(jsonify({'error': 'Not found'}), 404)

@app.route('/api/v1/status', methods=['GET'], strict_slashes=False)
def status():
    """return status"""
    return jsonify({"status": "OK"})

@app.teardown_appcontext
def tearodown(error):
    """for now it will be lik airbnb"""
    storage.close()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True, threaded=True) 