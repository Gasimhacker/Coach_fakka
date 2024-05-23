#!/usr/bin/python3
""" holds class Coach"""

import models
from models.base_model import BaseModel, Base
import sqlalchemy
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship
from hashlib import md5


class Coach(BaseModel, Base):
    """Representation of a coach """
    __tablename__ = 'coaches'
    email = Column(String(128), nullable=False)
    password = Column(String(128), nullable=False)
    clients = relationship("Client", backref="coach")

    def __init__(self, *args, **kwargs):
        """initializes coach"""
        super().__init__(*args, **kwargs)

    def __setattr__(self, name, value):
        """sets a password with md5 encryption"""
        if name == "password":
            value = md5(value.encode()).hexdigest()
        super().__setattr__(name, value)
