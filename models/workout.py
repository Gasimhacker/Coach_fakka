#!/usr/bin/python
""" holds class Workout"""
from models.base_model import BaseModel, Base
import sqlalchemy
from sqlalchemy import Column, String, Integer, Boolean, ForeignKey, Table
from sqlalchemy.orm import relationship


class WorkoutExercise(Base):
    """Representation of WorkoutExercise"""
    __tablename__ = 'workout_exercises'
    workout_id = Column(String(60),
                        ForeignKey('workouts.id',
                                   onupdate='CASCADE', ondelete='CASCADE'),
                        primary_key=True)
    exercise_id = Column(String(60),
                         ForeignKey('exercises.id',
                                    onupdate='CASCADE', ondelete='CASCADE'),
                         primary_key=True)
    sets = Column(Integer, nullable=False)
    rest_time = Column(Integer, nullable=False)
    rips = Column(Integer, nullable=False)
    rpe = Column(Integer, nullable=False)
    warm_up = Column(Boolean, nullable=False)
    weight = Column(Integer, nullable=False)
    done = Column(Boolean, nullable=False, default=False)

    created_at = BaseModel.created_at
    updated_at = BaseModel.updated_at
    __str__ = BaseModel.__str__
    save = BaseModel.save
    to_dict = BaseModel.to_dict
    delete = BaseModel.delete


class Workout(BaseModel, Base):
    """Representation of Workout """
    __tablename__ = 'workouts'
    client_id = Column(String(60), ForeignKey('clients.id'), nullable=False)
    number_exercises = Column(Integer, nullable=False, default=0)
    note = Column(String(1028))
    done = Column(Boolean, nullable=False, default=False)
    exercises = relationship("WorkoutExercise", backref='workout',
                             cascade='all, delete, delete-orphan')
