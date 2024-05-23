from flask import Flask, jsonify, abort, request
from api.v1.views import app_views
from models import storage
from models.client import Client
from models.workout import Workout
from models.exercise import Exercise

@app_views.route('/<workout_id>/workout_exercises', methode=['GET'], strict_slashes=False)
def get_workout_exercises(workout_id):
    """get all exercises for a workout"""
    workout = storage.get(Workout, workout_id)
    if workout is None:
        abort(404)
    return jsonify([exercise.to_dict() for exercise in workout.exercises])

@app_views.route('/<coach_id>/exercises', methode=['GET', 'POST'], strict_slashes=False)
def coach_exercise(coach_id):
    """get all exercises for a coach and create a new exercise"""
    if request.method == 'GET':
        exercises = storage.all(Exercise)
        return jsonify([exercise.to_dict() for exercise in exercises.values()])

    if request.method == 'POST':
        if not request.json:
            abort(400, 'Not a JSON')
        if 'name' not in request.json:
            abort(400, 'Missing name')
        exercise = Exercise(**request.json)
        exercise.save()
        return jsonify(exercise.to_dict()), 201

@app_views.route('/<workout_id>/workout_exercises/<exercise_id>', methods=['GET', 'POST', 'PUT', 'DELETE'], strict_slashes=False)
def workout_exercise_ctrl(workout_id, exercise_id):
    if request.method == 'GET':
        workout = storage.get(Workout, workout_id)
        if workout is None:
            abort(404)
        exercise_list = workout.exercises
        for exercise in exercise_list:
            if exercise.id == exercise_id:
                return jsonify(exercise.to_dict())
        abort(404)
    if request.method == 'POST':
        if not request.json:
            abort(400, 'Not a JSON')
        if 'name' not in request.json:
            abort(400, 'Missing name')
        exercise = Exercise(**request.json) # check if this is correct
        exercise.save()
        return jsonify(exercise.to_dict()), 201
    
    if request.methode == 'PUT':
        if not request.json:
            abort(400, 'Not a JSON')
        exercise = storage.get(Exercise, exercise_id)
        if exercise is None:
            abort(404)
        for key, value in request.json.items():
            setattr(exercise, key, value)
        exercise.save()
        return jsonify(exercise.to_dict()), 200
    
    if request.methode == 'DELETE':
        exercise = storage.get(Exercise, exercise_id)
        if exercise is None:
            abort(404)
        storage.delete(exercise)
        storage.save()
        return jsonify({}), 200

    