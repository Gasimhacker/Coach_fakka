#!/usr/bin/python3
"""client views module"""

from flask import Flask, jsonify, abort, request
from api.v1.views import app_views
from models import storage
from models.client import Client
from models.coach import Coach
from models.workout import Workout

client_attrs = ['email', 'age', 'gender', 'weight', 'height',
                'goal_weight', 'training_place', 'training_days',
                'training_hours', 'activity_level', 'need_supplements',
                'injury_history']

@app_views.route('/<coach_id>/clients', methods=['GET', 'POST'], strict_slashes=False)
def get_clints(coach_id):
    """get all clients"""
    if request.method == 'GET':
        coach = storage.get(Coach, coach_id)
        if coach is None:
            abort(404, "Coach Not found")
        clients = storage.all(Client)
        return jsonify([client.to_dict() for client in clients.values()])

    if request.method == 'POST':
        coach = storage.get(Coach, coach_id)
        if coach is None:
            abort(404, "Coach Not found")
        if not request.json:
            abort(400, 'Not a JSON')
        for attr in client_attrs:
            if attr not in request.json:
                abort(400, 'Missing Attribute')
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
        ignore = ['id', 'created_at', 'updated_at']
        data = request.json
        client = storage.get(Client, client_id)
        if not client:
            abort(404, "Client Not found")
        for k, v in data.items():
            if k not in ignore:
                setattr(client, k, v)
                client.save()
        return jsonify(client.to_dict()), 201

    if request.method == 'DELETE':
        client = storage.get(Client, client_id)
        if client is None:
            abort(404)
        storage.delete(client)
        storage.save()
        return jsonify({}), 200
