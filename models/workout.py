#!/usr/bin/python
""" holds class Workout"""
from models.base_model import BaseModel, Base
import sqlalchemy
from sqlalchemy import Column, String, Integer, Boolean, ForeignKey, Table
from sqlalchemy.orm import relationship

workout_exercise = Table('workout_exercise', Base.metadata,
                      Column('workout_id', String(60),
                             ForeignKey('workouts.id', onupdate='CASCADE',
                                        ondelete='CASCADE'),
                             primary_key=True),
                      Column('exercise_id', String(60),
                             ForeignKey('exercises.id', onupdate='CASCADE',
                                        ondelete='CASCADE'),
                             primary_key=True),
                      Column('name', String(256), nullable=False)
                      Column('sets', Integer, nullable=False),
                      Column('rest_time', Integer, nullable=False),
                      Column('rips', Integer, nullable=False),
                      Column('rpe', Integer, nullable=False),
                      Column('warm_up', Boolean, nullable=False),
                      Column('weight', Integer, nullable=False),
                      Column('done', Boolean, nullable=False, default=False)
                      )


class Workout(BaseModel, Base):
    """Representation of Workout """
    __tablename__ = 'workouts'
    client_id = Column(String(60), ForeignKey('clients.id'), nullable=False)
    number_exercises = Column(Integer, nullable=False, default=0)
    note = Column(String(1028))
    done = Column(Boolean, nullable=False, default=False)
    exercises = relationship("Exercise",
                             secondary=workout_exercise,
                             viewonly=False)
