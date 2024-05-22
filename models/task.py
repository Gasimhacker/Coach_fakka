#!/usr/bin/python
""" holds class Task"""
from models.base_model import BaseModel, Base
import sqlalchemy
from sqlalchemy import Column, String, Integer, ForeignKey, Table
from sqlalchemy.orm import relationship

task_exercise = Table('task_exercise', Base.metadata,
                      Column('task_id', String(60),
                             ForeignKey('tasks.id', onupdate='CASCADE',
                                        ondelete='CASCADE'),
                             primary_key=True),
                      Column('exercise_id', String(60),
                             ForeignKey('exercises.id', onupdate='CASCADE',
                                        ondelete='CASCADE'),
                             primary_key=True),
                      Column('sets', Integer, nullable=False),
                      Column('rest_time', Integer, nullable=False),
                      Column('rips', Integer, nullable=False),
                      Column('rpe', Integer, nullable=False),
                      Column('warm_up', Boolean, nullable=False),
                      Column('weight', Integer, nullable=False),
                      Column('done', Boolean, nullable=False)
                      )


class Task(BaseModel, Base):
    """Representation of Task """
    __tablename__ = 'places'
    client_id = Column(String(60), ForeignKey('clients.id'), nullable=False)
    task_type = Column(String(256), nullable=False)
    exercises = relationship("Exercise",
                             secondary=task_exercise,
                             viewonly=False)
