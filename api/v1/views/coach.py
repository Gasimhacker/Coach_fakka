#!/usr/bin/python3
"""client views module"""

from flask import jsonify, abort, request
from api.v1.views import app_views
from models import storage
from models.coach import Coach

coach_attrs = ['name', 'email', 'password']

@app_views.route('/coaches', methods=['POST'], strict_slashes=False)
def get_coach():
    """add new coach"""
    if not request.json:
        abort(400, 'Not a JSON')
    for attr in coach_attrs:
        if attr not in request.json:
            abort(400, f'Missing {attr} Attribute')
    coach = Coach(**request.json)
    coach.save()
    return jsonify(coach.to_dict()), 201

@app_views.route('/coaches/<coach_id>', methods=['GET', 'PUT', 'DELETE'], strict_slashes=False)
def coach_ctrl(coach_id):
    """get a coach or edit or delete"""
    if request.method == 'GET':
        coach = storage.get(Coach, coach_id)
        if coach is None:
            abort(404, "coach Not Found")
        return jsonify(coach.to_dict())

    if request.method == 'PUT':
        if not request.json:
            abort(400, 'Not a JSON')
        ignore = ['id', 'created_at', 'updated_at']
        data = request.json
        coach = storage.get(Coach, coach_id)
        if not coach:
            abort(404, "Coach Not found")
        for k, v in data.items():
            if k not in ignore:
                setattr(coach, k, v)
                coach.save()
        return jsonify(coach.to_dict()), 201

    if request.method == 'DELETE':
        coach = storage.get(Coach, coach_id)
        if coach is None:
            abort(404)
        storage.delete(coach)
        storage.save()
        return jsonify({}), 200
