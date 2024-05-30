#!/usr/bin/python3
from flask import Flask, jsonify, abort, request
from api.v1.views import app_views
from models import storage
from models.coach import Coach
from models.workout import Workout, WorkoutExercise
from models.exercise import Exercise

exercise_attr = ['name',  'description']
WorkoutExercise_attr = ['workout_id', 'exercise_id', 'sets', 'rips',
                        'weight', 'rest_time', 'rpe', 'warm_up', 'done']
@app_views.route('/<workout_id>/workout_exercises', methods=['GET'], strict_slashes=False)
def get_workout_exercises(workout_id):
    """get all exercises for a workout"""
    workout = storage.get(Workout, workout_id)
    if workout is None:
        abort(404)
    return jsonify([exercise.to_dict() for exercise in workout.exercises])

@app_views.route('/<coach_id>/exercises', methods=['GET', 'POST'], strict_slashes=False)
def coach_exercise(coach_id):
    """get all exercises for a coach and create a new exercise"""
    if request.method == 'GET':
        if storage.get(Coach, coach_id) is None:
            abort(404, "Coach Not Found")
        exercises = storage.all(Exercise)
        return jsonify([exercise.to_dict() for exercise in exercises.values()])

    if request.method == 'POST':
        if storage.get(Coach, coach_id) is None:
            abort(404, "Coach Not Found")
        if not request.json:
            abort(400, 'Not a JSON')
        for attr in exercise_attr:
            if attr not in request.json.keys():
                abort(400, f'Missing Attribute {attr}')
        exercise = Exercise(**request.json)
        exercise.save()
        return jsonify(exercise.to_dict()), 201

@app_views.route('/<workout_id>/workout_exercises/<exercise_id>', methods=['GET', 'POST', 'PUT', 'DELETE'], strict_slashes=False)
def workout_exercise_ctrl(workout_id, exercise_id):
    """ add get or delete or put values to workout_exercises table"""
    if request.method == 'GET':
        workout = storage.get(Workout, workout_id)
        if workout is None:
            abort(404)
        exercise_list = workout.exercises
        for exercise in exercise_list:
            if exercise.exercise_id == exercise_id:
                return jsonify(exercise.to_dict())
        abort(404)

    if request.method == 'POST':
        if not request.json:
            abort(400, 'Not a JSON')
        for attr in WorkoutExercise_attr:
            if attr not in request.json.keys():
                abort(400, f'Missing Attribute {attr}')
        exercise = WorkoutExercise(**request.json)
        exercise.save()
        return jsonify(exercise.to_dict()), 201
    
    if request.method == 'PUT':
        if not request.json:
            abort(400, 'Not a JSON')
        workout = storage.get(Workout, workout_id)
        if workout is None:
            abort(404)
        ignore = ['id', 'created_at', 'updated_at']
        workout_exercise = workout.exercises
        for work_exec in workout_exercise:
            if work_exec.exercise_id == exercise_id:
                exercise = work_exec
        if exercise is None:
            abort(404, 'exercise not found in this workout')
        for key, value in request.json.items():
            if key not in ignore:
                setattr(exercise, key, value)
        exercise.save()
        return jsonify(exercise.to_dict()), 200
    
    if request.method == 'DELETE':
        workout = storage.get(Workout, workout_id)
        if workout is None:
            abort(404)
        workout_exercise = workout.exercises
        for work_exec in workout_exercise:
            if work_exec.exercise_id == exercise_id:
                exercise = work_exec
        storage.delete(exercise)
        storage.save()
        return jsonify({}), 200
