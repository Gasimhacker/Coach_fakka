#!/usr/bin/python3
"""
Contains the TestWorkoutDocs classes
"""

from datetime import datetime
import inspect
import models
from models import workout
from models.base_model import BaseModel
import pep8
import unittest
Workout = workout.Workout
members = inspect.getmembers(Workout, inspect.isfunction)


class TestWorkoutDocs(unittest.TestCase):
    """Tests to check the documentation and style of Workout class"""

    def test_pep8_conformance_workout(self):
        """Test that models/workout.py conforms to PEP8."""
        pep8s = pep8.StyleGuide(quiet=True)
        result = pep8s.check_files(['models/workout.py'])
        self.assertEqual(result.total_errors, 0,
                         "Found code style errors (and warnings).")

    def test_pep8_conformance_test_workout(self):
        """Test that tests/test_models/test_workout.py conforms to PEP8."""
        pep8s = pep8.StyleGuide(quiet=True)
        result = pep8s.check_files(['tests/test_models/test_workout.py'])
        self.assertEqual(result.total_errors, 0,
                         "Found code style errors (and warnings).")

    def test_workout_module_docstring(self):
        """Test for the workout.py module docstring"""
        self.assertIsNot(workout.__doc__, None,
                         "workout.py needs a docstring")
        self.assertTrue(len(workout.__doc__) >= 1,
                        "workout.py needs a docstring")

    def test_workout_class_docstring(self):
        """Test for the Workout class docstring"""
        self.assertIsNot(Workout.__doc__, None,
                         "Workout class needs a docstring")
        self.assertTrue(len(Workout.__doc__) >= 1,
                        "Workout class needs a docstring")

    def test_workout_func_docstrings(self):
        """Test for the presence of docstrings in Workout methods"""
        for func in members:
            self.assertIsNot(func[1].__doc__, None,
                             "{:s} method needs a docstring".format(func[0]))
            self.assertTrue(len(func[1].__doc__) >= 1,
                            "{:s} method needs a docstring".format(func[0]))


class TestWorkout(unittest.TestCase):
    """Test the Workout class"""
    def test_is_subclass(self):
        """Test that Workout is a subclass of BaseModel"""
        workout = Workout()
        self.assertIsInstance(workout, BaseModel)
        self.assertTrue(hasattr(workout, "id"))
        self.assertTrue(hasattr(workout, "created_at"))
        self.assertTrue(hasattr(workout, "updated_at"))
        self.assertTrue(hasattr(workout, "name"))

    def test_required_attrs(self):
        """Test that Workout has attributes name, email, and password"""
        workout = Workout()
        self.assertTrue(hasattr(workout, "name"))
        self.assertTrue(hasattr(workout, "client_id"))
        self.assertTrue(hasattr(workout, "number_exercises"))
        self.assertTrue(hasattr(workout, "note"))
        self.assertTrue(hasattr(workout, "done"))
        self.assertEqual(workout.name, None)
        self.assertEqual(workout.client_id, None)
        self.assertEqual(workout.number_exercises, None)
        self.assertEqual(workout.note, None)
        self.assertEqual(workout.done, None)

    def test_to_dict_creates_dict(self):
        """test to_dict method creates a dictionary with proper attrs"""
        s = Workout()
        new_d = s.to_dict()
        self.assertEqual(type(new_d), dict)
        self.assertFalse("_sa_instance_workout" in new_d)
        for attr in s.__dict__:
            if attr != "_sa_instance_state":
                self.assertTrue(attr in new_d)
        self.assertTrue("__class__" in new_d)

    def test_to_dict_values(self):
        """test that values in dict returned from to_dict are correct"""
        t_format = "%Y-%m-%dT%H:%M:%S.%f"
        s = Workout()
        new_d = s.to_dict()
        self.assertEqual(new_d["__class__"], "Workout")
        self.assertEqual(type(new_d["created_at"]), str)
        self.assertEqual(type(new_d["updated_at"]), str)
        self.assertEqual(new_d["created_at"], s.created_at.strftime(t_format))
        self.assertEqual(new_d["updated_at"], s.updated_at.strftime(t_format))

    def test_str(self):
        """test that the str method has the correct output"""
        workout = Workout()
        string = "[Workout] ({}) {}".format(workout.id, workout.__dict__)
        self.assertEqual(string, str(workout))
