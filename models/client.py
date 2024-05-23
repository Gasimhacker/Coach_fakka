#!/usr/bin/python3
""" holds class Client"""
from models.base_model import BaseModel, Base
import sqlalchemy
from sqlalchemy import Column, String, Integer, Float, Boolean, ForeignKey
from sqlalchemy.orm import relationship


class Client(BaseModel, Base):
    """Representation of client """
    __tablename__ = 'clients'
    coach_id = Column(String(60), ForeignKey('coaches.id'), nullable=False)
    email = Column(String(255), nullable=False)
    age = Column(Integer, nullable=False)
    gender = Column(String(64), nullable=False)
    weight = Column(Float, nullable=False)
    height = Column(Float, nullable=False)
    goal_weight = Column(Float, nullable=False)
    training_place = Column(String(64), nullable=False)
    training_days = Column(Integer, nullable=False)
    training_hours = Column(Integer, nullable=False)
    activity_level = Column(Integer, nullable=False)
    need_supplements = Column(Boolean, nullable=False)
    injury_history = Column(String(1024), nullable=True)
    workouts = relationship("Workout",
                         backref="client",
                         cascade="all, delete, delete-orphan")

    def __init__(self, *args, **kwargs):
        """initializes client"""
        super().__init__(*args, **kwargs)
