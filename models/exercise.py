#!/usr/bin/python
""" holds class Exercise"""
from models.base_model import BaseModel, Base
import sqlalchemy
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship


class Exercise(BaseModel, Base):
    """Representation of Exercise """
    __tablename__ = 'exercises'
    description = Column(String(2048), nullable=False)
    link = Column(String(512), nullable=True)
    workout_exercises = relationship('WorkoutExercise', backref='exercise')

    def __init__(self, *args, **kwargs):
        """initializes Exercise"""
        super().__init__(*args, **kwargs)
