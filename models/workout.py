#!/usr/bin/python
""" holds class Workout"""
from models.base_model import BaseModel, Base
from datetime import datetime
import sqlalchemy
from sqlalchemy import Column, String, Integer, Boolean, ForeignKey, Table
from sqlalchemy.orm import relationship, backref


class WorkoutExercise(Base):
    """Representation of WorkoutExercise"""
    __tablename__ = 'workout_exercises'
    workout_id = Column(String(60),
                        ForeignKey('workouts.id'), primary_key=True)
    exercise_id = Column(String(60),
                         ForeignKey('exercises.id'), primary_key=True)
    sets = Column(Integer, nullable=False)
    rest_time = Column(Integer, nullable=False)
    rips = Column(Integer, nullable=False)
    rpe = Column(Integer, nullable=False)
    warm_up = Column(Boolean, nullable=False)
    weight = Column(Integer, nullable=False)
    done = Column(Boolean, nullable=False, default=False)
    exercise = relationship('Exercise', backref=backref('workout_exercises',
                            cascade='all, delete, delete-orphan'))
    workout = relationship("Workout", backref=backref('exercises',
                           cascade='all, delete, delete-orphan'))

    def __init__(self, *args, **kwargs):
        """Initialization of the base model"""
        if kwargs:
            for key, value in kwargs.items():
                if key != "__class__":
                    setattr(self, key, value)
            if kwargs.get("created_at", None) and type(self.created_at) is str:
                self.created_at = datetime.strptime(kwargs["created_at"], time)
            else:
                self.created_at = datetime.utcnow()
            if kwargs.get("updated_at", None) and type(self.updated_at) is str:
                self.updated_at = datetime.strptime(kwargs["updated_at"], time)
            else:
                self.updated_at = datetime.utcnow()

    def __str__(self):
        """String representation of the BaseModel class"""
        we_id = f'{self.workout_id}.{self.exercise_id}'
        return "[{:s}] ({:s}) {}".format(self.__class__.__name__, we_id,
                                         self.__dict__)
    created_at = BaseModel.created_at
    updated_at = BaseModel.updated_at
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
