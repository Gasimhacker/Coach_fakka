#!/usr/bin/python3
"""
Contains the TestCoachDocs classes
"""

from datetime import datetime
import inspect
import models
from models import coach
from models.base_model import BaseModel
import pep8
import unittest
Coach = coach.Coach
members = inspect.getmembers(Coach, inspect.isfunction)


class TestCoachDocs(unittest.TestCase):
    """Tests to check the documentation and style of Coach class"""

    def test_pep8_conformance_coach(self):
        """Test that models/coach.py conforms to PEP8."""
        pep8s = pep8.StyleGuide(quiet=True)
        result = pep8s.check_files(['models/coach.py'])
        self.assertEqual(result.total_errors, 0,
                         "Found code style errors (and warnings).")

    def test_pep8_conformance_test_coach(self):
        """Test that tests/test_models/test_coach.py conforms to PEP8."""
        pep8s = pep8.StyleGuide(quiet=True)
        result = pep8s.check_files(['tests/test_models/test_coach.py'])
        self.assertEqual(result.total_errors, 0,
                         "Found code style errors (and warnings).")

    def test_coach_module_docstring(self):
        """Test for the coach.py module docstring"""
        self.assertIsNot(coach.__doc__, None,
                         "coach.py needs a docstring")
        self.assertTrue(len(coach.__doc__) >= 1,
                        "coach.py needs a docstring")

    def test_coach_class_docstring(self):
        """Test for the Coach class docstring"""
        self.assertIsNot(Coach.__doc__, None,
                         "Coach class needs a docstring")
        self.assertTrue(len(Coach.__doc__) >= 1,
                        "Coach class needs a docstring")

    def test_coach_func_docstrings(self):
        """Test for the presence of docstrings in Coach methods"""
        for func in members:
            self.assertIsNot(func[1].__doc__, None,
                             "{:s} method needs a docstring".format(func[0]))
            self.assertTrue(len(func[1].__doc__) >= 1,
                            "{:s} method needs a docstring".format(func[0]))


class TestCoach(unittest.TestCase):
    """Test the Coach class"""
    def test_is_subclass(self):
        """Test that Coach is a subclass of BaseModel"""
        dic = {'name': "Mohamed", 'email': "mohamed@gmail.com",
               'password': "hackme"}
        coach = Coach(**dic)
        self.assertIsInstance(coach, BaseModel)
        self.assertTrue(hasattr(coach, "id"))
        self.assertTrue(hasattr(coach, "created_at"))
        self.assertTrue(hasattr(coach, "updated_at"))
        self.assertTrue(hasattr(coach, "name"))

    def test_required_attrs(self):
        """Test that Coach has attributes name, email, and password"""
        coach = Coach()
        self.assertTrue(hasattr(coach, "name"))
        self.assertTrue(hasattr(coach, "email"))
        self.assertTrue(hasattr(coach, "password"))
        self.assertEqual(coach.name, None)
        self.assertEqual(coach.email, None)
        self.assertEqual(coach.password, None)

    def test_to_dict_creates_dict(self):
        """test to_dict method creates a dictionary with proper attrs"""
        s = Coach()
        new_d = s.to_dict()
        self.assertEqual(type(new_d), dict)
        self.assertFalse("_sa_instance_coach" in new_d)
        for attr in s.__dict__:
            if attr != "_sa_instance_state":
                self.assertTrue(attr in new_d)
        self.assertTrue("__class__" in new_d)

    def test_to_dict_values(self):
        """test that values in dict returned from to_dict are correct"""
        t_format = "%Y-%m-%dT%H:%M:%S.%f"
        s = Coach()
        new_d = s.to_dict()
        self.assertEqual(new_d["__class__"], "Coach")
        self.assertEqual(type(new_d["created_at"]), str)
        self.assertEqual(type(new_d["updated_at"]), str)
        self.assertEqual(new_d["created_at"], s.created_at.strftime(t_format))
        self.assertEqual(new_d["updated_at"], s.updated_at.strftime(t_format))

    def test_str(self):
        """test that the str method has the correct output"""
        coach = Coach()
        string = "[Coach] ({}) {}".format(coach.id, coach.__dict__)
        self.assertEqual(string, str(coach))
