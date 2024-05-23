"""client views module"""

from flask import Flask, jsonify, abort, request
from api.v1.views import app_views
from models import storage
from models.client import Client
from models.workout import Workout

@app_views.route('/<coach_id>/clients', methods=['GET', 'POST'], strict_slashes=False)
def get_clints(coach_id):
    """get all clients"""
    if request.method == 'GET':
        clients = storage.all(Client, coach_id)
        return jsonify([client.to_dict() for client in clients.values()])
    if request.method == 'POST':
        if not request.json:
            abort(400, 'Not a JSON')
        if 'name' not in request.json:
            abort(400, 'Missing name')
        client = Client(**request.json)
        client.coach_id = coach_id
        client.save()
        return jsonify(client.to_dict()), 201

@app_views.route('/clients/<client_id>', methods=['GET', 'PUT', 'DELETE'], strict_slashes=False)
def get_client(client_id):
    """get a client"""
    if request.method == 'GET':
        client = storage.get(Client, client_id)
        if client is None:
            abort(404)
        return jsonify(client.to_dict())
    if request.method == 'PUT':
        if not request.json:
            abort(400, 'Not a JSON')
        client = storage.get(Client, client_id)
        client(**request.json).save()
        return jsonify(client.to_dict()), 201
    if request.method == 'DELETE':
        client = storage.get(Client, client_id)
        if client is None:
            abort(404)
        storage.delete(client)
        storage.save()
        return jsonify({}), 200
