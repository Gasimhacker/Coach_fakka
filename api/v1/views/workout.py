#!/usr/bin/python3
"""workout view"""
from flask import Flask, jsonify, abort, request
from api.v1.views import app_views
from models import storage
from models.client import Client
from models.workout import Workout


Workout_attr = ['name', 'note', 'done']

@app_views.route('/<client_id>/workouts', methods=['GET', 'POST'], strict_slashes=False)
def add_workout(client_id):
    """add a workout to a client and get all worout for the client"""
    if request.method == 'GET':
        client = storage.get(Client, client_id)
        if client is None:
            abort(404, "Client Not Found")
        return jsonify([workout.to_dict() for workout in client.workouts])
    
    if request.method == 'POST':
        if not request.json:
            abort(400, 'Not a JSON')
        for attr in Workout_attr:
            if attr not in request.json:
                abort(400, f'Missing <{attr}> Attribute')
        workout = Workout(**request.json)
        workout.client_id = client_id
        workout.save()
        return jsonify(workout.to_dict()), 201

@app_views.route('/<client_id>/workouts/done', methods=['GET'], strict_slashes=False)
def done_workout(client_id):
    """get all done workouts"""
    client = storage.get(Client, client_id)
    if client is None:
        abort(404, "Client Not Found")
    return jsonify([workout.to_dict() for workout in client.workouts if workout.done])

@app_views.route('/<client_id>/workouts/todo', methods=['GET'], strict_slashes=False)
def todo_workout(client_id):
    """get all todo workouts"""
    client = storage.get(Client, client_id)
    if client is None:
        abort(404, "Client Not Found")
    return jsonify([workout.to_dict() for workout in client.workout if not workout.done])

@app_views.route('/<client_id>/workouts/<workout_id>', methods=['GET', 'PUT', 'DELETE'], strict_slashes=False)
def workout_ctrl(client_id, workout_id):
    """get a workout"""
    if request.method == 'GET':
        client = storage.get(Client, client_id)
        if client is None:
            abort(404, "Client Not Found")
        workout_list = client.workout
        for work in workout_list:
            if work.id == workout_id:
                workout = work
                return jsonify(workout.to_dict())
        abort(404)

    if request.method == 'PUT':
        if not request.json:
            abort(400, 'Not a JSON')
        client = storage.get(Client, client_id)
        if client is None:
            abort(404, "Client Not Found")
        workout_list = client.workout
        for work in workout_list:
            if work.id == workout_id:
                for k, v in request.json.items():
                    setattr(work, k, v)
                return jsonify(workout.to_dict()), 201
        abort(404)
    
    if request.method == 'DELETE':
        workout = storage.get(Workout, workout_id)
        if workout is None:
            abort(404, "Workout Not Found")
        workout_list = client.workout
        for work in workout_list:
            if work.id == workout_id:
                workout = work
                storage.delete(workout)
                storage.save()
                return jsonify({}), 200
        abort(404, "Workout Not Found in Client's Workouts")
