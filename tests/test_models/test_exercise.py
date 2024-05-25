#!/usr/bin/python3
"""
Contains the TestExerciseDocs classes
"""

from datetime import datetime
import inspect
import models
from models import exercise
from models.base_model import BaseModel
import pep8
import unittest
Exercise = exercise.Exercise
members = inspect.getmembers(Exercise, inspect.isfunction)


class TestExerciseDocs(unittest.TestCase):
    """Tests to check the documentation and style of Exercise class"""

    def test_pep8_conformance_exercise(self):
        """Test that models/exercise.py conforms to PEP8."""
        pep8s = pep8.StyleGuide(quiet=True)
        result = pep8s.check_files(['models/exercise.py'])
        self.assertEqual(result.total_errors, 0,
                         "Found code style errors (and warnings).")

    def test_pep8_conformance_test_exercise(self):
        """Test that tests/test_models/test_exercise.py conforms to PEP8."""
        pep8s = pep8.StyleGuide(quiet=True)
        result = pep8s.check_files(['tests/test_models/test_exercise.py'])
        self.assertEqual(result.total_errors, 0,
                         "Found code style errors (and warnings).")

    def test_exercise_module_docstring(self):
        """Test for the exercise.py module docstring"""
        self.assertIsNot(exercise.__doc__, None,
                         "exercise.py needs a docstring")
        self.assertTrue(len(exercise.__doc__) >= 1,
                        "exercise.py needs a docstring")

    def test_exercise_class_docstring(self):
        """Test for the Exercise class docstring"""
        self.assertIsNot(Exercise.__doc__, None,
                         "Exercise class needs a docstring")
        self.assertTrue(len(Exercise.__doc__) >= 1,
                        "Exercise class needs a docstring")

    def test_exercise_func_docstrings(self):
        """Test for the presence of docstrings in Exercise methods"""
        for func in members:
            self.assertIsNot(func[1].__doc__, None,
                             "{:s} method needs a docstring".format(func[0]))
            self.assertTrue(len(func[1].__doc__) >= 1,
                            "{:s} method needs a docstring".format(func[0]))


class TestExercise(unittest.TestCase):
    """Test the Exercise class"""
    def test_is_subclass(self):
        """Test that Exercise is a subclass of BaseModel"""
        exercise = Exercise()
        self.assertIsInstance(exercise, BaseModel)
        self.assertTrue(hasattr(exercise, "id"))
        self.assertTrue(hasattr(exercise, "created_at"))
        self.assertTrue(hasattr(exercise, "updated_at"))
        self.assertTrue(hasattr(exercise, "name"))

    def test_required_attrs(self):
        """Test that Exercise has attributes name, email, and password"""
        exercise = Exercise()
        self.assertTrue(hasattr(exercise, "name"))
        self.assertTrue(hasattr(exercise, "description"))
        self.assertTrue(hasattr(exercise, "link"))
        self.assertEqual(exercise.name, None)
        self.assertEqual(exercise.description, None)
        self.assertEqual(exercise.link, None)

    def test_to_dict_creates_dict(self):
        """test to_dict method creates a dictionary with proper attrs"""
        s = Exercise()
        new_d = s.to_dict()
        self.assertEqual(type(new_d), dict)
        self.assertFalse("_sa_instance_exercise" in new_d)
        for attr in s.__dict__:
            if attr != "_sa_instance_state":
                self.assertTrue(attr in new_d)
        self.assertTrue("__class__" in new_d)

    def test_to_dict_values(self):
        """test that values in dict returned from to_dict are correct"""
        t_format = "%Y-%m-%dT%H:%M:%S.%f"
        s = Exercise()
        new_d = s.to_dict()
        self.assertEqual(new_d["__class__"], "Exercise")
        self.assertEqual(type(new_d["created_at"]), str)
        self.assertEqual(type(new_d["updated_at"]), str)
        self.assertEqual(new_d["created_at"], s.created_at.strftime(t_format))
        self.assertEqual(new_d["updated_at"], s.updated_at.strftime(t_format))

    def test_str(self):
        """test that the str method has the correct output"""
        exercise = Exercise()
        string = "[Exercise] ({}) {}".format(exercise.id, exercise.__dict__)
        self.assertEqual(string, str(exercise))
