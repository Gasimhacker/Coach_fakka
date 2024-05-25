#!/usr/bin/python3
"""
Contains the TestClientDocs classes
"""

from datetime import datetime
import inspect
import models
from models import client
from models.base_model import BaseModel
import pep8
import unittest
Client = client.Client
members = inspect.getmembers(Client, inspect.isfunction)


class TestClientDocs(unittest.TestCase):
    """Tests to check the documentation and style of Client class"""

    def test_pep8_conformance_client(self):
        """Test that models/client.py conforms to PEP8."""
        pep8s = pep8.StyleGuide(quiet=True)
        result = pep8s.check_files(['models/client.py'])
        self.assertEqual(result.total_errors, 0,
                         "Found code style errors (and warnings).")

    def test_pep8_conformance_test_client(self):
        """Test that tests/test_models/test_client.py conforms to PEP8."""
        pep8s = pep8.StyleGuide(quiet=True)
        result = pep8s.check_files(['tests/test_models/test_client.py'])
        self.assertEqual(result.total_errors, 0,
                         "Found code style errors (and warnings).")

    def test_client_module_docstring(self):
        """Test for the client.py module docstring"""
        self.assertIsNot(client.__doc__, None,
                         "client.py needs a docstring")
        self.assertTrue(len(client.__doc__) >= 1,
                        "client.py needs a docstring")

    def test_client_class_docstring(self):
        """Test for the Client class docstring"""
        self.assertIsNot(Client.__doc__, None,
                         "Client class needs a docstring")
        self.assertTrue(len(Client.__doc__) >= 1,
                        "Client class needs a docstring")

    def test_client_func_docstrings(self):
        """Test for the presence of docstrings in Client methods"""
        for func in members:
            self.assertIsNot(func[1].__doc__, None,
                             "{:s} method needs a docstring".format(func[0]))
            self.assertTrue(len(func[1].__doc__) >= 1,
                            "{:s} method needs a docstring".format(func[0]))


class TestClient(unittest.TestCase):
    """Test the Client class"""
    def test_is_subclass(self):
        """Test that Client is a subclass of BaseModel"""
        client = Client()
        self.assertIsInstance(client, BaseModel)
        self.assertTrue(hasattr(client, "id"))
        self.assertTrue(hasattr(client, "created_at"))
        self.assertTrue(hasattr(client, "updated_at"))
        self.assertTrue(hasattr(client, "name"))

    def test_required_attrs(self):
        """Test that Client has attributes name, email, and password"""
        client = Client()
        self.assertTrue(hasattr(client, "name"))
        self.assertTrue(hasattr(client, "coach_id"))
        self.assertTrue(hasattr(client, "email"))
        self.assertTrue(hasattr(client, "age"))
        self.assertTrue(hasattr(client, "gender"))
        self.assertTrue(hasattr(client, "weight"))
        self.assertTrue(hasattr(client, "height"))
        self.assertTrue(hasattr(client, "goal_weight"))
        self.assertTrue(hasattr(client, "training_place"))
        self.assertTrue(hasattr(client, "training_days"))
        self.assertTrue(hasattr(client, "training_hours"))
        self.assertTrue(hasattr(client, "activity_level"))
        self.assertTrue(hasattr(client, "need_supplements"))
        self.assertTrue(hasattr(client, "injury_history"))
        self.assertEqual(client.name, None)
        self.assertEqual(client.email, None)
        self.assertEqual(client.coach_id, None)
        self.assertEqual(client.email, None)
        self.assertEqual(client.age, None)
        self.assertEqual(client.gender, None)
        self.assertEqual(client.weight, None)
        self.assertEqual(client.height, None)
        self.assertEqual(client.goal_weight, None)
        self.assertEqual(client.training_place, None)
        self.assertEqual(client.training_days, None)
        self.assertEqual(client.training_hours, None)
        self.assertEqual(client.activity_level, None)
        self.assertEqual(client.need_supplements, None)
        self.assertEqual(client.injury_history, None)

    def test_to_dict_creates_dict(self):
        """test to_dict method creates a dictionary with proper attrs"""
        s = Client()
        new_d = s.to_dict()
        self.assertEqual(type(new_d), dict)
        self.assertFalse("_sa_instance_client" in new_d)
        for attr in s.__dict__:
            if attr != "_sa_instance_state":
                self.assertTrue(attr in new_d)
        self.assertTrue("__class__" in new_d)

    def test_to_dict_values(self):
        """test that values in dict returned from to_dict are correct"""
        t_format = "%Y-%m-%dT%H:%M:%S.%f"
        s = Client()
        new_d = s.to_dict()
        self.assertEqual(new_d["__class__"], "Client")
        self.assertEqual(type(new_d["created_at"]), str)
        self.assertEqual(type(new_d["updated_at"]), str)
        self.assertEqual(new_d["created_at"], s.created_at.strftime(t_format))
        self.assertEqual(new_d["updated_at"], s.updated_at.strftime(t_format))

    def test_str(self):
        """test that the str method has the correct output"""
        client = Client()
        string = "[Client] ({}) {}".format(client.id, client.__dict__)
        self.assertEqual(string, str(client))
